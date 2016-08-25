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
   output [num_cores*aw-1:0] snoop_adr_o,
   output [1:0] snoop_type_o,
   input [num_cores*2-1:0] snoop_response_i,
   input [num_cores*dw-1:0] snooped_dat_i
   );

   `include "verilog_utils.vh"

///////////////////////////////////////////////////////////////////////////////
// Parameters
///////////////////////////////////////////////////////////////////////////////
   
   
   localparam master_sel_bits = num_cores > 1 ? `clog2(num_cores) : 1;
   wire [num_masters-1:0]     grant;
   wire [master_sel_bits-1:0] master_sel;
   wire           active;
   wire [num_cores-1:0] arbiter_cyc;
   reg [aw-1:0] snoop_adr_reg;
   reg [num_cores-1:0] saved_request;
   
   reg [3:0] state;
   localparam IDLE = 4'b0001;
   localparam SNOOP_WRITE = 4'b0010;
   localparam SNOOP_READ = 4'b0100;
   localparam MEM_ACCESS = 4'b1000;

   
   localparam SNOOP_TYPE_IDLE = 2'b00;
   localparam SNOOP_TYPE_READ = 2'b01;
   localparam SNOOP_TYPE_WRITE = 2'b10;
   localparam SNOOP_TYPE_NOT_USED = 2'b11;
   
   
   //tri_state stuff
   reg [num_cores-1:0] poll_result;

   
   //functions
   function integer bintodec;
      input [master_sel_bits-1:0] in;
      begin
		   bintodec = 0;
		   integer i;
           for( i = 0; i < master_sel_bits; i=i+1)
		   begin
		       if(in[i] == 1)
			   begin
			       bintodec|= 1<<i;
			   end 
		   end
 
      end
   endfunction
   
   
   
   
   
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

   assign wbm_dat_o = {num_masters{wbs_dat_i}};
   assign wbm_ack_o = ((wbs_ack_i & active) << master_sel);
   assign wbm_err_o = ((wbs_err_i & active) << master_sel);
   assign wbm_rty_o = ((wbs_rty_i & active) << master_sel);

   genvar j;

     //check who wants to do something with the bus
	 //detect it
	 always@(master_sel)
	 begin
		 if(active == 1)
		 begin
			//save adr to snoop
			snoop_adr_reg = wbm_adr_i[(master_sel+1)*aw-1:master_sel*aw];
			//decide what to do
			if(wbm_we_i[master_sel]==1)
			begin
			   //tell cores to invalidate datum
			   snoop_type_o = SNOOP_TYPE_WRITE;
			end
			else
			begin
			   //block arbitration
			   arbiter_cyc = 0;
			   saved_request = 1 << bintodec(master_sel);			   			   
			   state = SNOOP_READ;
			   snoop_type_o = SNOOP_TYPE_READ;
			end
			//send address to cores
			for(j=0; j<num_cores; j=j+1) begin
			   snoop_adr_o[(master_sel+1)*aw-1:master_sel*aw]= snoop_adr_reg;
			end
		 end
	end

   always@(posedge wb_clk_i)
   begin
      case(state)
         IDLE: begin
            arbiter_cyc = wbm_cyc_i;
            snoop_type_o = SNOOP_TYPE_IDLE;
            state = IDLE;
         end
         SNOOP_READ:
			//does someone have the datum requested
            case (poll_response_flag)
               1'b1:
               begin
                  //transmit datum received from a core
               end 
               1'b0:
               begin:
                  //cores don't have datum -> request it to memory
                  state = MEM_ACCESS;
               end
               default : 
               begin
                  //wait cores response
               end
            endcase
         begin
         end
         MEM_ACCESS: begin
            //normal flow. handle proxy
            arbiter_cyc = saved_request;
			begin
			end
         end
         default: begin
            state = IDLE;
         end
      endcase
   end
   
endmodule // wb_arbiter
