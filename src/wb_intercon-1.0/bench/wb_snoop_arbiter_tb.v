
`timescale 1ns/10ps

`include "wb_snoop_arbiter.v"

module wb_snoop_arbiter_tb;


	localparam num_cores=4;
  localparam aw = 32;
  localparam dw =32;

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

// Generate a clk
    reg clk;
    reg rst;

   reg [num_cores*aw-1:0]  m_adr_i;
   reg [num_cores*dw-1:0]  m_dat_i;
   reg [num_cores*4-1:0]   m_sel_i;
   reg [num_cores-1:0]     m_we_i;
   reg [num_cores-1:0]     m_cyc_i;
   reg [num_cores-1:0]     m_stb_i;
   reg [num_cores*3-1:0]   m_cti_i;
   reg [num_cores*2-1:0]   m_bte_i;
   wire [num_cores*dw-1:0] m_dat_o;
   wire [num_cores-1:0]    m_ack_o;
   wire [num_cores-1:0]    m_err_o;
   wire [num_cores-1:0]    m_rty_o; 

   // Wishbone Slave interface
   wire [aw-1:0] 	       s_adr_o;
   wire [dw-1:0] 	       s_dat_o;
   wire [3:0] 	       s_sel_o; 
   wire 		       s_we_o;
   wire 		       s_cyc_o;
   wire 		       s_stb_o;
   wire [2:0] 	       s_cti_o;
   wire [1:0] 	       s_bte_o;
   reg [dw-1:0] 	       s_dat_i;
   reg 		       s_ack_i;
   reg 		       s_err_i;
   reg 		       s_rty_i;


   //snoop interface
   wire reg [num_cores*aw-1:0] op_adr_o;
   wire reg [1:0] op_type_o;
   reg [num_cores*2-1:0] op_response_i;
   reg [num_cores*dw-1:0] oped_dat_i;


   initial
   begin
    //set start values
    rst=1;
    clk=0;

    m_cyc_i=0;
    m_we_i=0;
   end

    always #1 clk = !clk;


      wb_snoop_arbiter #(
      .dw (aw),
      .aw (dw),
      .num_cores(num_cores)
    )
    uut (
   .wb_clk_i(clk),
   .wb_rst_i(rst),

   // Wishbone Master Interface
   .wbm_adr_i (m_adr_i),
   .wbm_dat_i (m_dat_i),
   .wbm_sel_i (m_sel_i),
   .wbm_we_i  (m_we_i),
   .wbm_cyc_i (m_cyc_i),
   .wbm_stb_i (m_stb_i),
   .wbm_cti_i (m_cti_i),
   .wbm_bte_i (m_bte_i),
   .wbm_dat_o (m_dat_o),
   .wbm_ack_o (m_ack_o),
   .wbm_err_o (m_err_o),
   .wbm_rty_o (m_rty_o), 

   // Wishbone Slave interface
   .wbs_adr_o (s_adr_o),
   .wbs_dat_o (s_dat_o),
   .wbs_sel_o (s_sel_o), 
   .wbs_we_o  (s_we_o),
   .wbs_cyc_o (s_cyc_o),
   .wbs_stb_o (s_stb_o),
   .wbs_cti_o (s_cti_o),
   .wbs_bte_o (s_bte_o),
   .wbs_dat_i (s_dat_i),
   .wbs_ack_i (s_ack_i),
   .wbs_err_i (s_err_i),
   .wbs_rty_i (s_rty_i),
   //snoop interface
   .snoop_adr_o (op_adr_o),
   .snoop_type_o (op_type_o), 
   .snoop_response_i (op_response_i),
   .snooped_dat_i (oped_dat_i)
   );


    initial begin
    $dumpfile("result.vcd"); // Waveform file
    $dumpvars;
    end

    initial begin
    //TEST1 = access to arbiter, fail snoop poll, access to memory
    #10
    rst=0;
    //everyone requests for something to read
    m_cyc_i= ~0;
    m_we_i = 0;
    #5
    `ifdef VERBOSE
    if(op_type_o==SNOOP_TYPE_READ)
    begin
      $display("[OK] snoop type read is active");
    end
    else
    begin
      $display("****[ERROR] something is wrong with snoop type switch to read mode");
    end
    `endif
    #10
    //no one has datum
    op_response_i=0;
    #10
    `ifdef VERBOSE
    if(uut.state == MEM_ACCESS)
    begin
      $display("[OK] we're accessing to memory");
    end
    else
    begin
      $display("****[ERROR] not in MEM_ACCESS state. something is wrong");
    end
    `endif
    #10
    //transmit datum from memory to core
    s_ack_i=1;
    s_dat_i=1;
    #10
    //deassert cyc -> stop slave. Core has received the datum
    m_cyc_i[uut.master_sel]=0;
    s_dat_i=0;
    s_ack_i=0;
    //END TEST1
    //Short break
    #10
    rst=1;
    #40
    rst=0;
    //like initial condition except that now wbm_cyc_i = 1110
    //TEST2 -> access to arbiter, positive snoop poll (core0 has the datum), forward datum
    #10
    //one core has datum (suppose core 0)
    op_response_i=SNOOP_READ_DATA_POSITIVE ;
    oped_dat_i=64;
    #10
    //check if the datum is forwarded correctly
    `ifdef VERBOSE
    if(m_dat_o[32:0]==64 && m_ack_o[1]==1)
    begin
      $display("[OK] data has been forwarded properly");
    end
    else
    begin
      $display("****[ERROR] something is wrong with data forwarding in case of a successful poll");
    end
    `endif
    //deassert cyc -> stop slave. Core has received the datum
    m_cyc_i[1]=0;
    //END TEST2
    //Short break
    #10
    rst=1;
    #40
    rst=0;
    m_we_i[2] = 1;
    m_dat_i[dw*2+:dw]=55;
    //TEST3 -> access to arbiter with the intention of WRITING MEMORY
    #20
    //in theory we must do nothing except to let the normal flow of master-slave
    //pass through the arbiter
    //just let the slave respond
    //transmit datum from memory to core
    s_ack_i=1;
    s_dat_i=1;
    #10
    //deassert cyc -> stop slave. Core has received the datum
    m_cyc_i[uut.master_sel]=0;
    s_dat_i=0;
    s_ack_i=0;
    #10
    //end of everything
    rst=1;
    #100
    $finish;
    end


endmodule