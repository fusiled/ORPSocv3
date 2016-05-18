//////////////////////////////////////////////////////////////////////
///                                                               //// 
/// Custom Wishbone interconnection with multiple cores           ////
///                                                               ////
/// Wrap wb_intercon module and use wb_arbiters.                  ////
///                                                               ////
///                                                               ////
/// Matteo M. Fusi, fusiled@gmail.com                             ////
/// Simone Disabato                                               ////
///                                                               ////
/// NOTES:                                                        ////
/// i = instruction                                               ////
/// d = data                                                      ////
/// g = debug                                                     ////
///                                                               ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2013 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////       DOBBIAMO RESUSCITARE I DRAGHI WITHOUT ANY WARRANTY     ////
//////////////////////////////////////////////////////////////////////



module wb_intercon_multi
    #(parameter dw = 32,        // Data width
        parameter aw = 32,        // Address width
        parameter NUM_CORES = 1,
        parameter DATA_WIDTH=32
    )
   (input         clk_i,
    input         rst_i,
    input  [DATA_WIDTH*NUM_CORES-1:0] or1k_d_adr_i,
    input  [DATA_WIDTH*NUM_CORES-1:0] or1k_d_dat_i,
    input  [4*NUM_CORES-1:0] or1k_d_sel_i,
    input  [NUM_CORES-1:0]      or1k_d_we_i,
    input  [NUM_CORES-1:0]       or1k_d_cyc_i,
    input  [NUM_CORES-1:0]       or1k_d_stb_i,
    input  [3*NUM_CORES-1:0] or1k_d_cti_i,
    input  [2*NUM_CORES-1:0] or1k_d_bte_i,
    output [DATA_WIDTH*NUM_CORES-1:0] or1k_d_dat_o,
    output [NUM_CORES-1:0]       or1k_d_ack_o,
    output [NUM_CORES-1:0]       or1k_d_err_o,
    output [NUM_CORES-1:0]       or1k_d_rty_o,
    input  [DATA_WIDTH*NUM_CORES-1:0] or1k_i_adr_i,
    input  [DATA_WIDTH*NUM_CORES-1:0] or1k_i_dat_i,
    input  [4*NUM_CORES-1:0] or1k_i_sel_i,
    input  [NUM_CORES-1:0]       or1k_i_we_i,
    input  [NUM_CORES-1:0]       or1k_i_cyc_i,
    input  [NUM_CORES-1:0]       or1k_i_stb_i,
    input  [3*NUM_CORES-1:0] or1k_i_cti_i,
    input  [2*NUM_CORES-1:0] or1k_i_bte_i,
    output [DATA_WIDTH*NUM_CORES-1:0] or1k_i_dat_o,
    output [NUM_CORES-1:0]       or1k_i_ack_o,
    output [NUM_CORES-1:0]       or1k_i_err_o,
    output [NUM_CORES-1:0]       or1k_i_rty_o,
    input  [DATA_WIDTH-1:0] dbg_adr_i,
    input  [DATA_WIDTH-1:0] dbg_dat_i,
    input  [3:0] dbg_sel_i,
    input        dbg_we_i,
    input        dbg_cyc_i,
    input        dbg_stb_i,
    input  [2:0] dbg_cti_i,
    input  [1:0] dbg_bte_i,
    output [31:0] dbg_dat_o,
    output        dbg_ack_o,
    output        dbg_err_o,
    output        dbg_rty_o,
    output [DATA_WIDTH-1:0] mem_adr_o,
    output [DATA_WIDTH-1:0] mem_dat_o,
    output  [3:0] mem_sel_o,
    output        mem_we_o,
    output        mem_cyc_o,
    output        mem_stb_o,
    output  [2:0] mem_cti_o,
    output  [1:0] mem_bte_o,
    input  [DATA_WIDTH-1:0] mem_dat_i,
    input         mem_ack_i,
    input         mem_err_i,
    input         mem_rty_i,
    output [DATA_WIDTH-1:0] uart_adr_o,
    output  [7:0] uart_dat_o,
    output  [3:0] uart_sel_o,
    output        uart_we_o,
    output        uart_cyc_o,
    output        uart_stb_o,
    output  [2:0] uart_cti_o,
    output  [1:0] uart_bte_o,
    input   [7:0] uart_dat_i,
    input         uart_ack_i,
    input         uart_err_i,
    input         uart_rty_i);


