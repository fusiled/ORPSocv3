module orpsoc_emb_top
#(parameter NUM_CORES = 1)
(
		input wb_clk_i,
		input wb_rst_i
);

localparam wb_aw = 32;
localparam wb_dw = 32;
localparam MEM_SIZE_BITS = 25;

localparam MULTICORE = NUM_CORES > 1 ? "YES" : "NONE";

////////////////////////////////////////////////////////////////////////
//
// Wishbone interconnect
//
////////////////////////////////////////////////////////////////////////
wire wb_clk = wb_clk_i;
wire wb_rst = wb_rst_i;
//data and instruction wires of the cores
wire [32*NUM_CORES-1:0]    wb_m2s_or1k_d_adr;
wire [32*NUM_CORES-1:0]    wb_m2s_or1k_d_dat;
wire [4*NUM_CORES-1:0]     wb_m2s_or1k_d_sel;
wire [NUM_CORES-1:0]       wb_m2s_or1k_d_we;
wire [NUM_CORES-1:0]       wb_m2s_or1k_d_cyc;
wire [NUM_CORES-1:0]       wb_m2s_or1k_d_stb;
wire [3*NUM_CORES-1:0]     wb_m2s_or1k_d_cti;
wire [2*NUM_CORES-1:0]     wb_m2s_or1k_d_bte;
wire [32*NUM_CORES-1:0]    wb_s2m_or1k_d_dat;
wire [NUM_CORES-1:0]       wb_s2m_or1k_d_ack;
wire [NUM_CORES-1:0]       wb_s2m_or1k_d_err;
wire [NUM_CORES-1:0]       wb_s2m_or1k_d_rty;
wire [32*NUM_CORES-1:0]    wb_m2s_or1k_i_adr;
wire [32*NUM_CORES-1:0]    wb_m2s_or1k_i_dat;
wire [4*NUM_CORES-1:0]     wb_m2s_or1k_i_sel;
wire [NUM_CORES-1:0]       wb_m2s_or1k_i_we;
wire [NUM_CORES-1:0]       wb_m2s_or1k_i_cyc;
wire [NUM_CORES-1:0]       wb_m2s_or1k_i_stb;
wire [3*NUM_CORES-1:0]     wb_m2s_or1k_i_cti;
wire [2*NUM_CORES-1:0]     wb_m2s_or1k_i_bte;
wire [32*NUM_CORES-1:0]    wb_s2m_or1k_i_dat;
wire [NUM_CORES-1:0]       wb_s2m_or1k_i_ack;
wire [NUM_CORES-1:0]       wb_s2m_or1k_i_err;
wire [NUM_CORES-1:0]       wb_s2m_or1k_i_rty;

//memory wires and uart wires. There's no need to alter them
wire [31:0] wb_m2s_mem_adr;
wire [31:0] wb_m2s_mem_dat;
wire  [3:0] wb_m2s_mem_sel;
wire        wb_m2s_mem_we;
wire        wb_m2s_mem_cyc;
wire        wb_m2s_mem_stb;
wire  [2:0] wb_m2s_mem_cti;
wire  [1:0] wb_m2s_mem_bte;
wire [31:0] wb_s2m_mem_dat;
wire        wb_s2m_mem_ack;
wire        wb_s2m_mem_err;
wire        wb_s2m_mem_rty;
wire [31:0] wb_m2s_uart_adr;
wire  [7:0] wb_m2s_uart_dat;
wire  [3:0] wb_m2s_uart_sel;
wire        wb_m2s_uart_we;
wire        wb_m2s_uart_cyc;
wire        wb_m2s_uart_stb;
wire  [2:0] wb_m2s_uart_cti;
wire  [1:0] wb_m2s_uart_bte;
wire  [7:0] wb_s2m_uart_dat;
wire        wb_s2m_uart_ack;
wire        wb_s2m_uart_err;
wire        wb_s2m_uart_rty;


////////////////////////////////////////////////////////////////////////
//
// mor1kx cpu
//
////////////////////////////////////////////////////////////////////////

