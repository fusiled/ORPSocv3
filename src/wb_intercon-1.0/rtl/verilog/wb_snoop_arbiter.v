module wb_snoop_arbiter
 #(parameter dw = 32,
   parameter aw = 32,
   parameter num_cores = 2)
  (
   input 		       wb_clk_i,
   input 		       wb_rst_i,

   // Wishbone Master Interface
   input [num_cores*aw-1:0]  wbm_adr_i,
   input [num_cores*dw-1:0]  wbm_dat_i,
   input [num_cores*4-1:0]   wbm_sel_i,
   input [num_cores-1:0]     wbm_we_i,
   input [num_cores-1:0]     wbm_cyc_i,
   input [num_cores-1:0]     wbm_stb_i,
   input [num_cores*3-1:0]   wbm_cti_i,
   input [num_cores*2-1:0]   wbm_bte_i,
   output [num_cores*dw-1:0] wbm_dat_o,
   output [num_cores-1:0]    wbm_ack_o,
   output [num_cores-1:0]    wbm_err_o,
   output [num_cores-1:0]    wbm_rty_o, 

   // Wishbone Slave interface
   output [aw-1:0] 	       wbs_adr_o,
   output [dw-1:0] 	       wbs_dat_o,
   output [3:0] 	       wbs_sel_o, 
   output 		       wbs_we_o,
   output 		       wbs_cyc_o,
   output 		       wbs_stb_o,
   output [2:0] 	       wbs_cti_o,
   output [1:0] 	       wbs_bte_o,
   input [dw-1:0] 	       wbs_dat_i,
   input 		       wbs_ack_i,
   input 		       wbs_err_i,
   input 		       wbs_rty_i,


   //snoop interface
   output reg [num_cores*aw-1:0] snoop_adr_o,
   output reg [1:0] snoop_type_o,
   input [num_cores*2-1:0] snoop_response_i,
   input [num_cores*dw-1:0] snooped_dat_i
   );

   `include "verilog_utils.vh"

///////////////////////////////////////////////////////////////////////////////
// Parameters
///////////////////////////////////////////////////////////////////////////////
   

   reg [dw-1:0] snooped_dat;
   
   localparam master_sel_bits = num_cores > 1 ? `clog2(num_cores) : 1;
   wire [num_cores-1:0]     grant;
   wire [master_sel_bits-1:0] master_sel;
   wire           active;

   reg poll_response_flag;

   reg [num_cores-1:0] arbiter_cyc;
   reg [aw-1:0] snoop_adr_reg;
   reg [num_cores-1:0] saved_request;
   reg mem_access_active;
   
   reg [3:0] state;
   localparam IDLE = 4'b0001;
   localparam SNOOP_WRITE = 4'b0010;
   localparam SNOOP_READ = 4'b0100;
   localparam MEM_ACCESS = 4'b1000;

   
   localparam SNOOP_TYPE_IDLE = 2'b00;
   localparam SNOOP_TYPE_READ = 2'b01;
   localparam SNOOP_TYPE_WRITE = 2'b10;
   localparam SNOOP_TYPE_NOT_USED = 2'b11;

   localparam POLL_RESPONSE_UNDEFINED = 2'b10;
   localparam POLL_RESPONSE_POSITIVE = 2'b11;
   localparam POLL_RESPONSE_NEGATIVE = 2'b00;

   localparam SNOOP_READ_DATA_POSITIVE = 2'b11;
   localparam SNOOP_READ_DATA_NEGATIVE = 2'b00;
   localparam SNOOP_READ_POLL_FAILED = 0;
   localparam SNOOP_READ_DATA_UNDEFINED = 2'b10;
   
   
   reg [num_cores-1:0] poll_result;
   reg [num_cores-1:0]snoop_datum_owner;
   reg [master_sel_bits-1:0] saved_master_sel;
   integer snoop_dat_owner;

   
   arbiter
     #(.NUM_PORTS (num_cores))
   arbiter0
     (.clk (wb_clk_i),
      .rst (wb_rst_i),
      .request (arbiter_cyc),
      .grant (grant),
      .select (master_sel),
      .active (active));
	  
   

