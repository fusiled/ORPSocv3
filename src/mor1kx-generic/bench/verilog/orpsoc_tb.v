//`timescale 10ns/10ns 

module orpsoc_tb;

  localparam NUM_CORES=2;

   vlog_tb_utils vlog_tb_utils0();

    wire tms;
    wire tck;
    wire tdi;
    wire tdo;

   ////////////////////////////////////////////////////////////////////////
   //
   // ELF program loading
   //
   ////////////////////////////////////////////////////////////////////////
   integer mem_words;
   integer i;
   reg [31:0] mem_word;
   reg [1023:0] elf_file;

   initial begin
      if($value$plusargs("elf_load=%s", elf_file)) begin
	 $elf_load_file(elf_file);

	 mem_words = $elf_get_size/4;
	 $display("Loading %d words", mem_words);
	 for(i=0; i < mem_words; i = i+1)
	   orpsoc_tb.dut.wb_bfm_memory0.ram0.mem[i] = $elf_read_32(i*4);
      end else
	$display("No ELF file specified");

   end

   ////////////////////////////////////////////////////////////////////////
   //
   // Clock and reset generation
   //
   ////////////////////////////////////////////////////////////////////////
   reg syst_clk = 1;
   reg syst_rst = 1;

   always #1 syst_clk <= ~syst_clk;
   

   initial 
   begin
    #100 syst_rst <= 0;
   end

   ////////////////////////////////////////////////////////////////////////
   //
   // mor1kx monitor
   //
   ////////////////////////////////////////////////////////////////////////

   //Generate multiple instances of the monitor: one foreach core
   genvar iterator;
   generate
   for (iterator=0; iterator<NUM_CORES; iterator=iterator+1) begin: gen_monitor
   mor1kx_monitor #(
    .LOG_DIR("."),
    .CPU_INDEX(iterator)
    ) i_monitor();
  end
  endgenerate

   ////////////////////////////////////////////////////////////////////////
   //
   // DUT
   //
   ////////////////////////////////////////////////////////////////////////

   initial
 begin
    $dumpfile("trace.vcd");
    $dumpvars(0,orpsoc_tb);
 end



  orpsoc_multi_top
   #(.NUM_CORES (NUM_CORES),
    .MEM_PER_CORE(0))
   dut
     (.wb_clk_i (syst_clk),
      .wb_rst_i (syst_rst),
      .tms_pad_i (tms),
      .tck_pad_i (tck),
      .tdi_pad_i (tdi),
      .tdo_pad_o (tdo));


endmodule