//Xatoi = X arbiter to intercon:  d=data, i= instruction, g=debug
//itoXa = intercon to X arbiter
    //data wires
    wire  [31:0] datoi_or1k_d_adr;
    wire  [31:0] datoi_or1k_d_dat;
    wire   [3:0] datoi_or1k_d_sel;
    wire         datoi_or1k_d_we;
    wire         datoi_or1k_d_cyc;
    wire         datoi_or1k_d_stb;
    wire   [2:0] datoi_or1k_d_cti;
    wire   [1:0] datoi_or1k_d_bte;
    wire  [31:0] itoda_or1k_d_dat;
    wire         itoda_or1k_d_ack;
    wire         itoda_or1k_d_err;
    wire         itoda_or1k_d_rty;
    //instruction wires
    wire  [31:0] iatoi_or1k_i_adr;
    wire  [31:0] iatoi_or1k_i_dat;
    wire   [3:0] iatoi_or1k_i_sel;
    wire         iatoi_or1k_i_we;
    wire         iatoi_or1k_i_cyc;
    wire         iatoi_or1k_i_stb;
    wire   [2:0] iatoi_or1k_i_cti;
    wire   [1:0] iatoi_or1k_i_bte;
    wire [31:0]  itoia_or1k_i_dat;
    wire         itoia_or1k_i_ack;
    wire         itoia_or1k_i_err;
    wire         itoia_or1k_i_rty;


wb_arbiter
    #(.dw (DATA_WIDTH),
    .aw (32),
    .num_masters (NUM_CORES)
    )
    data_arbiter
    (
    .wb_clk_i (clk_i),
    .wb_rst_i (rst_i),
    .wbm_adr_i (or1k_d_adr_i),
    .wbm_dat_i (or1k_d_dat_i),
    .wbm_sel_i (or1k_d_sel_i),
    .wbm_we_i  (or1k_d_we_i),
    .wbm_cyc_i (or1k_d_cyc_i),
    .wbm_stb_i (or1k_d_stb_i),
    .wbm_cti_i (or1k_d_cti_i),
    .wbm_bte_i (or1k_d_bte_i),
    .wbm_dat_o (or1k_d_dat_o),
    .wbm_ack_o (or1k_d_ack_o),
    .wbm_err_o (or1k_d_err_o),
    .wbm_rty_o (or1k_d_rty_o), 
    .wbs_adr_o (datoi_or1k_d_adr),
    .wbs_dat_o (datoi_or1k_d_dat),
    .wbs_sel_o (datoi_or1k_d_sel), 
    .wbs_we_o  (datoi_or1k_d_we),
    .wbs_cyc_o (datoi_or1k_d_cyc),
    .wbs_stb_o (datoi_or1k_d_stb),
    .wbs_cti_o (datoi_or1k_d_cti),
    .wbs_bte_o (datoi_or1k_d_bte),
    .wbs_dat_i (datoi_or1k_d_dat),
    .wbs_ack_i (itoda_or1k_d_ack),
    .wbs_err_i (itoda_or1k_d_err),
    .wbs_rty_i (itoda_or1k_d_rty) 
    );

wb_arbiter
    #(.dw (DATA_WIDTH),
    .aw (32),
    .num_masters (NUM_CORES)
    )
    instruction_arbiter
    (
    .wb_clk_i (clk_i),
    .wb_rst_i (rst_i),
    .wbm_adr_i (or1k_i_adr_i),
    .wbm_dat_i (or1k_i_dat_i),
    .wbm_sel_i (or1k_i_sel_i),
    .wbm_we_i  (or1k_i_we_i),
    .wbm_cyc_i (or1k_i_cyc_i),
    .wbm_stb_i (or1k_i_stb_i),
    .wbm_cti_i (or1k_i_cti_i),
    .wbm_bte_i (or1k_i_bte_i),
    .wbm_dat_o (or1k_i_dat_o),
    .wbm_ack_o (or1k_i_ack_o),
    .wbm_err_o (or1k_i_err_o),
    .wbm_rty_o (or1k_i_rty_o), 
    .wbs_adr_o (iatoi_or1k_i_adr),
    .wbs_dat_o (iatoi_or1k_i_dat),
    .wbs_sel_o (iatoi_or1k_i_sel), 
    .wbs_we_o  (iatoi_or1k_i_we),
    .wbs_cyc_o (iatoi_or1k_i_cyc),
    .wbs_stb_o (iatoi_or1k_i_stb),
    .wbs_cti_o (iatoi_or1k_i_cti),
    .wbs_bte_o (iatoi_or1k_i_bte),
    .wbs_dat_i (iatoi_or1k_i_dat),
    .wbs_ack_i (itoia_or1k_i_ack),
    .wbs_err_i (itoia_or1k_i_err),
    .wbs_rty_i (itoia_or1k_i_rty) 
    );


