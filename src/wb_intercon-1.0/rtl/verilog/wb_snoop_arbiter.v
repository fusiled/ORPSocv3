/* ****************************************************************************
  This Source Code Form is subject to the terms of the
  Open Hardware Description License, v. 1.0. If a copy
  of the OHDL was not distributed with this file, You
  can obtain one at http://juliusbaxter.net/ohdl/ohdl.txt

  Description: bus arbiter that implement a simple snoop protocol

  parameters tells how connected buses are organized. 
  - num_master is THE TOTAL NUMBER of buses connected to the arbiter 
    (instruction, data, debug unit... everithing that must access the memory)
  - num_dbus is the number of buses on which we apply the snoop protocol. CONNECT
    THE BUSES AT THE RIGHT SIDE OF THE INPUT, otherwise the protocol won't work. 
    The snoop protocol will active only on buses [num_dbus-1:0]
  
  The snoop protocol actives only on memory reads and on the range [num_dbus-1:0]
  swithcing the state from IDLE to SNOOP_READ:
    1) The arbiter blocks the access to memory
    2) It asserts the output snoop_type to signal cores that a snoop event is 
         taking place
    3) It sends the address to snoop to the other dbuses through the snoop_adr_o
    4) It waits for core responses checking snoop_ack_i and snoop_hit_i:
      - snoop_ack_i tells the arbiter that cores are replying to the snoop arbiter
      - snoop_hit_i tells the arbiter if a core has the requested datum.
    5) if snoop_ack_i = {num_dbus{1'b1}} and snoop_hit_i = 0 then the poll is failed
          got to MEM_ACCESS state and let the memory satisfy the request
      ELSE
       forward snooped datum (that is saved in snooped_dat register) to the core
    6) The transaction ends when end_of_transaction is asserted. Now the state is
       switched to IDLE.



  Copyright (C) 2016 Authors

  Author(s): Matteo M. Fusi <fusiled@gmail.com>

***************************************************************************** */