wire [31:0]	or1k_irq;
wire		or1k_clk;
wire		or1k_rst;

assign or1k_clk = wb_clk;
assign or1k_rst = wb_rst;



genvar i;

generate
for (i=0; i<NUM_CORES; i=i+1) begin: gen_cores
	mor1kx #(
	.FEATURE_DEBUGUNIT		("DISABLED"),
	.FEATURE_CMOV			("DISABLED"),
	.FEATURE_INSTRUCTIONCACHE	("ENABLED"),
	.OPTION_ICACHE_BLOCK_WIDTH	(5),
	.OPTION_ICACHE_SET_WIDTH	(8),
	.OPTION_ICACHE_WAYS		(2),
	.OPTION_ICACHE_LIMIT_WIDTH	(32),
	.FEATURE_IMMU			("DISABLED"),
	.FEATURE_DATACACHE		("ENABLED"),
	.OPTION_DCACHE_BLOCK_WIDTH	(5),
	.OPTION_DCACHE_SET_WIDTH	(8),
	.OPTION_DCACHE_WAYS		(2),
	.OPTION_DCACHE_LIMIT_WIDTH	(31),
	.FEATURE_DMMU			("DISABLED"),
	.OPTION_RF_NUM_SHADOW_GPR	(1),
	.IBUS_WB_TYPE			("B3_REGISTERED_FEEDBACK"),
	.DBUS_WB_TYPE			("B3_REGISTERED_FEEDBACK"),
	.OPTION_CPU0			("CAPPUCCINO"),
	.OPTION_RESET_PC		(32'h00000100),
	.FEATURE_MULTICORE		(MULTICORE)
	) mor1kx0 (
	.iwbm_adr_o			(wb_m2s_or1k_i_adr[32*(i+1)-1:(32*i)]),
	.iwbm_stb_o			(wb_m2s_or1k_i_stb[i]),
	.iwbm_cyc_o			(wb_m2s_or1k_i_cyc[i]),
	.iwbm_sel_o			(wb_m2s_or1k_i_sel[4*(i+1)-1:(4*i)]),
	.iwbm_we_o			(wb_m2s_or1k_i_we[i]),
	.iwbm_cti_o			(wb_m2s_or1k_i_cti[3*(i+1)-1:(3*i)]),
	.iwbm_bte_o			(wb_m2s_or1k_i_bte[2*(i+1)-1:(2*i)]),
	.iwbm_dat_o			(wb_m2s_or1k_i_dat[32*(i+1)-1:(32*i)]),

	.dwbm_adr_o			(wb_m2s_or1k_d_adr[32*(i+1)-1:(32*i)]),
	.dwbm_stb_o			(wb_m2s_or1k_d_stb[i]),
	.dwbm_cyc_o			(wb_m2s_or1k_d_cyc[i]),
	.dwbm_sel_o			(wb_m2s_or1k_d_sel[4*(i+1)-1:(4*i)]),
	.dwbm_we_o			(wb_m2s_or1k_d_we[i]),
	.dwbm_cti_o			(wb_m2s_or1k_d_cti[3*(i+1)-1:(3*i)]),
	.dwbm_bte_o			(wb_m2s_or1k_d_bte[2*(i+1)-1:(2*i)]),
	.dwbm_dat_o			(wb_m2s_or1k_d_dat[32*(i+1)-1:(32*i)]),

	.clk				(or1k_clk),
	.rst				(or1k_rst),

	.iwbm_err_i			(wb_s2m_or1k_i_err[i]),
	.iwbm_ack_i			(wb_s2m_or1k_i_ack[i]),
	.iwbm_dat_i			(wb_s2m_or1k_i_dat[32*(i+1)-1:(32*i)]),
	.iwbm_rty_i			(wb_s2m_or1k_i_rty[i]),

	.dwbm_err_i			(wb_s2m_or1k_d_err[i]),
	.dwbm_ack_i			(wb_s2m_or1k_d_ack[i]),
	.dwbm_dat_i			(wb_s2m_or1k_d_dat[32*(i+1)-1:(32*i)]),
	.dwbm_rty_i			(wb_s2m_or1k_d_rty[i]),

	.irq_i				(or1k_irq),
                    
    .multicore_numcores_i(NUM_CORES)				
);