wb_intercon wb_intercon0
   (.wb_clk_i        (clk_i),
    .wb_rst_i        (rst_i),
    .wb_or1k_d_adr_i (datoi_or1k_d_adr),
    .wb_or1k_d_dat_i (datoi_or1k_d_dat),
    .wb_or1k_d_sel_i (datoi_or1k_d_sel),
    .wb_or1k_d_we_i  (datoi_or1k_d_we),
    .wb_or1k_d_cyc_i (datoi_or1k_d_cyc),
    .wb_or1k_d_stb_i (datoi_or1k_d_stb),
    .wb_or1k_d_cti_i (datoi_or1k_d_cti),
    .wb_or1k_d_bte_i (datoi_or1k_d_bte),
    .wb_or1k_d_dat_o (itoda_or1k_d_dat),
    .wb_or1k_d_ack_o (itoda_or1k_d_ack),
    .wb_or1k_d_err_o (itoda_or1k_d_err),
    .wb_or1k_d_rty_o (itoda_or1k_d_rty),
    .wb_or1k_i_adr_i (iatoi_or1k_i_adr),
    .wb_or1k_i_dat_i (iatoi_or1k_i_dat),
    .wb_or1k_i_sel_i (iatoi_or1k_i_sel),
    .wb_or1k_i_we_i  (iatoi_or1k_i_we),
    .wb_or1k_i_cyc_i (iatoi_or1k_i_cyc),
    .wb_or1k_i_stb_i (iatoi_or1k_i_stb),
    .wb_or1k_i_cti_i (iatoi_or1k_i_cti),
    .wb_or1k_i_bte_i (iatoi_or1k_i_bte),
    .wb_or1k_i_dat_o (itoia_or1k_i_dat),
    .wb_or1k_i_ack_o (itoia_or1k_i_ack),
    .wb_or1k_i_err_o (itoia_or1k_i_err),
    .wb_or1k_i_rty_o (itoia_or1k_i_rty),
 /*   .wb_dbg_adr_i    (gatoi_or1k_g_adr),
    .wb_dbg_dat_i    (gatoi_or1k_g_dat),
    .wb_dbg_sel_i    (gatoi_or1k_g_sel),
    .wb_dbg_we_i     (gatoi_or1k_g_we),
    .wb_dbg_cyc_i    (gatoi_or1k_g_cyc),
    .wb_dbg_stb_i    (gatoi_or1k_g_stb),*/
    .wb_dbg_cti_i    (3'b111),
/*    .wb_dbg_bte_i    (gatoi_or1k_g_bte),
    .wb_dbg_dat_o    (itoga_or1k_g_dat),
    .wb_dbg_ack_o    (itoga_or1k_g_ack),
    .wb_dbg_err_o    (itoga_or1k_g_err),
    .wb_dbg_rty_o    (itoga_or1k_g_rty),*/
    .wb_mem_adr_o    (mem_adr_o),
    .wb_mem_dat_o    (mem_dat_o),
    .wb_mem_sel_o    (mem_sel_o),
    .wb_mem_we_o     (mem_we_o),
    .wb_mem_cyc_o    (mem_cyc_o),
    .wb_mem_stb_o    (mem_stb_o),
    .wb_mem_cti_o    (mem_cti_o),
    .wb_mem_bte_o    (mem_bte_o),
    .wb_mem_dat_i    (mem_dat_i),
    .wb_mem_ack_i    (mem_ack_i),
    .wb_mem_err_i    (mem_err_i),
    .wb_mem_rty_i    (mem_rty_i),
    .wb_uart_adr_o   (uart_adr_o),
    .wb_uart_dat_o   (uart_dat_o),
    .wb_uart_sel_o   (uart_sel_o),
    .wb_uart_we_o    (uart_we_o),
    .wb_uart_cyc_o   (uart_cyc_o),
    .wb_uart_stb_o   (uart_stb_o),
    .wb_uart_cti_o   (uart_cti_o),
    .wb_uart_bte_o   (uart_bte_o),
    .wb_uart_dat_i   (uart_dat_i),
    .wb_uart_ack_i   (uart_ack_i),
    .wb_uart_err_i   (uart_err_i),
    .wb_uart_rty_i   (uart_rty_i));




endmodule
