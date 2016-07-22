/******************************************************************************
 This Source Code Form is subject to the terms of the
 Open Hardware Description License, v. 1.0. If a copy
 of the OHDL was not distributed with this file, You
 can obtain one at http://juliusbaxter.net/ohdl/ohdl.txt

 Description: Data cache implementation

 Copyright (C) 2012-2013
    Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>
    Stefan Wallentowitz <stefan.wallentowitz@tum.de>

 ******************************************************************************/

`include "mor1kx-defines.v"

module mor1kx_dcache
  #(
    parameter OPTION_OPERAND_WIDTH = 32,
    parameter OPTION_DCACHE_BLOCK_WIDTH = 5,
    parameter OPTION_DCACHE_SET_WIDTH = 9,
    parameter OPTION_DCACHE_WAYS = 2,
    parameter OPTION_DCACHE_LIMIT_WIDTH = 32,
    parameter OPTION_DCACHE_SNOOP = "Yes"
    )
   (
    input 			      clk,
    input 			      rst,

    input 			      dc_dbus_err_i,
    input 			      dc_enable_i,
    input 			      dc_access_i,
    output 			      refill_o,
    output 			      refill_req_o,
    output 			      refill_done_o,

    // CPU Interface
    output 			      cpu_err_o,
    output 			      cpu_ack_o,
    output reg [OPTION_OPERAND_WIDTH-1:0] cpu_dat_o,
    input [OPTION_OPERAND_WIDTH-1:0]  cpu_dat_i,
    input [OPTION_OPERAND_WIDTH-1:0]  cpu_adr_i,
    input [OPTION_OPERAND_WIDTH-1:0]  cpu_adr_match_i,
    input 			      cpu_req_i,
    input 			      cpu_we_i,
    input [3:0] 		      cpu_bsel_i,

    input 			      refill_allowed,

    input [OPTION_OPERAND_WIDTH-1:0]  wradr_i,
    input [OPTION_OPERAND_WIDTH-1:0]  wrdat_i,
    input 			      we_i,

    // Snoop address
    input [31:0] 		      snoop_adr_i,
    // Snoop event in this cycle
    input 			      snoop_valid_i,
    // Whether the snoop hit. If so, there will be no tag memory write
    // this cycle. The LSU may need to stall the pipeline.
    output 			      snoop_hit_o,
    output [31:0]		  snoop_dat_o,
    output 				  snoop_valid_dat_o,

    // SPR interface
    input [15:0] 		      spr_bus_addr_i,
    input 			      spr_bus_we_i,
    input 			      spr_bus_stb_i,
    input [OPTION_OPERAND_WIDTH-1:0]  spr_bus_dat_i,

    output [OPTION_OPERAND_WIDTH-1:0] spr_bus_dat_o,
    output 			      spr_bus_ack_o
    );

   // States
   localparam IDLE		= 6'b000001;
   localparam READ		= 6'b000010;
   localparam WRITE		= 6'b000100;
   localparam REFILL		= 6'b001000;
   localparam INVALIDATE	= 6'b010000;
   localparam SNOOPHIT 		= 6'b100000;

   // Address space in bytes for a way
   localparam WAY_WIDTH = OPTION_DCACHE_BLOCK_WIDTH + OPTION_DCACHE_SET_WIDTH;
   /*
    * Tag memory layout
    *            +---------------------------------------------------------+
    * (index) -> | LRU | wayN valid | wayN tag |...| way0 valid | way0 tag |
    *            +---------------------------------------------------------+
    */

   // The tag is the part left of the index
   localparam TAG_WIDTH = (OPTION_DCACHE_LIMIT_WIDTH - WAY_WIDTH);

   // The tag memory contains entries with OPTION_DCACHE_WAYS parts of
   // each TAGMEM_WAY_WIDTH. Each of those is tag and a valid flag.
   //TAGMEM_STATUS_BITS is the number of status bits which are VALIDITY and DIRTY
   localparam TAGMEM_STATUS_BITS = 2;
   localparam TAGMEM_WAY_WIDTH = TAG_WIDTH + TAGMEM_STATUS_BITS;
   localparam TAGMEM_WAY_VALID = TAGMEM_WAY_WIDTH - 2; // The seconds status bit is the validity bit.
   localparam TAGMEM_WAY_DIRTY = TAGMEM_WAY_WIDTH - 1; // The first status bit is the dirty bit.

   // Additionally, the tag memory entry contains an LRU value. The
   // width of this is 0 for OPTION_DCACHE_LIMIT_WIDTH==1
   localparam TAG_LRU_WIDTH = OPTION_DCACHE_WAYS*(OPTION_DCACHE_WAYS-1) >> 1;

   // We have signals for the LRU which are not used for one way
   // caches. To avoid signal width [-1:0] this generates [0:0]
   // vectors for them, which are removed automatically then.
   localparam TAG_LRU_WIDTH_BITS = (OPTION_DCACHE_WAYS >= 2) ? TAG_LRU_WIDTH : 1;

   // Compute the total sum of the entry elements
   localparam TAGMEM_WIDTH = TAGMEM_WAY_WIDTH * OPTION_DCACHE_WAYS + TAG_LRU_WIDTH;

   // For convenience we define the position of the LRU in the tag
   // memory entries
   localparam TAG_LRU_MSB = TAGMEM_WIDTH - 1;
   localparam TAG_LRU_LSB = TAG_LRU_MSB - TAG_LRU_WIDTH + 1;

   // FSM state signals
   reg [5:0] 			      state;
   wire				      read;  
   wire				      write;
   wire				      refill;
   wire 				snoop_hit_state;

   reg [WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH] invalidate_adr;
   wire [31:0] 			      next_refill_adr;
   reg [31:0] 			      way_wr_dat;
   wire 			      refill_done;
   wire 			      refill_hit;
   reg [(1<<(OPTION_DCACHE_BLOCK_WIDTH-2))-1:0] refill_valid;
   reg [(1<<(OPTION_DCACHE_BLOCK_WIDTH-2))-1:0] refill_valid_r;
   wire				      invalidate;

   // The index we read and write from tag memory
   wire [OPTION_DCACHE_SET_WIDTH-1:0] tag_rindex;
   reg [OPTION_DCACHE_SET_WIDTH-1:0]  tag_windex;

   // The data from the tag memory
   wire [TAGMEM_WIDTH-1:0] 	      tag_dout;
   wire [TAG_LRU_WIDTH_BITS-1:0]      tag_lru_out;
   wire [TAGMEM_WAY_WIDTH-1:0] 	      tag_way_out [OPTION_DCACHE_WAYS-1:0];

   // The data to the tag memory
   wire [TAGMEM_WIDTH-1:0] 	      tag_din;
   reg [TAG_LRU_WIDTH_BITS-1:0]       tag_lru_in;
   reg [TAGMEM_WAY_WIDTH-1:0] 	      tag_way_in [OPTION_DCACHE_WAYS-1:0];

   reg [TAGMEM_WAY_WIDTH-1:0] 	      tag_way_save[OPTION_DCACHE_WAYS-1:0];

   // Whether to write to the tag memory in this cycle
   reg 				      tag_we;

   // This is the tag we need to write to the tag memory during refill
   wire [TAG_WIDTH-1:0] 	      tag_wtag;

   // This is the tag we check against
   wire [TAG_WIDTH-1:0] 	      tag_tag;

   // Access to the way memories
   wire [WAY_WIDTH-3:0] 	      way_raddr[OPTION_DCACHE_WAYS-1:0];
   //wire [WAY_WIDTH-3:0] 	      way_snooped_raddr[OPTION_DCACHE_WAYS-1:0];
   wire [WAY_WIDTH-3:0] 	      way_waddr[OPTION_DCACHE_WAYS-1:0];
   wire [OPTION_OPERAND_WIDTH-1:0]    way_din[OPTION_DCACHE_WAYS-1:0];
   wire [OPTION_OPERAND_WIDTH-1:0]    way_dout[OPTION_DCACHE_WAYS-1:0];
   reg  [OPTION_DCACHE_WAYS-1:0]       way_we;
   // A special wire that contains the address to be passed to the data ram
   wire [WAY_WIDTH-3:0]			way_raddr_muxed[OPTION_DCACHE_WAYS-1:0];

   // Does any way hit?
   wire 			      hit;
   wire [OPTION_DCACHE_WAYS-1:0]      way_hit;

   // This is the least recently used value before access the memory.
   // Those are one hot encoded.
   wire [OPTION_DCACHE_WAYS-1:0]      lru;

   // Register that stores the LRU value from lru
   reg [OPTION_DCACHE_WAYS-1:0]       tag_save_lru;

   // The access vector to update the LRU history is the way that has
   // a hit or is refilled. It is also one-hot encoded.
   reg [OPTION_DCACHE_WAYS-1:0]       access;

   // The current LRU history as read from tag memory and the update
   // value after we accessed it to write back to tag memory.
   wire [TAG_LRU_WIDTH_BITS-1:0]      current_lru_history;
   wire [TAG_LRU_WIDTH_BITS-1:0]      next_lru_history;

   // Intermediate signals to ease debugging
   wire [TAG_WIDTH-1:0]               check_way_tag [OPTION_DCACHE_WAYS-1:0];
   wire                               check_way_match [OPTION_DCACHE_WAYS-1:0];
   wire                               check_way_valid [OPTION_DCACHE_WAYS-1:0];

   reg 				      write_pending;

   reg   write_aborted;

   // Extract index to read from snooped address
   wire [OPTION_DCACHE_SET_WIDTH-1:0] snoop_index;
   assign snoop_index = snoop_adr_i[WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH];

   // Register that is high one cycle after the actual snoop event to
   // drive the comparison
   reg 				      snoop_check;
   // Register that stores the tag for one cycle
   reg [TAG_WIDTH-1:0] 		      snoop_tag;
   // Also store the index for one cycle, for the succeeding write access
   reg [OPTION_DCACHE_SET_WIDTH-1:0]  snoop_windex;

   // Snoop tag memory interface
   // Data out of tag memory
   wire [TAGMEM_WIDTH-1:0] 	      snoop_dout;
   // Each ways information in the tag memory
   wire [TAGMEM_WAY_WIDTH-1:0] 	      snoop_way_out [OPTION_DCACHE_WAYS-1:0];
   // Each ways tag in the tag memory
   wire [TAG_WIDTH-1:0] 	      snoop_check_way_tag [OPTION_DCACHE_WAYS-1:0];
   // Whether the tag matches the snoop tag
   wire                               snoop_check_way_match [OPTION_DCACHE_WAYS-1:0];
   // Whether the tag is valid
   wire                               snoop_check_way_valid [OPTION_DCACHE_WAYS-1:0];
   // Whether the way hits
   wire [OPTION_DCACHE_WAYS-1:0]      snoop_way_hit;
   // Whether any way hits
   wire 			      snoop_hit;
   // Wheter the snooped data is retrieved.
   reg [31:0] 			  snoop_dat;
   reg 				  snoop_valid_dat;

   assign snoop_hit_o = (OPTION_DCACHE_SNOOP != "NONE") ? snoop_hit : 0;
   assign snoop_dat_o = (OPTION_DCACHE_SNOOP != "NONE") ? snoop_dat : 32'bx;
   assign snoop_valid_dat_o = (OPTION_DCACHE_SNOOP != "NONE") ? snoop_valid_dat : 0;

   genvar 			      i;

   assign cpu_ack_o = ((read | refill) & hit & !write_pending |
		       refill_hit) & cpu_req_i & !snoop_hit;

   assign tag_rindex = cpu_adr_i[WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH];

   assign tag_tag = cpu_adr_match_i[OPTION_DCACHE_LIMIT_WIDTH-1:WAY_WIDTH];
   assign tag_wtag = wradr_i[OPTION_DCACHE_LIMIT_WIDTH-1:WAY_WIDTH];

   generate
      if (OPTION_DCACHE_WAYS >= 2) begin
         // Multiplex the LRU history from and to tag memory
         assign current_lru_history = tag_dout[TAG_LRU_MSB:TAG_LRU_LSB];
         assign tag_din[TAG_LRU_MSB:TAG_LRU_LSB] = tag_lru_in;
         assign tag_lru_out = tag_dout[TAG_LRU_MSB:TAG_LRU_LSB];
      end

      for (i = 0; i < OPTION_DCACHE_WAYS; i=i+1) begin : ways
	  	assign way_raddr[i] = cpu_adr_i[WAY_WIDTH-1:2];
	  	// Update the muxed wires
	  	assign way_raddr_muxed[i] = (snoop_hit & snoop_hit_state) ? snoop_adr_i[WAY_WIDTH-1:2] : way_raddr[i];
	  	assign way_waddr[i] = write ? cpu_adr_match_i[WAY_WIDTH-1:2] :
	  			       wradr_i[WAY_WIDTH-1:2];
	  	assign way_din[i] = way_wr_dat;

	  	// compare stored tag with incoming tag and check valid bit
	    assign check_way_tag[i] = tag_way_out[i][TAG_WIDTH-1:0];
	    assign check_way_match[i] = (check_way_tag[i] == tag_tag);
	    assign check_way_valid[i] = tag_way_out[i][TAGMEM_WAY_VALID];

	    assign way_hit[i] = check_way_valid[i] & check_way_match[i];

	    // Multiplex the way entries in the tag memory
	    assign tag_din[(i+1)*TAGMEM_WAY_WIDTH-1:i*TAGMEM_WAY_WIDTH] = tag_way_in[i];
	    assign tag_way_out[i] = tag_dout[(i+1)*TAGMEM_WAY_WIDTH-1:i*TAGMEM_WAY_WIDTH];

	    if (OPTION_DCACHE_SNOOP != "NONE") begin
	          // The same for the snoop tag memory
           assign snoop_way_out[i] = snoop_dout[(i+1)*TAGMEM_WAY_WIDTH-1:i*TAGMEM_WAY_WIDTH];

           assign snoop_check_way_tag[i] = snoop_way_out[i][TAG_WIDTH-1:0];
    	   assign snoop_check_way_match[i] = (snoop_check_way_tag[i] == snoop_tag);
    	   assign snoop_check_way_valid[i] = snoop_way_out[i][TAGMEM_WAY_VALID];

    	   assign snoop_way_hit[i] = snoop_check_way_valid[i] & snoop_check_way_match[i];
	    end
      end
   endgenerate

   assign hit = |way_hit;

   assign snoop_hit = (OPTION_DCACHE_SNOOP != "NONE") &
		      |snoop_way_hit & snoop_check;

   integer w0;
   always @(*) begin
      cpu_dat_o = {OPTION_OPERAND_WIDTH{1'bx}};
      // Set the default value for the snoop dat output to undefined.
      //snoop_dat = {OPTION_OPERAND_WIDTH{1'bx}};	<-- there is also this operation in the synchronous FSM.

      // Put correct way on the data port
      for (w0 = 0; w0 < OPTION_DCACHE_WAYS; w0 = w0 + 1) begin
         if (way_hit[w0] | (refill_hit & tag_save_lru[w0])) begin
            cpu_dat_o = way_dout[w0];
         end
      end
   end
   		// Only when I am in the SNOOPHIT state I change the value of the snoop_dat_o
   	if (snoop_hit & snoop_hit_state) begin
   		for (w0 = 0; w0 < OPTION_DCACHE_WAYS; w0 = w0 + 1) begin
   			if (snoop_way_hit[w0]) begin
   				// In this situation the data_ram has on its output wire the snooped data.
   				snoop_dat = way_dout[w0];
   			end
   		end
   	end

   assign next_refill_adr = (OPTION_DCACHE_BLOCK_WIDTH == 5) ?
			    {wradr_i[31:5], wradr_i[4:0] + 5'd4} : // 32 byte
			    {wradr_i[31:4], wradr_i[3:0] + 4'd4};  // 16 byte

   assign refill_done_o = refill_done;
   assign refill_done = refill_valid[next_refill_adr[OPTION_DCACHE_BLOCK_WIDTH-1:2]];
   assign refill_hit = refill_valid_r[cpu_adr_match_i[OPTION_DCACHE_BLOCK_WIDTH-1:2]] &
		       cpu_adr_match_i[OPTION_DCACHE_LIMIT_WIDTH-1:
				       OPTION_DCACHE_BLOCK_WIDTH] ==
		       wradr_i[OPTION_DCACHE_LIMIT_WIDTH-1:
			       OPTION_DCACHE_BLOCK_WIDTH] &
		       refill & !write_pending;

   assign refill = (state == REFILL);
   assign read = (state == READ);
   assign write = (state == WRITE);
   assign snoop_hit_state = (state == SNOOPHIT);

   assign refill_o = refill;

   assign refill_req_o = read & cpu_req_i & !hit & !write_pending & refill_allowed | refill;

   /*
    * SPR bus interface
    */

   // The SPR interface is used to invalidate the cache blocks. When
   // an invalidation is started, the respective entry in the tag
   // memory is cleared. When another transfer is in progress, the
   // handling is delayed until it is possible to serve it.
   //
   // The invalidation is acknowledged to the SPR bus, but the cycle
   // is terminated by the core. We therefore need to hold the
   // invalidate acknowledgement. Meanwhile we continuously write the
   // tag memory which is no problem.

   // Net that signals an acknowledgement
   reg invalidate_ack;

   // An invalidate request is either a block flush or a block invalidate
   assign invalidate = spr_bus_stb_i & spr_bus_we_i &
		       (spr_bus_addr_i == `OR1K_SPR_DCBFR_ADDR |
			spr_bus_addr_i == `OR1K_SPR_DCBIR_ADDR);

   // Acknowledge to the SPR bus.
   assign spr_bus_ack_o = invalidate_ack;

   /*-----------------------------------------------------------------------------------
   -------------------------------------------------------------------------------------
   --------------------------------------IMP--------------------------------------------
   *************************************************************************************
    * Cache FSM
    * Starts in IDLE.
    * State changes between READ and WRITE happens cpu_we_i is asserted or not.
    * cpu_we_i is in sync with cpu_adr_i, so that means that it's the
    * *upcoming* write that it is indicating. It only toggles for one cycle,
    * so if we are busy doing something else when this signal comes
    * (i.e. refilling) we assert the write_pending signal.
    * cpu_req_i is in sync with cpu_adr_match_i, so it can be used to
    * determined if a cache hit should cause a refill or if a write should
    * really be executed.
    */
   integer w1;
   always @(posedge clk `OR_ASYNC_RST) begin
      if (rst) begin
	 state <= IDLE;
	 write_pending <= 0;
      end else if(dc_dbus_err_i) begin
	 state <= IDLE;
	 write_pending <= 0;
      end else begin
	 if (cpu_we_i)
	   write_pending <= 1;
	 else if (!cpu_req_i)
	   write_pending <= 0;

	 refill_valid_r <= refill_valid;

	 if (snoop_valid_i) begin
	    //
	    // If there is a snoop event, we need to store this
	    // information. This happens independent of whether we
	    // have a snoop tag memory or not.
	    //
	    snoop_check <= 1;
	    snoop_windex <= snoop_index;
	    snoop_tag <= snoop_adr_i[OPTION_DCACHE_LIMIT_WIDTH-1:WAY_WIDTH];
	 end else begin
	    snoop_check <= 0;
	 end

	 case (state)
	   IDLE: begin
	   	  if (snoop_hit) begin
	   	  	// If there was a snoop_hit
	   	  	//
	   	  	// Go to the dedicated state where we extract the data from the memory.
	   	  	//snoop_valid_dat <= 0;

	   	  	state <= SNOOPHIT;

	      end else if (invalidate) begin
        		 // If there is an invalidation request
        		 //
        		 // Store address in invalidate_adr that is muxed to the tag
        		 // memory write address
        		 invalidate_adr <= spr_bus_dat_i[WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH];

        		 // Change to invalidate state that actually accesses
        		 // the tag memory
        		 state <= INVALIDATE;
        end else if (cpu_we_i | write_pending)
        		state <= WRITE;
	      else if (cpu_req_i)
        		state <= READ;
	   end

	   READ: begin
		    if (dc_access_i | cpu_we_i & dc_enable_i) begin
			    if (!hit & cpu_req_i & !write_pending & refill_allowed) begin
			      refill_valid <= 0;
			      refill_valid_r <= 0;

			      // Store the LRU information for correct replacement
	                    // on refill. Always one when only one way.
	          	  tag_save_lru <= (OPTION_DCACHE_WAYS==1) | lru;

			      for (w1 = 0; w1 < OPTION_DCACHE_WAYS; w1 = w1 + 1) begin
			        tag_way_save[w1] <= tag_way_out[w1];
			      end

			      state <= REFILL;
			    end else if (cpu_we_i | write_pending) begin
			      state <= WRITE;
			    end else if (invalidate) begin
			      state <= IDLE;
			    end else if (snoop_hit) begin
			      state <= IDLE;
			    end
	     	end else if (!dc_enable_i | invalidate | snoop_hit) begin
			    state <= IDLE;
		    end
	    end

	   REFILL: begin
		    if (we_i) begin
        		 refill_valid[wradr_i[OPTION_DCACHE_BLOCK_WIDTH-1:2]] <= 1;

        		 if (refill_done)
        		   state <= IDLE;
	        end
	        	      // Abort refill on snoop-hit
	        	      // TODO: only abort on snoop-hits to refill address
	        if (snoop_hit) begin
	        		 refill_valid <= 0;
	        		 refill_valid_r <= 0;
	        		 state <= IDLE;
	        end
	   end

	   WRITE: begin
	      if ((!dc_access_i | !cpu_req_i | !cpu_we_i | write_aborted) & !snoop_hit) begin
		        write_pending <= 0;
            	write_aborted <= 0;
		        state <= READ;
	      end else if (snoop_hit & (!write_pending | write_aborted)) begin
	      		// When we have a snoop_hit during a cache write we wait for the end of the write
            // (unless it has been aborted), then we pass directly to the idle state
	      		state <= IDLE;
	      end
	   end

	   INVALIDATE: begin
	      if (invalidate) begin
			 // Store address in invalidate_adr that is muxed to the tag
			 // memory write address
			 invalidate_adr <= spr_bus_dat_i[WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH];

			 state <= INVALIDATE;
	      end else begin
		 	state <= IDLE;
	      end
	   end

	   SNOOPHIT: begin
	   		if (snoop_valid_dat) begin
	   			state <= IDLE;
	   			// The snoop has been handled, thus I reset the special registers
	   			snoop_valid_dat <= 0;
	    		snoop_dat <= 32'bx;
	   		end

	   end


	   default:
	     state <= IDLE;
	 endcase
      end
   end

   //
   // This is the combinational part of the state machine that
   // interfaces the tag and way memories.
   //
   integer w2;
   always @(*) begin
      // Default is to keep data, don't write and don't access
      tag_lru_in = tag_lru_out;
      for (w2 = 0; w2 < OPTION_DCACHE_WAYS; w2 = w2 + 1) begin
         tag_way_in[w2] = tag_way_out[w2];
      end

      tag_we = 1'b0;
      way_we = {(OPTION_DCACHE_WAYS){1'b0}};

      access = {(OPTION_DCACHE_WAYS){1'b0}};

      way_wr_dat = wrdat_i;

      // The default is (of course) not to acknowledge the invalidate
      invalidate_ack = 1'b0;

      if (snoop_hit) begin
	       // This is the write access
	       tag_we = 1'b1;
	       tag_windex = snoop_windex;
	       for (w2 = 0; w2 < OPTION_DCACHE_WAYS; w2 = w2 + 1) begin
	           if (snoop_way_hit[w2]) begin
	               tag_way_in[w2][TAGMEM_WAY_VALID] = 1'b0;
	           end else begin
	               tag_way_in[w2] = snoop_way_out[w2];
	           end
	       end
      end else begin
	 //
	 // The tag mem is written during reads and writes to write
	 // the lru info and  during refill and invalidate.
	 //
	 tag_windex = read | write ?
		      cpu_adr_match_i[WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH] :
		      (state == INVALIDATE) ? invalidate_adr :
		      wradr_i[WAY_WIDTH-1:OPTION_DCACHE_BLOCK_WIDTH];

	 case (state)
	   IDLE: begin
	      //
	      // When idle we can always acknowledge the invalidate as it
	      // has the highest priority in handling. When something is
	      // changed on the state machine handling above this needs
	      // to be changed.
	      //
	      invalidate_ack = 1'b1;
	   end

	   READ: begin
	      if (hit) begin
			 //
			 // We got a hit. The LRU module gets the access
			 // information. Depending on this we update the LRU
			 // history in the tag.
			 //
			 access = way_hit;

			 // This is the updated LRU history after hit
			 tag_lru_in = next_lru_history;

			 tag_we = 1'b1;
	      end
	   end

	   WRITE: begin
	      way_wr_dat = cpu_dat_i;
        // To be sure that we do not enter in this condition twice in the same clock cycle when the write has been aborted
        // we add the condition !write_aborted in bitwise and at the if. 
	      if (hit & cpu_req_i & !write_aborted) begin

        		 /* Mux cache output with write data */
        		 if (!cpu_bsel_i[3])
        		   way_wr_dat[31:24] = cpu_dat_o[31:24];
        		 if (!cpu_bsel_i[2])
        		   way_wr_dat[23:16] = cpu_dat_o[23:16];
        		 if (!cpu_bsel_i[1])
        		   way_wr_dat[15:8] = cpu_dat_o[15:8];
        		 if (!cpu_bsel_i[0])
        		   way_wr_dat[7:0] = cpu_dat_o[7:0];

             // The content of the block in which we are writing is into the register cpu_dat_o.
             // If war_wr_dat == cpu_dat_o we do not write nothing
              if (way_wr_dat == cpu_dat_o) begin
                  // We use some signal to notify this case?
                  write_aborted = 1;

              end else begin

            	      way_we = way_hit;

             	      tag_lru_in = next_lru_history;

              		  tag_we = 1'b1;

                    // Now we should update the dirty bit of the block in which we will write
                    // Hyphotesis: since we have had a write hit, we will write on the way in which we have found the data.
                    for (w2 = 0; w2 < OPTION_DCACHE_WAYS; w2 = w2 + 1) begin
                             if (way_hit[w2]) begin
                                   tag_way_in[w2][TAGMEM_WAY_DIRTY] = 1'b1;
                             end
                    end
              end
	      end
	   end

	   REFILL: begin
	      if (we_i) begin
		 //
		 // Write the data to the way that is replaced (which is
		 // the LRU)
		 //
		 way_we = tag_save_lru;

		 // Access pattern
		 access = tag_save_lru;

		 /* Invalidate the way on the first write */
		 if (refill_valid == 0) begin
		    for (w2 = 0; w2 < OPTION_DCACHE_WAYS; w2 = w2 + 1) begin
                       if (tag_save_lru[w2]) begin
			                       tag_way_in[w2][TAGMEM_WAY_VALID] = 1'b0;
                       end
                    end

		    tag_we = 1'b1;
		 end

		 //
		 // After refill update the tag memory entry of the
		 // filled way with the LRU history, the tag and set
		 // valid to 1.
		 //
		 if (refill_done) begin
		    for (w2 = 0; w2 < OPTION_DCACHE_WAYS; w2 = w2 + 1) begin
		        tag_way_in[w2] = tag_way_save[w2];
            if (tag_save_lru[w2]) begin
			         tag_way_in[w2] = { 2'b01, tag_wtag }; // Add the status bits: clear and valid
            end
        end
        tag_lru_in = next_lru_history;

		    tag_we = 1'b1;
		 end
	      end
	   end

	   INVALIDATE: begin
	      invalidate_ack = 1'b1;

	      // Lazy invalidation, invalidate everything that matches tag address
              tag_lru_in = 0;
              for (w2 = 0; w2 < OPTION_DCACHE_WAYS; w2 = w2 + 1) begin
		                  tag_way_in[w2][TAGMEM_WAY_VALID] = 1'b0;
              end

	      tag_we = 1'b1;
	   end

	   SNOOPHIT: begin
	   		// To be sure the write enable wire is zeroed
	   		way_we = {(OPTION_DCACHE_WAYS){1'b0}};

	   		// The address that need to be passed to the data_ram to obtain the snooped data
	   		// is automatically updated with the assign on the way_raddr_muxed wire.
	   		// Hence, we need just to wait for a change of the output of the data ram to 
	   		// consider the snooped operation finished. 
	   		// We suppose that we just need to wait for the next posedge clock cycle since the
	   		// reading of a data requires exactly one cycles and there is no way to include
	   		// an array into the sensitivity list.
	   		// In addition this choice is "a little bit" more secure than the one described
	   		// above since it can happens that the snooped data and the previous one are exactly
	   		// the same. 
	   		always @(posedge clk) begin : end_of_snooped_data_retrieving_
	   			// Set to 1 the snoop_valid_dat signal to notify both the cache and the 
	   			// "external" that the snooped data has been retrieved.
	   			snoop_valid_dat <= 1;
	   			// The data will be set to the correct value in the dedicated code above.
	   		end

	   end

	   default: begin
	   end
	 endcase
      end
   end

   generate
      for (i = 0; i < OPTION_DCACHE_WAYS; i=i+1) begin : way_memories
	 mor1kx_simple_dpram_sclk
	       #(
		 .ADDR_WIDTH(WAY_WIDTH-2),
		 .DATA_WIDTH(OPTION_OPERAND_WIDTH),
		 .ENABLE_BYPASS(1)
		 )
	 way_data_ram
	       (
		// Outputs
		.dout			(way_dout[i]),
		// Inputs
		.clk			(clk),
		.raddr			(way_raddr_muxed[i][WAY_WIDTH-3:0]),
		.re			(1'b1),
		.waddr			(way_waddr[i][WAY_WIDTH-3:0]),
		.we			(way_we[i]),
		.din			(way_din[i][31:0]));

      end

      if (OPTION_DCACHE_WAYS >= 2) begin : gen_u_lru
         /* mor1kx_cache_lru AUTO_TEMPLATE(
          .current  (current_lru_history),
          .update   (next_lru_history),
          .lru_pre  (lru),
          .lru_post (),
          .access   (access),
          ); */

         mor1kx_cache_lru
           #(.NUMWAYS(OPTION_DCACHE_WAYS))
         u_lru(/*AUTOINST*/
	       // Outputs
	       .update			(next_lru_history),	 // Templated
	       .lru_pre			(lru),			 // Templated
	       .lru_post		(),			 // Templated
	       // Inputs
	       .current			(current_lru_history),	 // Templated
	       .access			(access));		 // Templated
      end // if (OPTION_DCACHE_WAYS >= 2)
   endgenerate

   mor1kx_simple_dpram_sclk
     #(
       .ADDR_WIDTH(OPTION_DCACHE_SET_WIDTH),
       .DATA_WIDTH(TAGMEM_WIDTH),
       .ENABLE_BYPASS(OPTION_DCACHE_SNOOP != "NONE")
     )
   tag_ram
     (
      // Outputs
      .dout				(tag_dout[TAGMEM_WIDTH-1:0]),
      // Inputs
      .clk				(clk),
      .raddr				(tag_rindex),
      .re				(1'b1),
      .waddr				(tag_windex),
      .we				(tag_we),
      .din				(tag_din));

generate
if (OPTION_DCACHE_SNOOP != "NONE") begin
   mor1kx_simple_dpram_sclk
     #(
       .ADDR_WIDTH(OPTION_DCACHE_SET_WIDTH),
       .DATA_WIDTH(TAGMEM_WIDTH),
       .ENABLE_BYPASS(1)
       )
   snoop_tag_ram
     (
      // Outputs
      .dout			(snoop_dout[TAGMEM_WIDTH-1:0]),
      // Inputs
      .clk			(clk),
      .raddr			(snoop_index),
      .re			(1'b1),
      .waddr			(tag_windex),
      .we			(tag_we),
      .din			(tag_din));
end
endgenerate

endmodule