end
endgenerate


////////////////////////////////////////////////////////////////////////
//
// Generic main RAM
//
////////////////////////////////////////////////////////////////////////
wb_ram #(
	.depth	(2**MEM_SIZE_BITS)
) wb_bfm_memory0 (
	//Wishbone Master interface
	.wb_clk_i	(wb_clk_i),
	.wb_rst_i	(wb_rst_i),
	.wb_adr_i	(wb_m2s_mem_adr[MEM_SIZE_BITS-1:0]),
	.wb_dat_i	(wb_m2s_mem_dat),
	.wb_sel_i	(wb_m2s_mem_sel),
	.wb_we_i	(wb_m2s_mem_we),
	.wb_cyc_i	(wb_m2s_mem_cyc),
	.wb_stb_i	(wb_m2s_mem_stb),
	.wb_cti_i	(wb_m2s_mem_cti),
	.wb_bte_i	(wb_m2s_mem_bte),
	.wb_dat_o	(wb_s2m_mem_dat),
	.wb_ack_o	(wb_s2m_mem_ack),
	.wb_err_o	(wb_s2m_mem_err)
);
   assign wb_s2m_mem_rty = 1'b0;

wire uart_irq;

uart_top #(
	.debug	(0),
	.SIM	(1)
) uart16550 (
	//Wishbone Master interface
	.wb_clk_i	(wb_clk_i),
	.wb_rst_i	(wb_rst_i),
	.wb_adr_i	(wb_m2s_uart_adr[2:0]),
	.wb_dat_i	(wb_m2s_uart_dat),
	.wb_sel_i	(4'h0),
	.wb_we_i	(wb_m2s_uart_we),
	.wb_cyc_i	(wb_m2s_uart_cyc),
	.wb_stb_i	(wb_m2s_uart_stb),
	.wb_dat_o	(wb_s2m_uart_dat),
	.wb_ack_o	(wb_s2m_uart_ack),
        .int_o		(uart_irq),
	.srx_pad_i	(1'b0),
	.stx_pad_o	(),
	.rts_pad_o	(),
	.cts_pad_i	(1'b0),
	.dtr_pad_o	(),
	.dsr_pad_i	(1'b0),
	.ri_pad_i	(1'b0),
	.dcd_pad_i	(1'b0)
);
   assign wb_s2m_uart_err = 1'b0;
   assign wb_s2m_uart_rty = 1'b0;


////////////////////////////////////////////////////////////////////////
//
// CPU interconnection to wishbone
//
////////////////////////////////////////////////////////////////////////



wb_intercon_emb
	#(.NUM_CORES (NUM_CORES))
	wb_intercon_emb0
    (.wb_clk_i        (wb_clk),
    .wb_rst_i        (wb_rst),
    .wb_or1k_d_adr_i (wb_m2s_or1k_d_adr),
    .wb_or1k_d_dat_i (wb_m2s_or1k_d_dat),
    .wb_or1k_d_sel_i (wb_m2s_or1k_d_sel),
    .wb_or1k_d_we_i  (wb_m2s_or1k_d_we),
    .wb_or1k_d_cyc_i (wb_m2s_or1k_d_cyc),
    .wb_or1k_d_stb_i (wb_m2s_or1k_d_stb),
    .wb_or1k_d_cti_i (wb_m2s_or1k_d_cti),
    .wb_or1k_d_bte_i (wb_m2s_or1k_d_bte),
    .wb_or1k_d_dat_o (wb_s2m_or1k_d_dat),
    .wb_or1k_d_ack_o (wb_s2m_or1k_d_ack),
    .wb_or1k_d_err_o (wb_s2m_or1k_d_err),
    .wb_or1k_d_rty_o (wb_s2m_or1k_d_rty),
    .wb_or1k_i_adr_i (wb_m2s_or1k_i_adr),
    .wb_or1k_i_dat_i (wb_m2s_or1k_i_dat),
    .wb_or1k_i_sel_i (wb_m2s_or1k_i_sel),
    .wb_or1k_i_we_i  (wb_m2s_or1k_i_we),
    .wb_or1k_i_cyc_i (wb_m2s_or1k_i_cyc),
    .wb_or1k_i_stb_i (wb_m2s_or1k_i_stb),
    .wb_or1k_i_cti_i (wb_m2s_or1k_i_cti),
    .wb_or1k_i_bte_i (wb_m2s_or1k_i_bte),
    .wb_or1k_i_dat_o (wb_s2m_or1k_i_dat),
    .wb_or1k_i_ack_o (wb_s2m_or1k_i_ack),
    .wb_or1k_i_err_o (wb_s2m_or1k_i_err),
    .wb_or1k_i_rty_o (wb_s2m_or1k_i_rty),
    .wb_mem_adr_o    (wb_m2s_mem_adr),
    .wb_mem_dat_o    (wb_m2s_mem_dat),
    .wb_mem_sel_o    (wb_m2s_mem_sel),
    .wb_mem_we_o     (wb_m2s_mem_we),
    .wb_mem_cyc_o    (wb_m2s_mem_cyc),
    .wb_mem_stb_o    (wb_m2s_mem_stb),
    .wb_mem_cti_o    (wb_m2s_mem_cti),
    .wb_mem_bte_o    (wb_m2s_mem_bte),
    .wb_mem_dat_i    (wb_s2m_mem_dat),
    .wb_mem_ack_i    (wb_s2m_mem_ack),
    .wb_mem_err_i    (wb_s2m_mem_err),
    .wb_mem_rty_i    (wb_s2m_mem_rty),
    .wb_uart_adr_o   (wb_m2s_uart_adr),
    .wb_uart_dat_o   (wb_m2s_uart_dat),
    .wb_uart_sel_o   (wb_m2s_uart_sel),
    .wb_uart_we_o    (wb_m2s_uart_we),
    .wb_uart_cyc_o   (wb_m2s_uart_cyc),
    .wb_uart_stb_o   (wb_m2s_uart_stb),
    .wb_uart_cti_o   (wb_m2s_uart_cti),
    .wb_uart_bte_o   (wb_m2s_uart_bte),
    .wb_uart_dat_i   (wb_s2m_uart_dat),
    .wb_uart_ack_i   (wb_s2m_uart_ack),
    .wb_uart_err_i   (wb_s2m_uart_err),
    .wb_uart_rty_i   (wb_s2m_uart_rty));



////////////////////////////////////////////////////////////////////////
//
// CPU Interrupt assignments
//
////////////////////////////////////////////////////////////////////////
assign or1k_irq[0] = 0;
assign or1k_irq[1] = 0;
assign or1k_irq[2] = uart_irq;
assign or1k_irq[3] = 0;
assign or1k_irq[4] = 0;
assign or1k_irq[5] = 0;
assign or1k_irq[6] = 0;
assign or1k_irq[7] = 0;
assign or1k_irq[8] = 0;
assign or1k_irq[9] = 0;
assign or1k_irq[10] = 0;
assign or1k_irq[11] = 0;
assign or1k_irq[12] = 0;
assign or1k_irq[13] = 0;
assign or1k_irq[14] = 0;
assign or1k_irq[15] = 0;
assign or1k_irq[16] = 0;
assign or1k_irq[17] = 0;
assign or1k_irq[18] = 0;
assign or1k_irq[19] = 0;
assign or1k_irq[20] = 0;
assign or1k_irq[21] = 0;
assign or1k_irq[22] = 0;
assign or1k_irq[23] = 0;
assign or1k_irq[24] = 0;
assign or1k_irq[25] = 0;
assign or1k_irq[26] = 0;
assign or1k_irq[27] = 0;
assign or1k_irq[28] = 0;
assign or1k_irq[29] = 0;
assign or1k_irq[30] = 0;

endmodule