//TODO snoop in progress
   //Mux active master
   assign wbs_adr_o = wbm_adr_i[master_sel*aw+:aw];
   assign wbs_dat_o = wbm_dat_i[master_sel*dw+:dw];
   assign wbs_sel_o = wbm_sel_i[master_sel*4+:4];
   assign wbs_we_o  = wbm_we_i [master_sel];
   assign wbs_cyc_o = wbm_cyc_i[master_sel] & active;
   assign wbs_stb_o = wbm_stb_i[master_sel];
   assign wbs_cti_o = wbm_cti_i[master_sel*3+:3];
   assign wbs_bte_o = wbm_bte_i[master_sel*2+:2];

   assign wbm_dat_o = poll_response_flag == POLL_RESPONSE_POSITIVE ?
                           {num_cores{snooped_dat}} :
                           {num_cores{wbs_dat_i}};
   assign wbm_ack_o = poll_response_flag == POLL_RESPONSE_POSITIVE ? 
                           1 << saved_master_sel :
                           ((wbs_ack_i & active) << master_sel);
   assign wbm_err_o = ((wbs_err_i & active) << master_sel);
   assign wbm_rty_o = ((wbs_rty_i & active) << master_sel);

   //check who wants to do something with the bus
	//detect it
	 always@(master_sel)
	 begin: master_sel_sensitivity_block
      integer j;
		 if(mem_access_active == 0)
		 begin
			//save adr to snoop
			snoop_adr_reg = wbm_adr_i[master_sel*aw+:aw];
         saved_master_sel = master_sel;
			//decide what to do in case of a read or a write
			if(wbm_we_i[master_sel]==1)
			begin
			   //tell cores to invalidate datum
			   snoop_type_o = SNOOP_TYPE_WRITE;
			end
			else
			begin
			   //block arbitration
			   arbiter_cyc = 0;
			   saved_request = wbm_cyc_i;			   			   
			   state = SNOOP_READ;
			   snoop_type_o = SNOOP_TYPE_READ;
			end
			//send address to cores
			for(j=0; j<num_cores; j=j+1) begin
			   snoop_adr_o[master_sel*aw+:aw]= snoop_adr_reg;
			end
		 end
	end

   always@(posedge wb_clk_i)
   begin
      case(state)
         IDLE: 
         begin
            mem_access_active = 0;
            arbiter_cyc = wbm_cyc_i;
            snoop_type_o = SNOOP_TYPE_IDLE;
            poll_response_flag = POLL_RESPONSE_UNDEFINED;
         end
         SNOOP_READ:
         begin
            snoop_type_o = SNOOP_TYPE_READ;
			//does someone have the datum requested ?
            case (poll_response_flag)
               POLL_RESPONSE_POSITIVE:
               begin
                  //transmit datum received from a core
                  //see assign statement
               end 
               POLL_RESPONSE_NEGATIVE:
               begin
                  //cores don't have datum -> request it to memory
                  state = MEM_ACCESS;
               end
               default : 
               begin
                  //wait for cores response
               end
            endcase
         end
         MEM_ACCESS: 
         begin
            //normal flow. handle proxy
            mem_access_active = ~ 0;
            arbiter_cyc = saved_request;
         end
         default: 
         begin
            state = IDLE;
         end
      endcase
   end

   genvar i;
   for(i=0; i<num_cores; i= i+1)
   begin
      always @(negedge wbm_cyc_i[i])
      begin
         state = IDLE;
      end
   end

   always @(snoop_response_i) 
   begin: poll_response_sensitivity_block
      integer i;
      //cores don't have the datum.
      if(snoop_response_i == SNOOP_READ_POLL_FAILED)
      begin
         poll_response_flag = POLL_RESPONSE_NEGATIVE;
      end
      else
      begin
         for(i=0; i<num_cores; i = i+1)
         begin
            if(snoop_response_i[2*i+:2] == SNOOP_READ_DATA_POSITIVE)
            begin
               poll_response_flag= POLL_RESPONSE_POSITIVE;
               snoop_dat_owner = i;
            end
         end
      end
   end
   
endmodule // wb_arbiter
