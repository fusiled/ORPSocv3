//TODO write do nothing with other cores
//TODO fix code using ise


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
   output snoop_type_o,
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

   reg [1:0] poll_response_flag;

   reg [num_masters-1:0] arbiter_cyc;
   reg [aw-1:0] snoop_adr_reg;
   reg [num_masters-1:0] saved_request;
   reg mem_access_active;
   
   reg [3:0] state;
   reg [3:0] next_state;
   localparam IDLE = 4'b0001;
   localparam SNOOP_WRITE = 4'b0010;
   localparam SNOOP_READ = 4'b0100;
   localparam MEM_ACCESS = 4'b1000;
   
   localparam SNOOP_TYPE_IDLE = 1'b0;
   localparam SNOOP_TYPE_READ = 1'b1;

   localparam POLL_RESPONSE_UNDEFINED = 2'b10;
   localparam POLL_RESPONSE_POSITIVE = 2'b11;
   localparam POLL_RESPONSE_NEGATIVE = 2'b00;
   
   
   reg [num_dbus-1:0] poll_result;
   reg [num_dbus-1:0]snoop_datum_owner;
   reg [master_sel_bits-1:0] saved_master_sel;
   reg snoop_read_ready;
   wire end_of_transaction;

   wire snoop_type;

   
   arbiter
     #(.NUM_PORTS (num_masters))
   arbiter0
     (.clk (wb_clk_i),
      .rst (wb_rst_i),
      .request (arbiter_cyc),
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
                           {num_dbus{snooped_dat}} :
                           {num_dbus{wbs_dat_i}};

   assign wbm_ack_o = poll_response_flag == POLL_RESPONSE_POSITIVE ? 
                          1 << saved_master_sel :
                           ((wbs_ack_i & active) << master_sel);
   assign wbm_err_o = ((wbs_err_i & active) << master_sel);
   assign wbm_rty_o = ((wbs_rty_i & active) << master_sel);

   assign snoop_type = (state == SNOOP_READ ) ? SNOOP_TYPE_READ : SNOOP_TYPE_IDLE ;
   assign snoop_type_o = snoop_type;


   assign end_of_transaction = ( (state == SNOOP_READ && wbm_cyc_i[saved_master_sel]==0) ||
                                 (state == MEM_ACCESS && wbm_cyc_i[master_sel]==0) ) ? 1 : 0;


   assign snoop_adr_o = {num_dbus{snoop_adr_reg}};


   always@(posedge wb_clk_i)
   begin
      //reset condition
      if(wb_rst_i)
      begin
         next_state = IDLE;
      end
      state = next_state;
      case(state)
         IDLE:
         begin
            next_state = IDLE;
            if(active && wbm_we_i[master_sel]==0 && master_sel < num_dbus)
            begin
               next_state = SNOOP_READ;
            end
         end
         SNOOP_READ:
         begin
            next_state = SNOOP_READ;
            if(end_of_transaction)
            begin
               next_state = IDLE;
            end
            if(poll_response_flag == POLL_RESPONSE_NEGATIVE)
            begin
               next_state = MEM_ACCESS;
            end
         end
         MEM_ACCESS:
         begin
            next_state = MEM_ACCESS;
            if(end_of_transaction==1)
            begin
               next_state = IDLE;
            end
         end
         default:
         begin
            next_state = IDLE;
         end
      endcase
   end

   always@(*)
   begin: fsm_sensitivity_block
      arbiter_cyc = wbm_cyc_i;
      snoop_adr_reg = 0;
      saved_master_sel = 0;
      saved_request = 0;
      case(state)
         IDLE: 
         begin
            arbiter_cyc = wbm_cyc_i;
            snoop_adr_reg = 0;
            saved_master_sel = 0;
            saved_request = 0;
         end
         SNOOP_READ:
         begin
            //block arbitration, save the selected core and the current request array
            arbiter_cyc = 0;
            snoop_adr_reg = wbm_adr_i[master_sel*aw+:aw];
            saved_master_sel = master_sel;
            saved_request = wbm_cyc_i;
         end
         MEM_ACCESS: 
         begin
            //restore state before snoop read and access to memory
            arbiter_cyc = saved_request;
            snoop_adr_reg = 0;
            saved_master_sel = master_sel;
            saved_request = 0;
         end
         default: 
         begin
            arbiter_cyc = wbm_cyc_i;
            snoop_adr_reg = 0;
            saved_master_sel = 0;
            saved_request = 0;
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
         if(snoop_ack_i == {num_dbus{1'b1}} && snoop_hit_i==0 && poll_response_flag == POLL_RESPONSE_UNDEFINED)
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