module wb_snoop_arbiter
 #(parameter dw = 32,
   parameter aw = 32,
   parameter num_masters = 2,
   parameter num_dbus = 1)
  (
   input 		       wb_clk_i,
   input 		       wb_rst_i,

   // Wishbone Master Interface
   input [num_masters*aw-1:0]  wbm_adr_i,
   input [num_masters*dw-1:0]  wbm_dat_i,
   input [num_masters*4-1:0]   wbm_sel_i,
   input [num_masters-1:0]     wbm_we_i,
   input [num_masters-1:0]     wbm_cyc_i,
   input [num_masters-1:0]     wbm_stb_i,
   input [num_masters*3-1:0]   wbm_cti_i,
   input [num_masters*2-1:0]   wbm_bte_i,
   output [num_masters*dw-1:0] wbm_dat_o,
   output [num_masters-1:0]    wbm_ack_o,
   output [num_masters-1:0]    wbm_err_o,
   output [num_masters-1:0]    wbm_rty_o, 

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
   output [num_dbus*aw-1:0] snoop_adr_o,
   output[num_dbus-1:0] snoop_type_o,
   input [num_dbus-1:0] snoop_ack_i,
   input [num_dbus-1:0] snoop_hit_i,
   input [num_dbus*dw-1:0] snoop_dat_i
   );

   `include "verilog_utils.vh"

///////////////////////////////////////////////////////////////////////////////
// Parameters
///////////////////////////////////////////////////////////////////////////////
   

   reg [dw-1:0] snooped_dat;
   
   localparam master_sel_bits = num_masters > 1 ? clog2(num_masters) : 1;
   wire [num_masters-1:0]     grant;
   wire [master_sel_bits-1:0] master_sel;
   wire active;

   //signal if the snoop poll had success or not. See POLL_RESPONSE_x params.
   //The default value is POLL_RESPONSE_UNDEFINED. It can assume
   //POLL_RESPONSE_POSITIVE or POLL_RESPONSE_NEGATIVE only after we know for
   //sure the poll result and only when the state==IDLE
   reg [1:0] poll_response_flag;

   //This register proxies the wbm_cyc_i in the arbiter module. The idea is to
   //"trick" the arbiter as much as possible cycle, but also exploiting its
   //arbitration abilities.
   reg [num_masters-1:0] arbiter_cyc;
   reg [aw-1:0] snoop_adr_reg;

   //Snoop params
   localparam IDLE = 4'b0001;
   localparam SNOOP_WRITE = 4'b0010;
   localparam SNOOP_READ = 4'b0100;
   localparam MEM_ACCESS = 4'b1000;
   
   localparam SNOOP_TYPE_IDLE = 1'b0;
   localparam SNOOP_TYPE_READ = 1'b1;

   //used by poll_response_flag
   localparam POLL_RESPONSE_UNDEFINED = 2'b10;
   localparam POLL_RESPONSE_POSITIVE = 2'b11;
   localparam POLL_RESPONSE_NEGATIVE = 2'b00;
   
   
   reg [3:0] state;
   //buffer register. It is needed to update the state
   reg [3:0] next_state;

   reg [master_sel_bits-1:0] saved_master_sel;
   wire end_of_transaction;

   //patch to simplify the poll_response assignment
   wire snoop_mask;
   wire snoop_type;

   
   arbiter
     #(.NUM_PORTS (num_masters))
   arbiter0
     (.clk (wb_clk_i),
      .rst (wb_rst_i),
      .request (arbiter_cyc),
      .select (master_sel),
      .active (active));
	  
   

   //output signals
   assign wbs_adr_o = wbm_adr_i[master_sel*aw+:aw];
   assign wbs_dat_o = wbm_dat_i[master_sel*dw+:dw];
   assign wbs_sel_o = wbm_sel_i[master_sel*4+:4];
   assign wbs_we_o  = wbm_we_i [master_sel];
   assign wbs_cyc_o = (state == IDLE && active==1 && wbm_we_i[master_sel]==0 && master_sel < num_dbus) ||
                      (state == SNOOP_READ) ? 0 : wbm_cyc_i[master_sel] & active;
   assign wbs_stb_o = wbm_stb_i[master_sel];
   assign wbs_cti_o = wbm_cti_i[master_sel*3+:3];
   assign wbs_bte_o = wbm_bte_i[master_sel*2+:2];

   assign wbm_dat_o = (poll_response_flag == POLL_RESPONSE_POSITIVE) ?
                           {num_masters{snooped_dat}} :
                           {num_masters{wbs_dat_i}};

   assign wbm_ack_o = (poll_response_flag == POLL_RESPONSE_POSITIVE) ? 
                          1 << saved_master_sel :
                          (state == MEM_ACCESS) ?
                              (wbs_ack_i & active) << master_sel :
                              (state == IDLE && active==1 && wbm_we_i[master_sel]==0 && master_sel < num_dbus) ? 0 :
                              (wbs_ack_i & active) << master_sel;

   assign wbm_err_o = ((wbs_err_i & active) << master_sel);
   assign wbm_rty_o = ((wbs_rty_i & active) << master_sel);

   assign snoop_type_o = snoop_type;

   assign snoop_adr_o = {num_dbus{snoop_adr_reg}};


   assign end_of_transaction = ( (state == SNOOP_READ && wbm_cyc_i[saved_master_sel]==0) ||
                                 (state == MEM_ACCESS && wbm_cyc_i[saved_master_sel]==0) ) ? 1 : 0;

   assign snoop_type = (state == SNOOP_READ ) ? SNOOP_TYPE_READ : SNOOP_TYPE_IDLE ;

   assign snoop_mask = 1<<saved_master_sel;


   //FSM that controls next_state variable and then the state register.
   always@(posedge wb_clk_i)
   begin
      //reset condition
      if(wb_rst_i)
      begin
         next_state <= IDLE;
      end
      case(state)
         IDLE:
         begin
            if(active==1 && wbm_we_i[master_sel]==0 && wbm_cyc_i[master_sel]==1 && master_sel < num_dbus && wbm_ack_o[master_sel]==0)
            begin
               $display("switch to SNOOP_READ due to active:%b, wbm_we_i:%b, master_sel:%d, num_dbus:%d, wbm_cyc_i: %b", active, wbm_we_i, master_sel, num_dbus, wbm_cyc_i);
               next_state <= SNOOP_READ;
               saved_master_sel <= master_sel;
            end
            else
            begin
              next_state <= IDLE;
            end
         end
         SNOOP_READ:
         begin
            if(end_of_transaction)
            begin
               next_state <= IDLE;
            end
            else
            begin
              if(poll_response_flag == POLL_RESPONSE_NEGATIVE)
              begin
                next_state <= MEM_ACCESS;
              end
              else
              begin
                next_state <= SNOOP_READ;
              end
            end
         end
         MEM_ACCESS:
         begin
          if(end_of_transaction==1)
          begin
            next_state <= IDLE;
          end
          else
          begin
            next_state <= MEM_ACCESS;
          end
         end
         default:
         begin
            next_state <= IDLE;
            saved_master_sel <= 0;
         end
      endcase
   end

   always@(*)
   begin: fsm_sensitivity_block
      //don't interfere with memory access
      arbiter_cyc <= wbm_cyc_i;
      snoop_adr_reg <= 0;
      //unless we change state!
      state <= next_state;
      case(state)
         IDLE: 
         begin
            //don't interfere
            arbiter_cyc <= wbm_cyc_i;
            snoop_adr_reg <= 0;
         end
         SNOOP_READ:
         begin
            //block arbitration, save the selected core and the current request array
            arbiter_cyc <= 0;
            snoop_adr_reg <= wbm_adr_i[master_sel*aw+:aw];
         end
         MEM_ACCESS: 
         begin
            //restore state before snoop read and access to memory
            arbiter_cyc <= wbm_cyc_i;
            snoop_adr_reg <= 0;
         end
         default: 
         begin
            arbiter_cyc <= wbm_cyc_i;
            snoop_adr_reg <= 0;
         end
      endcase
   end

//handle poll_response_flag (and so snoop operations)
   always@(*)
   begin
      snooped_dat=0;
      if(snoop_type_o==SNOOP_TYPE_READ)
      begin: snoop_read_active
         integer k;
         poll_response_flag = POLL_RESPONSE_UNDEFINED;
         for(k=0; k<num_dbus; k = k+1)
         begin
            if(snoop_ack_i[k]==1)
            begin
               if(snoop_hit_i[k]==1)
               begin
                  poll_response_flag = POLL_RESPONSE_POSITIVE;
                  snooped_dat = snoop_dat_i[dw*k+:dw];
               end
            end
         end
         if(snoop_ack_i | snoop_mask == {num_dbus{1'b1}} && snoop_hit_i==0 && poll_response_flag == POLL_RESPONSE_UNDEFINED)
         begin
            poll_response_flag = POLL_RESPONSE_NEGATIVE;
         end
      end
      else
      begin
         snooped_dat = 0;
         poll_response_flag = POLL_RESPONSE_UNDEFINED;
      end
   end

endmodule // wb_snoop_arbiter
