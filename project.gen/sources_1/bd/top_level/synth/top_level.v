//Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
//--------------------------------------------------------------------------------
//Tool Version: Vivado v.2021.1 (lin64) Build 3247384 Thu Jun 10 19:36:07 MDT 2021
//Date        : Sun Jul 21 20:01:09 2024
//Host        : simtool-5 running 64-bit Ubuntu 20.04.6 LTS
//Command     : generate_target top_level.bd
//Design      : top_level
//Purpose     : IP block netlist
//--------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

module crossover_0x2_imp_85TGII
   (active_a,
    active_b,
    axis_rx_a_tdata,
    axis_rx_a_tkeep,
    axis_rx_a_tlast,
    axis_rx_a_tvalid,
    axis_rx_b_tdata,
    axis_rx_b_tkeep,
    axis_rx_b_tlast,
    axis_rx_b_tvalid,
    axis_tx_a_tdata,
    axis_tx_a_tkeep,
    axis_tx_a_tlast,
    axis_tx_a_tready,
    axis_tx_a_tvalid,
    axis_tx_b_tdata,
    axis_tx_b_tkeep,
    axis_tx_b_tlast,
    axis_tx_b_tready,
    axis_tx_b_tvalid,
    clk_a,
    clk_b,
    resetn_a,
    resetn_b);
  output active_a;
  output active_b;
  input [511:0]axis_rx_a_tdata;
  input [63:0]axis_rx_a_tkeep;
  input axis_rx_a_tlast;
  input axis_rx_a_tvalid;
  input [511:0]axis_rx_b_tdata;
  input [63:0]axis_rx_b_tkeep;
  input axis_rx_b_tlast;
  input axis_rx_b_tvalid;
  output [511:0]axis_tx_a_tdata;
  output [63:0]axis_tx_a_tkeep;
  output axis_tx_a_tlast;
  input axis_tx_a_tready;
  output axis_tx_a_tvalid;
  output [511:0]axis_tx_b_tdata;
  output [63:0]axis_tx_b_tkeep;
  output axis_tx_b_tlast;
  input axis_tx_b_tready;
  output axis_tx_b_tvalid;
  input clk_a;
  input clk_b;
  input resetn_a;
  input resetn_b;

  wire activity_mon_a_active;
  wire activity_mon_b_active;
  wire [511:0]axis_packetizer_a2b_m_axis_TDATA;
  wire [63:0]axis_packetizer_a2b_m_axis_TKEEP;
  wire axis_packetizer_a2b_m_axis_TLAST;
  wire axis_packetizer_a2b_m_axis_TREADY;
  wire axis_packetizer_a2b_m_axis_TVALID;
  wire [511:0]axis_packetizer_b2a_m_axis_TDATA;
  wire [63:0]axis_packetizer_b2a_m_axis_TKEEP;
  wire axis_packetizer_b2a_m_axis_TLAST;
  wire axis_packetizer_b2a_m_axis_TREADY;
  wire axis_packetizer_b2a_m_axis_TVALID;
  wire [511:0]axis_rx_a_1_TDATA;
  wire [63:0]axis_rx_a_1_TKEEP;
  wire axis_rx_a_1_TLAST;
  wire axis_rx_a_1_TVALID;
  wire [511:0]axis_rx_b_1_TDATA;
  wire [63:0]axis_rx_b_1_TKEEP;
  wire axis_rx_b_1_TLAST;
  wire axis_rx_b_1_TVALID;
  wire clk_a_1;
  wire clk_b_1;
  wire resetn_a_1;
  wire resetn_b_1;

  assign active_a = activity_mon_a_active;
  assign active_b = activity_mon_b_active;
  assign axis_packetizer_a2b_m_axis_TREADY = axis_tx_b_tready;
  assign axis_packetizer_b2a_m_axis_TREADY = axis_tx_a_tready;
  assign axis_rx_a_1_TDATA = axis_rx_a_tdata[511:0];
  assign axis_rx_a_1_TKEEP = axis_rx_a_tkeep[63:0];
  assign axis_rx_a_1_TLAST = axis_rx_a_tlast;
  assign axis_rx_a_1_TVALID = axis_rx_a_tvalid;
  assign axis_rx_b_1_TDATA = axis_rx_b_tdata[511:0];
  assign axis_rx_b_1_TKEEP = axis_rx_b_tkeep[63:0];
  assign axis_rx_b_1_TLAST = axis_rx_b_tlast;
  assign axis_rx_b_1_TVALID = axis_rx_b_tvalid;
  assign axis_tx_a_tdata[511:0] = axis_packetizer_b2a_m_axis_TDATA;
  assign axis_tx_a_tkeep[63:0] = axis_packetizer_b2a_m_axis_TKEEP;
  assign axis_tx_a_tlast = axis_packetizer_b2a_m_axis_TLAST;
  assign axis_tx_a_tvalid = axis_packetizer_b2a_m_axis_TVALID;
  assign axis_tx_b_tdata[511:0] = axis_packetizer_a2b_m_axis_TDATA;
  assign axis_tx_b_tkeep[63:0] = axis_packetizer_a2b_m_axis_TKEEP;
  assign axis_tx_b_tlast = axis_packetizer_a2b_m_axis_TLAST;
  assign axis_tx_b_tvalid = axis_packetizer_a2b_m_axis_TVALID;
  assign clk_a_1 = clk_a;
  assign clk_b_1 = clk_b;
  assign resetn_a_1 = resetn_a;
  assign resetn_b_1 = resetn_b;
  top_level_activity_mon_0_1 activity_mon_a
       (.active(activity_mon_a_active),
        .clk(clk_a_1),
        .resetn(resetn_a_1),
        .stream_tdata(axis_rx_a_1_TDATA),
        .stream_tvalid(axis_rx_a_1_TVALID));
  top_level_activity_mon_a_0 activity_mon_b
       (.active(activity_mon_b_active),
        .clk(clk_b_1),
        .resetn(resetn_b_1),
        .stream_tdata(axis_rx_b_1_TDATA),
        .stream_tvalid(axis_rx_b_1_TVALID));
  top_level_axis_packetizer_0_2 axis_packetizer_a2b
       (.m_axis_aclk(clk_b_1),
        .m_axis_aresetn(resetn_b_1),
        .m_axis_tdata(axis_packetizer_a2b_m_axis_TDATA),
        .m_axis_tkeep(axis_packetizer_a2b_m_axis_TKEEP),
        .m_axis_tlast(axis_packetizer_a2b_m_axis_TLAST),
        .m_axis_tready(axis_packetizer_a2b_m_axis_TREADY),
        .m_axis_tvalid(axis_packetizer_a2b_m_axis_TVALID),
        .s_axis_aclk(clk_a_1),
        .s_axis_aresetn(resetn_a_1),
        .s_axis_tdata(axis_rx_a_1_TDATA),
        .s_axis_tkeep(axis_rx_a_1_TKEEP),
        .s_axis_tlast(axis_rx_a_1_TLAST),
        .s_axis_tvalid(axis_rx_a_1_TVALID));
  top_level_axis_packetizer_a2b_0 axis_packetizer_b2a
       (.m_axis_aclk(clk_a_1),
        .m_axis_aresetn(resetn_a_1),
        .m_axis_tdata(axis_packetizer_b2a_m_axis_TDATA),
        .m_axis_tkeep(axis_packetizer_b2a_m_axis_TKEEP),
        .m_axis_tlast(axis_packetizer_b2a_m_axis_TLAST),
        .m_axis_tready(axis_packetizer_b2a_m_axis_TREADY),
        .m_axis_tvalid(axis_packetizer_b2a_m_axis_TVALID),
        .s_axis_aclk(clk_b_1),
        .s_axis_aresetn(resetn_b_1),
        .s_axis_tdata(axis_rx_b_1_TDATA),
        .s_axis_tkeep(axis_rx_b_1_TKEEP),
        .s_axis_tlast(axis_rx_b_1_TLAST),
        .s_axis_tvalid(axis_rx_b_1_TVALID));
endmodule

module crossover_1x3_imp_T5BRT7
   (active_a,
    active_b,
    axis_rx_a_tdata,
    axis_rx_a_tkeep,
    axis_rx_a_tlast,
    axis_rx_a_tvalid,
    axis_rx_b_tdata,
    axis_rx_b_tkeep,
    axis_rx_b_tlast,
    axis_rx_b_tvalid,
    axis_tx_a_tdata,
    axis_tx_a_tkeep,
    axis_tx_a_tlast,
    axis_tx_a_tready,
    axis_tx_a_tvalid,
    axis_tx_b_tdata,
    axis_tx_b_tkeep,
    axis_tx_b_tlast,
    axis_tx_b_tready,
    axis_tx_b_tvalid,
    clk_a,
    clk_b,
    resetn_a,
    resetn_b);
  output active_a;
  output active_b;
  input [511:0]axis_rx_a_tdata;
  input [63:0]axis_rx_a_tkeep;
  input axis_rx_a_tlast;
  input axis_rx_a_tvalid;
  input [511:0]axis_rx_b_tdata;
  input [63:0]axis_rx_b_tkeep;
  input axis_rx_b_tlast;
  input axis_rx_b_tvalid;
  output [511:0]axis_tx_a_tdata;
  output [63:0]axis_tx_a_tkeep;
  output axis_tx_a_tlast;
  input axis_tx_a_tready;
  output axis_tx_a_tvalid;
  output [511:0]axis_tx_b_tdata;
  output [63:0]axis_tx_b_tkeep;
  output axis_tx_b_tlast;
  input axis_tx_b_tready;
  output axis_tx_b_tvalid;
  input clk_a;
  input clk_b;
  input resetn_a;
  input resetn_b;

  wire activity_mon_a_active;
  wire activity_mon_b_active;
  wire [511:0]axis_packetizer_a2b_m_axis_TDATA;
  wire [63:0]axis_packetizer_a2b_m_axis_TKEEP;
  wire axis_packetizer_a2b_m_axis_TLAST;
  wire axis_packetizer_a2b_m_axis_TREADY;
  wire axis_packetizer_a2b_m_axis_TVALID;
  wire [511:0]axis_packetizer_b2a_m_axis_TDATA;
  wire [63:0]axis_packetizer_b2a_m_axis_TKEEP;
  wire axis_packetizer_b2a_m_axis_TLAST;
  wire axis_packetizer_b2a_m_axis_TREADY;
  wire axis_packetizer_b2a_m_axis_TVALID;
  wire [511:0]axis_rx_a_1_TDATA;
  wire [63:0]axis_rx_a_1_TKEEP;
  wire axis_rx_a_1_TLAST;
  wire axis_rx_a_1_TVALID;
  wire [511:0]axis_rx_b_1_TDATA;
  wire [63:0]axis_rx_b_1_TKEEP;
  wire axis_rx_b_1_TLAST;
  wire axis_rx_b_1_TVALID;
  wire clk_a_1;
  wire clk_b_1;
  wire resetn_a_1;
  wire resetn_b_1;

  assign active_a = activity_mon_a_active;
  assign active_b = activity_mon_b_active;
  assign axis_packetizer_a2b_m_axis_TREADY = axis_tx_b_tready;
  assign axis_packetizer_b2a_m_axis_TREADY = axis_tx_a_tready;
  assign axis_rx_a_1_TDATA = axis_rx_a_tdata[511:0];
  assign axis_rx_a_1_TKEEP = axis_rx_a_tkeep[63:0];
  assign axis_rx_a_1_TLAST = axis_rx_a_tlast;
  assign axis_rx_a_1_TVALID = axis_rx_a_tvalid;
  assign axis_rx_b_1_TDATA = axis_rx_b_tdata[511:0];
  assign axis_rx_b_1_TKEEP = axis_rx_b_tkeep[63:0];
  assign axis_rx_b_1_TLAST = axis_rx_b_tlast;
  assign axis_rx_b_1_TVALID = axis_rx_b_tvalid;
  assign axis_tx_a_tdata[511:0] = axis_packetizer_b2a_m_axis_TDATA;
  assign axis_tx_a_tkeep[63:0] = axis_packetizer_b2a_m_axis_TKEEP;
  assign axis_tx_a_tlast = axis_packetizer_b2a_m_axis_TLAST;
  assign axis_tx_a_tvalid = axis_packetizer_b2a_m_axis_TVALID;
  assign axis_tx_b_tdata[511:0] = axis_packetizer_a2b_m_axis_TDATA;
  assign axis_tx_b_tkeep[63:0] = axis_packetizer_a2b_m_axis_TKEEP;
  assign axis_tx_b_tlast = axis_packetizer_a2b_m_axis_TLAST;
  assign axis_tx_b_tvalid = axis_packetizer_a2b_m_axis_TVALID;
  assign clk_a_1 = clk_a;
  assign clk_b_1 = clk_b;
  assign resetn_a_1 = resetn_a;
  assign resetn_b_1 = resetn_b;
  top_level_activity_mon_a_1 activity_mon_a
       (.active(activity_mon_a_active),
        .clk(clk_a_1),
        .resetn(resetn_a_1),
        .stream_tdata(axis_rx_a_1_TDATA),
        .stream_tvalid(axis_rx_a_1_TVALID));
  top_level_activity_mon_b_0 activity_mon_b
       (.active(activity_mon_b_active),
        .clk(clk_b_1),
        .resetn(resetn_b_1),
        .stream_tdata(axis_rx_b_1_TDATA),
        .stream_tvalid(axis_rx_b_1_TVALID));
  top_level_axis_packetizer_a2b_1 axis_packetizer_a2b
       (.m_axis_aclk(clk_b_1),
        .m_axis_aresetn(resetn_b_1),
        .m_axis_tdata(axis_packetizer_a2b_m_axis_TDATA),
        .m_axis_tkeep(axis_packetizer_a2b_m_axis_TKEEP),
        .m_axis_tlast(axis_packetizer_a2b_m_axis_TLAST),
        .m_axis_tready(axis_packetizer_a2b_m_axis_TREADY),
        .m_axis_tvalid(axis_packetizer_a2b_m_axis_TVALID),
        .s_axis_aclk(clk_a_1),
        .s_axis_aresetn(resetn_a_1),
        .s_axis_tdata(axis_rx_a_1_TDATA),
        .s_axis_tkeep(axis_rx_a_1_TKEEP),
        .s_axis_tlast(axis_rx_a_1_TLAST),
        .s_axis_tvalid(axis_rx_a_1_TVALID));
  top_level_axis_packetizer_b2a_0 axis_packetizer_b2a
       (.m_axis_aclk(clk_a_1),
        .m_axis_aresetn(resetn_a_1),
        .m_axis_tdata(axis_packetizer_b2a_m_axis_TDATA),
        .m_axis_tkeep(axis_packetizer_b2a_m_axis_TKEEP),
        .m_axis_tlast(axis_packetizer_b2a_m_axis_TLAST),
        .m_axis_tready(axis_packetizer_b2a_m_axis_TREADY),
        .m_axis_tvalid(axis_packetizer_b2a_m_axis_TVALID),
        .s_axis_aclk(clk_b_1),
        .s_axis_aresetn(resetn_b_1),
        .s_axis_tdata(axis_rx_b_1_TDATA),
        .s_axis_tkeep(axis_rx_b_1_TKEEP),
        .s_axis_tlast(axis_rx_b_1_TLAST),
        .s_axis_tvalid(axis_rx_b_1_TVALID));
endmodule

module crossover_imp_1TLAWFG
   (active_0,
    active_1,
    active_2,
    active_3,
    aligned0,
    aligned1,
    aligned2,
    aligned3,
    init_clk,
    qsfp0_clk_clk_n,
    qsfp0_clk_clk_p,
    qsfp0_gt_grx_n,
    qsfp0_gt_grx_p,
    qsfp0_gt_gtx_n,
    qsfp0_gt_gtx_p,
    qsfp1_clk_clk_n,
    qsfp1_clk_clk_p,
    qsfp1_gt_grx_n,
    qsfp1_gt_grx_p,
    qsfp1_gt_gtx_n,
    qsfp1_gt_gtx_p,
    qsfp2_clk_clk_n,
    qsfp2_clk_clk_p,
    qsfp2_gt_grx_n,
    qsfp2_gt_grx_p,
    qsfp2_gt_gtx_n,
    qsfp2_gt_gtx_p,
    qsfp3_clk_clk_n,
    qsfp3_clk_clk_p,
    qsfp3_gt_grx_n,
    qsfp3_gt_grx_p,
    qsfp3_gt_gtx_n,
    qsfp3_gt_gtx_p,
    sys_resetn);
  output active_0;
  output active_1;
  output active_2;
  output active_3;
  output aligned0;
  output aligned1;
  output aligned2;
  output aligned3;
  input init_clk;
  input qsfp0_clk_clk_n;
  input qsfp0_clk_clk_p;
  input [3:0]qsfp0_gt_grx_n;
  input [3:0]qsfp0_gt_grx_p;
  output [3:0]qsfp0_gt_gtx_n;
  output [3:0]qsfp0_gt_gtx_p;
  input qsfp1_clk_clk_n;
  input qsfp1_clk_clk_p;
  input [3:0]qsfp1_gt_grx_n;
  input [3:0]qsfp1_gt_grx_p;
  output [3:0]qsfp1_gt_gtx_n;
  output [3:0]qsfp1_gt_gtx_p;
  input qsfp2_clk_clk_n;
  input qsfp2_clk_clk_p;
  input [3:0]qsfp2_gt_grx_n;
  input [3:0]qsfp2_gt_grx_p;
  output [3:0]qsfp2_gt_gtx_n;
  output [3:0]qsfp2_gt_gtx_p;
  input qsfp3_clk_clk_n;
  input qsfp3_clk_clk_p;
  input [3:0]qsfp3_gt_grx_n;
  input [3:0]qsfp3_gt_grx_p;
  output [3:0]qsfp3_gt_gtx_n;
  output [3:0]qsfp3_gt_gtx_p;
  input sys_resetn;

  wire [511:0]axis_rx_a_1_TDATA;
  wire [63:0]axis_rx_a_1_TKEEP;
  wire axis_rx_a_1_TLAST;
  wire axis_rx_a_1_TVALID;
  wire [511:0]axis_rx_b_1_TDATA;
  wire [63:0]axis_rx_b_1_TKEEP;
  wire axis_rx_b_1_TLAST;
  wire axis_rx_b_1_TVALID;
  wire [511:0]axis_tx_1_TDATA;
  wire [63:0]axis_tx_1_TKEEP;
  wire axis_tx_1_TLAST;
  wire axis_tx_1_TREADY;
  wire axis_tx_1_TVALID;
  wire [511:0]axis_tx_2_TDATA;
  wire [63:0]axis_tx_2_TKEEP;
  wire axis_tx_2_TLAST;
  wire axis_tx_2_TREADY;
  wire axis_tx_2_TVALID;
  wire clk_a_1;
  wire clk_b_1;
  wire crossover_0x2_active_a;
  wire crossover_0x2_active_b;
  wire [511:0]crossover_0x2_axis_tx_a_TDATA;
  wire [63:0]crossover_0x2_axis_tx_a_TKEEP;
  wire crossover_0x2_axis_tx_a_TLAST;
  wire crossover_0x2_axis_tx_a_TREADY;
  wire crossover_0x2_axis_tx_a_TVALID;
  wire [511:0]crossover_0x2_axis_tx_b_TDATA;
  wire [63:0]crossover_0x2_axis_tx_b_TKEEP;
  wire crossover_0x2_axis_tx_b_TLAST;
  wire crossover_0x2_axis_tx_b_TREADY;
  wire crossover_0x2_axis_tx_b_TVALID;
  wire crossover_1x3_active_a;
  wire crossover_1x3_active_b;
  wire [511:0]eth1_axis_rx_TDATA;
  wire [63:0]eth1_axis_rx_TKEEP;
  wire eth1_axis_rx_TLAST;
  wire eth1_axis_rx_TVALID;
  wire eth1_stream_clk;
  wire eth1_stream_resetn;
  wire [511:0]eth3_axis_rx_TDATA;
  wire [63:0]eth3_axis_rx_TKEEP;
  wire eth3_axis_rx_TLAST;
  wire eth3_axis_rx_TVALID;
  wire eth3_stream_clk;
  wire eth3_stream_resetn;
  wire eth_aligned;
  wire eth_aligned1;
  wire eth_aligned2;
  wire eth_aligned3;
  wire [3:0]eth_qsfp_gt1_GRX_N;
  wire [3:0]eth_qsfp_gt1_GRX_P;
  wire [3:0]eth_qsfp_gt1_GTX_N;
  wire [3:0]eth_qsfp_gt1_GTX_P;
  wire [3:0]eth_qsfp_gt2_GRX_N;
  wire [3:0]eth_qsfp_gt2_GRX_P;
  wire [3:0]eth_qsfp_gt2_GTX_N;
  wire [3:0]eth_qsfp_gt2_GTX_P;
  wire [3:0]eth_qsfp_gt3_GRX_N;
  wire [3:0]eth_qsfp_gt3_GRX_P;
  wire [3:0]eth_qsfp_gt3_GTX_N;
  wire [3:0]eth_qsfp_gt3_GTX_P;
  wire [3:0]eth_qsfp_gt_GRX_N;
  wire [3:0]eth_qsfp_gt_GRX_P;
  wire [3:0]eth_qsfp_gt_GTX_N;
  wire [3:0]eth_qsfp_gt_GTX_P;
  wire init_clk_0_1;
  wire qsfp0_clk_1_CLK_N;
  wire qsfp0_clk_1_CLK_P;
  wire qsfp1_clk_1_CLK_N;
  wire qsfp1_clk_1_CLK_P;
  wire qsfp2_clk_1_CLK_N;
  wire qsfp2_clk_1_CLK_P;
  wire qsfp3_clk_1_CLK_N;
  wire qsfp3_clk_1_CLK_P;
  wire resetn_a_1;
  wire resetn_b_1;
  wire source_200Mhz_resetn;

  assign active_0 = crossover_0x2_active_a;
  assign active_1 = crossover_1x3_active_a;
  assign active_2 = crossover_0x2_active_b;
  assign active_3 = crossover_1x3_active_b;
  assign aligned0 = eth_aligned;
  assign aligned1 = eth_aligned2;
  assign aligned2 = eth_aligned1;
  assign aligned3 = eth_aligned3;
  assign eth_qsfp_gt1_GRX_N = qsfp2_gt_grx_n[3:0];
  assign eth_qsfp_gt1_GRX_P = qsfp2_gt_grx_p[3:0];
  assign eth_qsfp_gt2_GRX_N = qsfp1_gt_grx_n[3:0];
  assign eth_qsfp_gt2_GRX_P = qsfp1_gt_grx_p[3:0];
  assign eth_qsfp_gt3_GRX_N = qsfp3_gt_grx_n[3:0];
  assign eth_qsfp_gt3_GRX_P = qsfp3_gt_grx_p[3:0];
  assign eth_qsfp_gt_GRX_N = qsfp0_gt_grx_n[3:0];
  assign eth_qsfp_gt_GRX_P = qsfp0_gt_grx_p[3:0];
  assign init_clk_0_1 = init_clk;
  assign qsfp0_clk_1_CLK_N = qsfp0_clk_clk_n;
  assign qsfp0_clk_1_CLK_P = qsfp0_clk_clk_p;
  assign qsfp0_gt_gtx_n[3:0] = eth_qsfp_gt_GTX_N;
  assign qsfp0_gt_gtx_p[3:0] = eth_qsfp_gt_GTX_P;
  assign qsfp1_clk_1_CLK_N = qsfp1_clk_clk_n;
  assign qsfp1_clk_1_CLK_P = qsfp1_clk_clk_p;
  assign qsfp1_gt_gtx_n[3:0] = eth_qsfp_gt2_GTX_N;
  assign qsfp1_gt_gtx_p[3:0] = eth_qsfp_gt2_GTX_P;
  assign qsfp2_clk_1_CLK_N = qsfp2_clk_clk_n;
  assign qsfp2_clk_1_CLK_P = qsfp2_clk_clk_p;
  assign qsfp2_gt_gtx_n[3:0] = eth_qsfp_gt1_GTX_N;
  assign qsfp2_gt_gtx_p[3:0] = eth_qsfp_gt1_GTX_P;
  assign qsfp3_clk_1_CLK_N = qsfp3_clk_clk_n;
  assign qsfp3_clk_1_CLK_P = qsfp3_clk_clk_p;
  assign qsfp3_gt_gtx_n[3:0] = eth_qsfp_gt3_GTX_N;
  assign qsfp3_gt_gtx_p[3:0] = eth_qsfp_gt3_GTX_P;
  assign source_200Mhz_resetn = sys_resetn;
  crossover_0x2_imp_85TGII crossover_0x2
       (.active_a(crossover_0x2_active_a),
        .active_b(crossover_0x2_active_b),
        .axis_rx_a_tdata(axis_rx_a_1_TDATA),
        .axis_rx_a_tkeep(axis_rx_a_1_TKEEP),
        .axis_rx_a_tlast(axis_rx_a_1_TLAST),
        .axis_rx_a_tvalid(axis_rx_a_1_TVALID),
        .axis_rx_b_tdata(axis_rx_b_1_TDATA),
        .axis_rx_b_tkeep(axis_rx_b_1_TKEEP),
        .axis_rx_b_tlast(axis_rx_b_1_TLAST),
        .axis_rx_b_tvalid(axis_rx_b_1_TVALID),
        .axis_tx_a_tdata(crossover_0x2_axis_tx_a_TDATA),
        .axis_tx_a_tkeep(crossover_0x2_axis_tx_a_TKEEP),
        .axis_tx_a_tlast(crossover_0x2_axis_tx_a_TLAST),
        .axis_tx_a_tready(crossover_0x2_axis_tx_a_TREADY),
        .axis_tx_a_tvalid(crossover_0x2_axis_tx_a_TVALID),
        .axis_tx_b_tdata(crossover_0x2_axis_tx_b_TDATA),
        .axis_tx_b_tkeep(crossover_0x2_axis_tx_b_TKEEP),
        .axis_tx_b_tlast(crossover_0x2_axis_tx_b_TLAST),
        .axis_tx_b_tready(crossover_0x2_axis_tx_b_TREADY),
        .axis_tx_b_tvalid(crossover_0x2_axis_tx_b_TVALID),
        .clk_a(clk_a_1),
        .clk_b(clk_b_1),
        .resetn_a(resetn_a_1),
        .resetn_b(resetn_b_1));
  crossover_1x3_imp_T5BRT7 crossover_1x3
       (.active_a(crossover_1x3_active_a),
        .active_b(crossover_1x3_active_b),
        .axis_rx_a_tdata(eth1_axis_rx_TDATA),
        .axis_rx_a_tkeep(eth1_axis_rx_TKEEP),
        .axis_rx_a_tlast(eth1_axis_rx_TLAST),
        .axis_rx_a_tvalid(eth1_axis_rx_TVALID),
        .axis_rx_b_tdata(eth3_axis_rx_TDATA),
        .axis_rx_b_tkeep(eth3_axis_rx_TKEEP),
        .axis_rx_b_tlast(eth3_axis_rx_TLAST),
        .axis_rx_b_tvalid(eth3_axis_rx_TVALID),
        .axis_tx_a_tdata(axis_tx_1_TDATA),
        .axis_tx_a_tkeep(axis_tx_1_TKEEP),
        .axis_tx_a_tlast(axis_tx_1_TLAST),
        .axis_tx_a_tready(axis_tx_1_TREADY),
        .axis_tx_a_tvalid(axis_tx_1_TVALID),
        .axis_tx_b_tdata(axis_tx_2_TDATA),
        .axis_tx_b_tkeep(axis_tx_2_TKEEP),
        .axis_tx_b_tlast(axis_tx_2_TLAST),
        .axis_tx_b_tready(axis_tx_2_TREADY),
        .axis_tx_b_tvalid(axis_tx_2_TVALID),
        .clk_a(eth1_stream_clk),
        .clk_b(eth3_stream_clk),
        .resetn_a(eth1_stream_resetn),
        .resetn_b(eth3_stream_resetn));
  eth0_imp_SATJJ6 eth0
       (.aligned(eth_aligned),
        .axis_rx_tdata(axis_rx_a_1_TDATA),
        .axis_rx_tkeep(axis_rx_a_1_TKEEP),
        .axis_rx_tlast(axis_rx_a_1_TLAST),
        .axis_rx_tvalid(axis_rx_a_1_TVALID),
        .axis_tx_tdata(crossover_0x2_axis_tx_a_TDATA),
        .axis_tx_tkeep(crossover_0x2_axis_tx_a_TKEEP),
        .axis_tx_tlast(crossover_0x2_axis_tx_a_TLAST),
        .axis_tx_tready(crossover_0x2_axis_tx_a_TREADY),
        .axis_tx_tvalid(crossover_0x2_axis_tx_a_TVALID),
        .init_clk(init_clk_0_1),
        .qsfp_clk_clk_n(qsfp0_clk_1_CLK_N),
        .qsfp_clk_clk_p(qsfp0_clk_1_CLK_P),
        .qsfp_gt_grx_n(eth_qsfp_gt_GRX_N),
        .qsfp_gt_grx_p(eth_qsfp_gt_GRX_P),
        .qsfp_gt_gtx_n(eth_qsfp_gt_GTX_N),
        .qsfp_gt_gtx_p(eth_qsfp_gt_GTX_P),
        .stream_clk(clk_a_1),
        .stream_resetn(resetn_a_1),
        .sys_resetn(source_200Mhz_resetn));
  eth1_imp_12CTVKS eth1
       (.aligned(eth_aligned2),
        .axis_rx_tdata(eth1_axis_rx_TDATA),
        .axis_rx_tkeep(eth1_axis_rx_TKEEP),
        .axis_rx_tlast(eth1_axis_rx_TLAST),
        .axis_rx_tvalid(eth1_axis_rx_TVALID),
        .axis_tx_tdata(axis_tx_1_TDATA),
        .axis_tx_tkeep(axis_tx_1_TKEEP),
        .axis_tx_tlast(axis_tx_1_TLAST),
        .axis_tx_tready(axis_tx_1_TREADY),
        .axis_tx_tvalid(axis_tx_1_TVALID),
        .init_clk(init_clk_0_1),
        .qsfp_clk_clk_n(qsfp1_clk_1_CLK_N),
        .qsfp_clk_clk_p(qsfp1_clk_1_CLK_P),
        .qsfp_gt_grx_n(eth_qsfp_gt2_GRX_N),
        .qsfp_gt_grx_p(eth_qsfp_gt2_GRX_P),
        .qsfp_gt_gtx_n(eth_qsfp_gt2_GTX_N),
        .qsfp_gt_gtx_p(eth_qsfp_gt2_GTX_P),
        .stream_clk(eth1_stream_clk),
        .stream_resetn(eth1_stream_resetn),
        .sys_resetn(source_200Mhz_resetn));
  eth2_imp_QXBGNZ eth2
       (.aligned(eth_aligned1),
        .axis_rx_tdata(axis_rx_b_1_TDATA),
        .axis_rx_tkeep(axis_rx_b_1_TKEEP),
        .axis_rx_tlast(axis_rx_b_1_TLAST),
        .axis_rx_tvalid(axis_rx_b_1_TVALID),
        .axis_tx_tdata(crossover_0x2_axis_tx_b_TDATA),
        .axis_tx_tkeep(crossover_0x2_axis_tx_b_TKEEP),
        .axis_tx_tlast(crossover_0x2_axis_tx_b_TLAST),
        .axis_tx_tready(crossover_0x2_axis_tx_b_TREADY),
        .axis_tx_tvalid(crossover_0x2_axis_tx_b_TVALID),
        .init_clk(init_clk_0_1),
        .qsfp_clk_clk_n(qsfp2_clk_1_CLK_N),
        .qsfp_clk_clk_p(qsfp2_clk_1_CLK_P),
        .qsfp_gt_grx_n(eth_qsfp_gt1_GRX_N),
        .qsfp_gt_grx_p(eth_qsfp_gt1_GRX_P),
        .qsfp_gt_gtx_n(eth_qsfp_gt1_GTX_N),
        .qsfp_gt_gtx_p(eth_qsfp_gt1_GTX_P),
        .stream_clk(clk_b_1),
        .stream_resetn(resetn_b_1),
        .sys_resetn(source_200Mhz_resetn));
  eth3_imp_13M8N4X eth3
       (.aligned(eth_aligned3),
        .axis_rx_tdata(eth3_axis_rx_TDATA),
        .axis_rx_tkeep(eth3_axis_rx_TKEEP),
        .axis_rx_tlast(eth3_axis_rx_TLAST),
        .axis_rx_tvalid(eth3_axis_rx_TVALID),
        .axis_tx_tdata(axis_tx_2_TDATA),
        .axis_tx_tkeep(axis_tx_2_TKEEP),
        .axis_tx_tlast(axis_tx_2_TLAST),
        .axis_tx_tready(axis_tx_2_TREADY),
        .axis_tx_tvalid(axis_tx_2_TVALID),
        .init_clk(init_clk_0_1),
        .qsfp_clk_clk_n(qsfp3_clk_1_CLK_N),
        .qsfp_clk_clk_p(qsfp3_clk_1_CLK_P),
        .qsfp_gt_grx_n(eth_qsfp_gt3_GRX_N),
        .qsfp_gt_grx_p(eth_qsfp_gt3_GRX_P),
        .qsfp_gt_gtx_n(eth_qsfp_gt3_GTX_N),
        .qsfp_gt_gtx_p(eth_qsfp_gt3_GTX_P),
        .stream_clk(eth3_stream_clk),
        .stream_resetn(eth3_stream_resetn),
        .sys_resetn(source_200Mhz_resetn));
endmodule

module eth0_imp_SATJJ6
   (aligned,
    axis_rx_tdata,
    axis_rx_tkeep,
    axis_rx_tlast,
    axis_rx_tvalid,
    axis_tx_tdata,
    axis_tx_tkeep,
    axis_tx_tlast,
    axis_tx_tready,
    axis_tx_tvalid,
    init_clk,
    qsfp_clk_clk_n,
    qsfp_clk_clk_p,
    qsfp_gt_grx_n,
    qsfp_gt_grx_p,
    qsfp_gt_gtx_n,
    qsfp_gt_gtx_p,
    stream_clk,
    stream_resetn,
    sys_resetn);
  output aligned;
  output [511:0]axis_rx_tdata;
  output [63:0]axis_rx_tkeep;
  output axis_rx_tlast;
  output axis_rx_tvalid;
  input [511:0]axis_tx_tdata;
  input [63:0]axis_tx_tkeep;
  input axis_tx_tlast;
  output axis_tx_tready;
  input axis_tx_tvalid;
  input init_clk;
  input qsfp_clk_clk_n;
  input qsfp_clk_clk_p;
  input [3:0]qsfp_gt_grx_n;
  input [3:0]qsfp_gt_grx_p;
  output [3:0]qsfp_gt_gtx_n;
  output [3:0]qsfp_gt_gtx_p;
  output stream_clk;
  output stream_resetn;
  input sys_resetn;

  wire [511:0]Conn1_TDATA;
  wire [63:0]Conn1_TKEEP;
  wire Conn1_TLAST;
  wire Conn1_TREADY;
  wire Conn1_TVALID;
  wire clk_0_1;
  wire [511:0]cmac_axis_rx_TDATA;
  wire [63:0]cmac_axis_rx_TKEEP;
  wire cmac_axis_rx_TLAST;
  wire cmac_axis_rx_TVALID;
  wire cmac_control_0_ctl_rx_ctl_enable;
  wire cmac_control_0_ctl_tx_ctl_enable;
  wire cmac_control_0_ctl_tx_ctl_tx_send_rfi;
  wire [19:0]cmac_control_0_gt_trans_debug_gt_txdiffctrl;
  wire [19:0]cmac_control_0_gt_trans_debug_gt_txprecursor;
  wire cmac_control_0_reset_rx_datapath;
  wire cmac_control_0_rs_fec_ctl_rx_rsfec_enable;
  wire cmac_control_0_rs_fec_ctl_rx_rsfec_enable_correction;
  wire cmac_control_0_rs_fec_ctl_rx_rsfec_enable_indication;
  wire cmac_control_0_rs_fec_ctl_tx_rsfec_enable;
  wire cmac_control_0_rx_resetn_out;
  wire cmac_control_0_sync_rx_aligned;
  wire cmac_control_sys_reset_out;
  wire cmac_gt_rxusrclk2;
  wire cmac_stat_rx_stat_rx_aligned;
  wire [3:0]cmac_usplus_0_gt_serial_port_GRX_N;
  wire [3:0]cmac_usplus_0_gt_serial_port_GRX_P;
  wire [3:0]cmac_usplus_0_gt_serial_port_GTX_N;
  wire [3:0]cmac_usplus_0_gt_serial_port_GTX_P;
  wire gt_ref_clk_0_1_CLK_N;
  wire gt_ref_clk_0_1_CLK_P;
  wire sys_resetn_1;

  assign Conn1_TDATA = axis_tx_tdata[511:0];
  assign Conn1_TKEEP = axis_tx_tkeep[63:0];
  assign Conn1_TLAST = axis_tx_tlast;
  assign Conn1_TVALID = axis_tx_tvalid;
  assign aligned = cmac_control_0_sync_rx_aligned;
  assign axis_rx_tdata[511:0] = cmac_axis_rx_TDATA;
  assign axis_rx_tkeep[63:0] = cmac_axis_rx_TKEEP;
  assign axis_rx_tlast = cmac_axis_rx_TLAST;
  assign axis_rx_tvalid = cmac_axis_rx_TVALID;
  assign axis_tx_tready = Conn1_TREADY;
  assign clk_0_1 = init_clk;
  assign cmac_usplus_0_gt_serial_port_GRX_N = qsfp_gt_grx_n[3:0];
  assign cmac_usplus_0_gt_serial_port_GRX_P = qsfp_gt_grx_p[3:0];
  assign gt_ref_clk_0_1_CLK_N = qsfp_clk_clk_n;
  assign gt_ref_clk_0_1_CLK_P = qsfp_clk_clk_p;
  assign qsfp_gt_gtx_n[3:0] = cmac_usplus_0_gt_serial_port_GTX_N;
  assign qsfp_gt_gtx_p[3:0] = cmac_usplus_0_gt_serial_port_GTX_P;
  assign stream_clk = cmac_gt_rxusrclk2;
  assign stream_resetn = cmac_control_0_rx_resetn_out;
  assign sys_resetn_1 = sys_resetn;
  top_level_cmac_usplus_0_0 cmac
       (.common0_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .common0_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .common0_drpen(1'b0),
        .common0_drpwe(1'b0),
        .core_drp_reset(1'b0),
        .core_rx_reset(1'b0),
        .core_tx_reset(1'b0),
        .ctl_rsfec_ieee_error_indication_mode(1'b0),
        .ctl_rx_enable(cmac_control_0_ctl_rx_ctl_enable),
        .ctl_rx_force_resync(1'b0),
        .ctl_rx_rsfec_enable(cmac_control_0_rs_fec_ctl_rx_rsfec_enable),
        .ctl_rx_rsfec_enable_correction(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_correction),
        .ctl_rx_rsfec_enable_indication(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_indication),
        .ctl_rx_test_pattern(1'b0),
        .ctl_tx_enable(cmac_control_0_ctl_tx_ctl_enable),
        .ctl_tx_rsfec_enable(cmac_control_0_rs_fec_ctl_tx_rsfec_enable),
        .ctl_tx_send_idle(1'b0),
        .ctl_tx_send_lfi(1'b0),
        .ctl_tx_send_rfi(cmac_control_0_ctl_tx_ctl_tx_send_rfi),
        .ctl_tx_test_pattern(1'b0),
        .drp_addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_clk(clk_0_1),
        .drp_di({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_en(1'b0),
        .drp_we(1'b0),
        .gt0_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt0_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt0_drpen(1'b0),
        .gt0_drpwe(1'b0),
        .gt1_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt1_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt1_drpen(1'b0),
        .gt1_drpwe(1'b0),
        .gt2_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt2_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt2_drpen(1'b0),
        .gt2_drpwe(1'b0),
        .gt3_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt3_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt3_drpen(1'b0),
        .gt3_drpwe(1'b0),
        .gt_drpclk(clk_0_1),
        .gt_eyescanreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_eyescantrigger({1'b0,1'b0,1'b0,1'b0}),
        .gt_loopback_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_ref_clk_n(gt_ref_clk_0_1_CLK_N),
        .gt_ref_clk_p(gt_ref_clk_0_1_CLK_P),
        .gt_rxcdrhold({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxdfelpmreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxlpmen({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxn_in(cmac_usplus_0_gt_serial_port_GRX_N),
        .gt_rxp_in(cmac_usplus_0_gt_serial_port_GRX_P),
        .gt_rxpolarity({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxprbscntreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxprbssel({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_rxrate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txdiffctrl(cmac_control_0_gt_trans_debug_gt_txdiffctrl),
        .gt_txinhibit({1'b0,1'b0,1'b0,1'b0}),
        .gt_txn_out(cmac_usplus_0_gt_serial_port_GTX_N),
        .gt_txp_out(cmac_usplus_0_gt_serial_port_GTX_P),
        .gt_txpippmen({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpippmsel({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpolarity({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpostcursor({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txprbsforceerr({1'b0,1'b0,1'b0,1'b0}),
        .gt_txprbssel({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txprecursor(cmac_control_0_gt_trans_debug_gt_txprecursor),
        .gt_txusrclk2(cmac_gt_rxusrclk2),
        .gtwiz_reset_rx_datapath(cmac_control_0_reset_rx_datapath),
        .gtwiz_reset_tx_datapath(1'b0),
        .init_clk(clk_0_1),
        .rx_axis_tdata(cmac_axis_rx_TDATA),
        .rx_axis_tkeep(cmac_axis_rx_TKEEP),
        .rx_axis_tlast(cmac_axis_rx_TLAST),
        .rx_axis_tvalid(cmac_axis_rx_TVALID),
        .rx_clk(cmac_gt_rxusrclk2),
        .stat_rx_aligned(cmac_stat_rx_stat_rx_aligned),
        .sys_reset(cmac_control_sys_reset_out),
        .tx_axis_tdata(Conn1_TDATA),
        .tx_axis_tkeep(Conn1_TKEEP),
        .tx_axis_tlast(Conn1_TLAST),
        .tx_axis_tready(Conn1_TREADY),
        .tx_axis_tuser(1'b0),
        .tx_axis_tvalid(Conn1_TVALID),
        .tx_preamblein({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  top_level_cmac_control_0_0 cmac_control
       (.ctl_rx_enable(cmac_control_0_ctl_rx_ctl_enable),
        .ctl_rx_rsfec_enable(cmac_control_0_rs_fec_ctl_rx_rsfec_enable),
        .ctl_rx_rsfec_enable_correction(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_correction),
        .ctl_rx_rsfec_enable_indication(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_indication),
        .ctl_tx_enable(cmac_control_0_ctl_tx_ctl_enable),
        .ctl_tx_rsfec_enable(cmac_control_0_rs_fec_ctl_tx_rsfec_enable),
        .ctl_tx_send_rfi(cmac_control_0_ctl_tx_ctl_tx_send_rfi),
        .gt_txdiffctrl(cmac_control_0_gt_trans_debug_gt_txdiffctrl),
        .gt_txprecursor(cmac_control_0_gt_trans_debug_gt_txprecursor),
        .reset_rx_datapath(cmac_control_0_reset_rx_datapath),
        .rx_clk(cmac_gt_rxusrclk2),
        .rx_resetn_out(cmac_control_0_rx_resetn_out),
        .stat_rx_aligned(cmac_stat_rx_stat_rx_aligned),
        .sync_rx_aligned(cmac_control_0_sync_rx_aligned),
        .sys_reset_out(cmac_control_sys_reset_out),
        .sys_resetn_in(sys_resetn_1));
endmodule

module eth1_imp_12CTVKS
   (aligned,
    axis_rx_tdata,
    axis_rx_tkeep,
    axis_rx_tlast,
    axis_rx_tvalid,
    axis_tx_tdata,
    axis_tx_tkeep,
    axis_tx_tlast,
    axis_tx_tready,
    axis_tx_tvalid,
    init_clk,
    qsfp_clk_clk_n,
    qsfp_clk_clk_p,
    qsfp_gt_grx_n,
    qsfp_gt_grx_p,
    qsfp_gt_gtx_n,
    qsfp_gt_gtx_p,
    stream_clk,
    stream_resetn,
    sys_resetn);
  output aligned;
  output [511:0]axis_rx_tdata;
  output [63:0]axis_rx_tkeep;
  output axis_rx_tlast;
  output axis_rx_tvalid;
  input [511:0]axis_tx_tdata;
  input [63:0]axis_tx_tkeep;
  input axis_tx_tlast;
  output axis_tx_tready;
  input axis_tx_tvalid;
  input init_clk;
  input qsfp_clk_clk_n;
  input qsfp_clk_clk_p;
  input [3:0]qsfp_gt_grx_n;
  input [3:0]qsfp_gt_grx_p;
  output [3:0]qsfp_gt_gtx_n;
  output [3:0]qsfp_gt_gtx_p;
  output stream_clk;
  output stream_resetn;
  input sys_resetn;

  wire [511:0]Conn1_TDATA;
  wire [63:0]Conn1_TKEEP;
  wire Conn1_TLAST;
  wire Conn1_TREADY;
  wire Conn1_TVALID;
  wire Conn3_CLK_N;
  wire Conn3_CLK_P;
  wire [511:0]cmac_axis_rx_TDATA;
  wire [63:0]cmac_axis_rx_TKEEP;
  wire cmac_axis_rx_TLAST;
  wire cmac_axis_rx_TVALID;
  wire cmac_control_0_ctl_rx_ctl_enable;
  wire cmac_control_0_ctl_tx_ctl_enable;
  wire cmac_control_0_ctl_tx_ctl_tx_send_rfi;
  wire [19:0]cmac_control_0_gt_trans_debug_gt_txdiffctrl;
  wire [19:0]cmac_control_0_gt_trans_debug_gt_txprecursor;
  wire cmac_control_0_reset_rx_datapath;
  wire cmac_control_0_rs_fec_ctl_rx_rsfec_enable;
  wire cmac_control_0_rs_fec_ctl_rx_rsfec_enable_correction;
  wire cmac_control_0_rs_fec_ctl_rx_rsfec_enable_indication;
  wire cmac_control_0_rs_fec_ctl_tx_rsfec_enable;
  wire cmac_control_0_rx_resetn_out;
  wire cmac_control_0_sync_rx_aligned;
  wire cmac_control_sys_reset_out;
  wire cmac_gt_rxusrclk2;
  wire cmac_stat_rx_stat_rx_aligned;
  wire [3:0]cmac_usplus_0_gt_serial_port_GRX_N;
  wire [3:0]cmac_usplus_0_gt_serial_port_GRX_P;
  wire [3:0]cmac_usplus_0_gt_serial_port_GTX_N;
  wire [3:0]cmac_usplus_0_gt_serial_port_GTX_P;
  wire init_clk_divider_init_clk;
  wire sys_resetn_1;

  assign Conn1_TDATA = axis_tx_tdata[511:0];
  assign Conn1_TKEEP = axis_tx_tkeep[63:0];
  assign Conn1_TLAST = axis_tx_tlast;
  assign Conn1_TVALID = axis_tx_tvalid;
  assign Conn3_CLK_N = qsfp_clk_clk_n;
  assign Conn3_CLK_P = qsfp_clk_clk_p;
  assign aligned = cmac_control_0_sync_rx_aligned;
  assign axis_rx_tdata[511:0] = cmac_axis_rx_TDATA;
  assign axis_rx_tkeep[63:0] = cmac_axis_rx_TKEEP;
  assign axis_rx_tlast = cmac_axis_rx_TLAST;
  assign axis_rx_tvalid = cmac_axis_rx_TVALID;
  assign axis_tx_tready = Conn1_TREADY;
  assign cmac_usplus_0_gt_serial_port_GRX_N = qsfp_gt_grx_n[3:0];
  assign cmac_usplus_0_gt_serial_port_GRX_P = qsfp_gt_grx_p[3:0];
  assign init_clk_divider_init_clk = init_clk;
  assign qsfp_gt_gtx_n[3:0] = cmac_usplus_0_gt_serial_port_GTX_N;
  assign qsfp_gt_gtx_p[3:0] = cmac_usplus_0_gt_serial_port_GTX_P;
  assign stream_clk = cmac_gt_rxusrclk2;
  assign stream_resetn = cmac_control_0_rx_resetn_out;
  assign sys_resetn_1 = sys_resetn;
  top_level_cmac_0 cmac
       (.common0_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .common0_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .common0_drpen(1'b0),
        .common0_drpwe(1'b0),
        .core_drp_reset(1'b0),
        .core_rx_reset(1'b0),
        .core_tx_reset(1'b0),
        .ctl_rsfec_ieee_error_indication_mode(1'b0),
        .ctl_rx_enable(cmac_control_0_ctl_rx_ctl_enable),
        .ctl_rx_force_resync(1'b0),
        .ctl_rx_rsfec_enable(cmac_control_0_rs_fec_ctl_rx_rsfec_enable),
        .ctl_rx_rsfec_enable_correction(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_correction),
        .ctl_rx_rsfec_enable_indication(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_indication),
        .ctl_rx_test_pattern(1'b0),
        .ctl_tx_enable(cmac_control_0_ctl_tx_ctl_enable),
        .ctl_tx_rsfec_enable(cmac_control_0_rs_fec_ctl_tx_rsfec_enable),
        .ctl_tx_send_idle(1'b0),
        .ctl_tx_send_lfi(1'b0),
        .ctl_tx_send_rfi(cmac_control_0_ctl_tx_ctl_tx_send_rfi),
        .ctl_tx_test_pattern(1'b0),
        .drp_addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_clk(init_clk_divider_init_clk),
        .drp_di({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_en(1'b0),
        .drp_we(1'b0),
        .gt0_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt0_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt0_drpen(1'b0),
        .gt0_drpwe(1'b0),
        .gt1_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt1_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt1_drpen(1'b0),
        .gt1_drpwe(1'b0),
        .gt2_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt2_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt2_drpen(1'b0),
        .gt2_drpwe(1'b0),
        .gt3_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt3_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt3_drpen(1'b0),
        .gt3_drpwe(1'b0),
        .gt_drpclk(init_clk_divider_init_clk),
        .gt_eyescanreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_eyescantrigger({1'b0,1'b0,1'b0,1'b0}),
        .gt_loopback_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_ref_clk_n(Conn3_CLK_N),
        .gt_ref_clk_p(Conn3_CLK_P),
        .gt_rxcdrhold({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxdfelpmreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxlpmen({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxn_in(cmac_usplus_0_gt_serial_port_GRX_N),
        .gt_rxp_in(cmac_usplus_0_gt_serial_port_GRX_P),
        .gt_rxpolarity({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxprbscntreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxprbssel({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_rxrate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txdiffctrl(cmac_control_0_gt_trans_debug_gt_txdiffctrl),
        .gt_txinhibit({1'b0,1'b0,1'b0,1'b0}),
        .gt_txn_out(cmac_usplus_0_gt_serial_port_GTX_N),
        .gt_txp_out(cmac_usplus_0_gt_serial_port_GTX_P),
        .gt_txpippmen({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpippmsel({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpolarity({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpostcursor({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txprbsforceerr({1'b0,1'b0,1'b0,1'b0}),
        .gt_txprbssel({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txprecursor(cmac_control_0_gt_trans_debug_gt_txprecursor),
        .gt_txusrclk2(cmac_gt_rxusrclk2),
        .gtwiz_reset_rx_datapath(cmac_control_0_reset_rx_datapath),
        .gtwiz_reset_tx_datapath(1'b0),
        .init_clk(init_clk_divider_init_clk),
        .rx_axis_tdata(cmac_axis_rx_TDATA),
        .rx_axis_tkeep(cmac_axis_rx_TKEEP),
        .rx_axis_tlast(cmac_axis_rx_TLAST),
        .rx_axis_tvalid(cmac_axis_rx_TVALID),
        .rx_clk(cmac_gt_rxusrclk2),
        .stat_rx_aligned(cmac_stat_rx_stat_rx_aligned),
        .sys_reset(cmac_control_sys_reset_out),
        .tx_axis_tdata(Conn1_TDATA),
        .tx_axis_tkeep(Conn1_TKEEP),
        .tx_axis_tlast(Conn1_TLAST),
        .tx_axis_tready(Conn1_TREADY),
        .tx_axis_tuser(1'b0),
        .tx_axis_tvalid(Conn1_TVALID),
        .tx_preamblein({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  top_level_cmac_control_0_1 cmac_control
       (.ctl_rx_enable(cmac_control_0_ctl_rx_ctl_enable),
        .ctl_rx_rsfec_enable(cmac_control_0_rs_fec_ctl_rx_rsfec_enable),
        .ctl_rx_rsfec_enable_correction(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_correction),
        .ctl_rx_rsfec_enable_indication(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_indication),
        .ctl_tx_enable(cmac_control_0_ctl_tx_ctl_enable),
        .ctl_tx_rsfec_enable(cmac_control_0_rs_fec_ctl_tx_rsfec_enable),
        .ctl_tx_send_rfi(cmac_control_0_ctl_tx_ctl_tx_send_rfi),
        .gt_txdiffctrl(cmac_control_0_gt_trans_debug_gt_txdiffctrl),
        .gt_txprecursor(cmac_control_0_gt_trans_debug_gt_txprecursor),
        .reset_rx_datapath(cmac_control_0_reset_rx_datapath),
        .rx_clk(cmac_gt_rxusrclk2),
        .rx_resetn_out(cmac_control_0_rx_resetn_out),
        .stat_rx_aligned(cmac_stat_rx_stat_rx_aligned),
        .sync_rx_aligned(cmac_control_0_sync_rx_aligned),
        .sys_reset_out(cmac_control_sys_reset_out),
        .sys_resetn_in(sys_resetn_1));
endmodule

module eth2_imp_QXBGNZ
   (aligned,
    axis_rx_tdata,
    axis_rx_tkeep,
    axis_rx_tlast,
    axis_rx_tvalid,
    axis_tx_tdata,
    axis_tx_tkeep,
    axis_tx_tlast,
    axis_tx_tready,
    axis_tx_tvalid,
    init_clk,
    qsfp_clk_clk_n,
    qsfp_clk_clk_p,
    qsfp_gt_grx_n,
    qsfp_gt_grx_p,
    qsfp_gt_gtx_n,
    qsfp_gt_gtx_p,
    stream_clk,
    stream_resetn,
    sys_resetn);
  output aligned;
  output [511:0]axis_rx_tdata;
  output [63:0]axis_rx_tkeep;
  output axis_rx_tlast;
  output axis_rx_tvalid;
  input [511:0]axis_tx_tdata;
  input [63:0]axis_tx_tkeep;
  input axis_tx_tlast;
  output axis_tx_tready;
  input axis_tx_tvalid;
  input init_clk;
  input qsfp_clk_clk_n;
  input qsfp_clk_clk_p;
  input [3:0]qsfp_gt_grx_n;
  input [3:0]qsfp_gt_grx_p;
  output [3:0]qsfp_gt_gtx_n;
  output [3:0]qsfp_gt_gtx_p;
  output stream_clk;
  output stream_resetn;
  input sys_resetn;

  wire [511:0]Conn1_TDATA;
  wire [63:0]Conn1_TKEEP;
  wire Conn1_TLAST;
  wire Conn1_TREADY;
  wire Conn1_TVALID;
  wire Conn3_CLK_N;
  wire Conn3_CLK_P;
  wire [511:0]cmac_axis_rx_TDATA;
  wire [63:0]cmac_axis_rx_TKEEP;
  wire cmac_axis_rx_TLAST;
  wire cmac_axis_rx_TVALID;
  wire cmac_control_0_ctl_rx_ctl_enable;
  wire cmac_control_0_ctl_tx_ctl_enable;
  wire cmac_control_0_ctl_tx_ctl_tx_send_rfi;
  wire [19:0]cmac_control_0_gt_trans_debug_gt_txdiffctrl;
  wire [19:0]cmac_control_0_gt_trans_debug_gt_txprecursor;
  wire cmac_control_0_reset_rx_datapath;
  wire cmac_control_0_rs_fec_ctl_rx_rsfec_enable;
  wire cmac_control_0_rs_fec_ctl_rx_rsfec_enable_correction;
  wire cmac_control_0_rs_fec_ctl_rx_rsfec_enable_indication;
  wire cmac_control_0_rs_fec_ctl_tx_rsfec_enable;
  wire cmac_control_0_rx_resetn_out;
  wire cmac_control_0_sync_rx_aligned;
  wire cmac_control_sys_reset_out;
  wire cmac_gt_rxusrclk2;
  wire cmac_stat_rx_stat_rx_aligned;
  wire [3:0]cmac_usplus_0_gt_serial_port_GRX_N;
  wire [3:0]cmac_usplus_0_gt_serial_port_GRX_P;
  wire [3:0]cmac_usplus_0_gt_serial_port_GTX_N;
  wire [3:0]cmac_usplus_0_gt_serial_port_GTX_P;
  wire init_clk_divider_init_clk;
  wire sys_resetn_1;

  assign Conn1_TDATA = axis_tx_tdata[511:0];
  assign Conn1_TKEEP = axis_tx_tkeep[63:0];
  assign Conn1_TLAST = axis_tx_tlast;
  assign Conn1_TVALID = axis_tx_tvalid;
  assign Conn3_CLK_N = qsfp_clk_clk_n;
  assign Conn3_CLK_P = qsfp_clk_clk_p;
  assign aligned = cmac_control_0_sync_rx_aligned;
  assign axis_rx_tdata[511:0] = cmac_axis_rx_TDATA;
  assign axis_rx_tkeep[63:0] = cmac_axis_rx_TKEEP;
  assign axis_rx_tlast = cmac_axis_rx_TLAST;
  assign axis_rx_tvalid = cmac_axis_rx_TVALID;
  assign axis_tx_tready = Conn1_TREADY;
  assign cmac_usplus_0_gt_serial_port_GRX_N = qsfp_gt_grx_n[3:0];
  assign cmac_usplus_0_gt_serial_port_GRX_P = qsfp_gt_grx_p[3:0];
  assign init_clk_divider_init_clk = init_clk;
  assign qsfp_gt_gtx_n[3:0] = cmac_usplus_0_gt_serial_port_GTX_N;
  assign qsfp_gt_gtx_p[3:0] = cmac_usplus_0_gt_serial_port_GTX_P;
  assign stream_clk = cmac_gt_rxusrclk2;
  assign stream_resetn = cmac_control_0_rx_resetn_out;
  assign sys_resetn_1 = sys_resetn;
  top_level_cmac_1 cmac
       (.common0_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .common0_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .common0_drpen(1'b0),
        .common0_drpwe(1'b0),
        .core_drp_reset(1'b0),
        .core_rx_reset(1'b0),
        .core_tx_reset(1'b0),
        .ctl_rsfec_ieee_error_indication_mode(1'b0),
        .ctl_rx_enable(cmac_control_0_ctl_rx_ctl_enable),
        .ctl_rx_force_resync(1'b0),
        .ctl_rx_rsfec_enable(cmac_control_0_rs_fec_ctl_rx_rsfec_enable),
        .ctl_rx_rsfec_enable_correction(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_correction),
        .ctl_rx_rsfec_enable_indication(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_indication),
        .ctl_rx_test_pattern(1'b0),
        .ctl_tx_enable(cmac_control_0_ctl_tx_ctl_enable),
        .ctl_tx_rsfec_enable(cmac_control_0_rs_fec_ctl_tx_rsfec_enable),
        .ctl_tx_send_idle(1'b0),
        .ctl_tx_send_lfi(1'b0),
        .ctl_tx_send_rfi(cmac_control_0_ctl_tx_ctl_tx_send_rfi),
        .ctl_tx_test_pattern(1'b0),
        .drp_addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_clk(init_clk_divider_init_clk),
        .drp_di({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_en(1'b0),
        .drp_we(1'b0),
        .gt0_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt0_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt0_drpen(1'b0),
        .gt0_drpwe(1'b0),
        .gt1_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt1_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt1_drpen(1'b0),
        .gt1_drpwe(1'b0),
        .gt2_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt2_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt2_drpen(1'b0),
        .gt2_drpwe(1'b0),
        .gt3_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt3_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt3_drpen(1'b0),
        .gt3_drpwe(1'b0),
        .gt_drpclk(init_clk_divider_init_clk),
        .gt_eyescanreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_eyescantrigger({1'b0,1'b0,1'b0,1'b0}),
        .gt_loopback_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_ref_clk_n(Conn3_CLK_N),
        .gt_ref_clk_p(Conn3_CLK_P),
        .gt_rxcdrhold({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxdfelpmreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxlpmen({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxn_in(cmac_usplus_0_gt_serial_port_GRX_N),
        .gt_rxp_in(cmac_usplus_0_gt_serial_port_GRX_P),
        .gt_rxpolarity({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxprbscntreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxprbssel({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_rxrate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txdiffctrl(cmac_control_0_gt_trans_debug_gt_txdiffctrl),
        .gt_txinhibit({1'b0,1'b0,1'b0,1'b0}),
        .gt_txn_out(cmac_usplus_0_gt_serial_port_GTX_N),
        .gt_txp_out(cmac_usplus_0_gt_serial_port_GTX_P),
        .gt_txpippmen({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpippmsel({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpolarity({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpostcursor({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txprbsforceerr({1'b0,1'b0,1'b0,1'b0}),
        .gt_txprbssel({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txprecursor(cmac_control_0_gt_trans_debug_gt_txprecursor),
        .gt_txusrclk2(cmac_gt_rxusrclk2),
        .gtwiz_reset_rx_datapath(cmac_control_0_reset_rx_datapath),
        .gtwiz_reset_tx_datapath(1'b0),
        .init_clk(init_clk_divider_init_clk),
        .rx_axis_tdata(cmac_axis_rx_TDATA),
        .rx_axis_tkeep(cmac_axis_rx_TKEEP),
        .rx_axis_tlast(cmac_axis_rx_TLAST),
        .rx_axis_tvalid(cmac_axis_rx_TVALID),
        .rx_clk(cmac_gt_rxusrclk2),
        .stat_rx_aligned(cmac_stat_rx_stat_rx_aligned),
        .sys_reset(cmac_control_sys_reset_out),
        .tx_axis_tdata(Conn1_TDATA),
        .tx_axis_tkeep(Conn1_TKEEP),
        .tx_axis_tlast(Conn1_TLAST),
        .tx_axis_tready(Conn1_TREADY),
        .tx_axis_tuser(1'b0),
        .tx_axis_tvalid(Conn1_TVALID),
        .tx_preamblein({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  top_level_cmac_control_0_2 cmac_control
       (.ctl_rx_enable(cmac_control_0_ctl_rx_ctl_enable),
        .ctl_rx_rsfec_enable(cmac_control_0_rs_fec_ctl_rx_rsfec_enable),
        .ctl_rx_rsfec_enable_correction(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_correction),
        .ctl_rx_rsfec_enable_indication(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_indication),
        .ctl_tx_enable(cmac_control_0_ctl_tx_ctl_enable),
        .ctl_tx_rsfec_enable(cmac_control_0_rs_fec_ctl_tx_rsfec_enable),
        .ctl_tx_send_rfi(cmac_control_0_ctl_tx_ctl_tx_send_rfi),
        .gt_txdiffctrl(cmac_control_0_gt_trans_debug_gt_txdiffctrl),
        .gt_txprecursor(cmac_control_0_gt_trans_debug_gt_txprecursor),
        .reset_rx_datapath(cmac_control_0_reset_rx_datapath),
        .rx_clk(cmac_gt_rxusrclk2),
        .rx_resetn_out(cmac_control_0_rx_resetn_out),
        .stat_rx_aligned(cmac_stat_rx_stat_rx_aligned),
        .sync_rx_aligned(cmac_control_0_sync_rx_aligned),
        .sys_reset_out(cmac_control_sys_reset_out),
        .sys_resetn_in(sys_resetn_1));
endmodule

module eth3_imp_13M8N4X
   (aligned,
    axis_rx_tdata,
    axis_rx_tkeep,
    axis_rx_tlast,
    axis_rx_tvalid,
    axis_tx_tdata,
    axis_tx_tkeep,
    axis_tx_tlast,
    axis_tx_tready,
    axis_tx_tvalid,
    init_clk,
    qsfp_clk_clk_n,
    qsfp_clk_clk_p,
    qsfp_gt_grx_n,
    qsfp_gt_grx_p,
    qsfp_gt_gtx_n,
    qsfp_gt_gtx_p,
    stream_clk,
    stream_resetn,
    sys_resetn);
  output aligned;
  output [511:0]axis_rx_tdata;
  output [63:0]axis_rx_tkeep;
  output axis_rx_tlast;
  output axis_rx_tvalid;
  input [511:0]axis_tx_tdata;
  input [63:0]axis_tx_tkeep;
  input axis_tx_tlast;
  output axis_tx_tready;
  input axis_tx_tvalid;
  input init_clk;
  input qsfp_clk_clk_n;
  input qsfp_clk_clk_p;
  input [3:0]qsfp_gt_grx_n;
  input [3:0]qsfp_gt_grx_p;
  output [3:0]qsfp_gt_gtx_n;
  output [3:0]qsfp_gt_gtx_p;
  output stream_clk;
  output stream_resetn;
  input sys_resetn;

  wire [511:0]Conn1_TDATA;
  wire [63:0]Conn1_TKEEP;
  wire Conn1_TLAST;
  wire Conn1_TREADY;
  wire Conn1_TVALID;
  wire Conn3_CLK_N;
  wire Conn3_CLK_P;
  wire [511:0]cmac_axis_rx_TDATA;
  wire [63:0]cmac_axis_rx_TKEEP;
  wire cmac_axis_rx_TLAST;
  wire cmac_axis_rx_TVALID;
  wire cmac_control_0_ctl_rx_ctl_enable;
  wire cmac_control_0_ctl_tx_ctl_enable;
  wire cmac_control_0_ctl_tx_ctl_tx_send_rfi;
  wire [19:0]cmac_control_0_gt_trans_debug_gt_txdiffctrl;
  wire [19:0]cmac_control_0_gt_trans_debug_gt_txprecursor;
  wire cmac_control_0_reset_rx_datapath;
  wire cmac_control_0_rs_fec_ctl_rx_rsfec_enable;
  wire cmac_control_0_rs_fec_ctl_rx_rsfec_enable_correction;
  wire cmac_control_0_rs_fec_ctl_rx_rsfec_enable_indication;
  wire cmac_control_0_rs_fec_ctl_tx_rsfec_enable;
  wire cmac_control_0_rx_resetn_out;
  wire cmac_control_0_sync_rx_aligned;
  wire cmac_control_sys_reset_out;
  wire cmac_gt_rxusrclk2;
  wire cmac_stat_rx_stat_rx_aligned;
  wire [3:0]cmac_usplus_0_gt_serial_port_GRX_N;
  wire [3:0]cmac_usplus_0_gt_serial_port_GRX_P;
  wire [3:0]cmac_usplus_0_gt_serial_port_GTX_N;
  wire [3:0]cmac_usplus_0_gt_serial_port_GTX_P;
  wire init_clk_divider_init_clk;
  wire sys_resetn_1;

  assign Conn1_TDATA = axis_tx_tdata[511:0];
  assign Conn1_TKEEP = axis_tx_tkeep[63:0];
  assign Conn1_TLAST = axis_tx_tlast;
  assign Conn1_TVALID = axis_tx_tvalid;
  assign Conn3_CLK_N = qsfp_clk_clk_n;
  assign Conn3_CLK_P = qsfp_clk_clk_p;
  assign aligned = cmac_control_0_sync_rx_aligned;
  assign axis_rx_tdata[511:0] = cmac_axis_rx_TDATA;
  assign axis_rx_tkeep[63:0] = cmac_axis_rx_TKEEP;
  assign axis_rx_tlast = cmac_axis_rx_TLAST;
  assign axis_rx_tvalid = cmac_axis_rx_TVALID;
  assign axis_tx_tready = Conn1_TREADY;
  assign cmac_usplus_0_gt_serial_port_GRX_N = qsfp_gt_grx_n[3:0];
  assign cmac_usplus_0_gt_serial_port_GRX_P = qsfp_gt_grx_p[3:0];
  assign init_clk_divider_init_clk = init_clk;
  assign qsfp_gt_gtx_n[3:0] = cmac_usplus_0_gt_serial_port_GTX_N;
  assign qsfp_gt_gtx_p[3:0] = cmac_usplus_0_gt_serial_port_GTX_P;
  assign stream_clk = cmac_gt_rxusrclk2;
  assign stream_resetn = cmac_control_0_rx_resetn_out;
  assign sys_resetn_1 = sys_resetn;
  top_level_cmac_2 cmac
       (.common0_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .common0_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .common0_drpen(1'b0),
        .common0_drpwe(1'b0),
        .core_drp_reset(1'b0),
        .core_rx_reset(1'b0),
        .core_tx_reset(1'b0),
        .ctl_rsfec_ieee_error_indication_mode(1'b0),
        .ctl_rx_enable(cmac_control_0_ctl_rx_ctl_enable),
        .ctl_rx_force_resync(1'b0),
        .ctl_rx_rsfec_enable(cmac_control_0_rs_fec_ctl_rx_rsfec_enable),
        .ctl_rx_rsfec_enable_correction(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_correction),
        .ctl_rx_rsfec_enable_indication(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_indication),
        .ctl_rx_test_pattern(1'b0),
        .ctl_tx_enable(cmac_control_0_ctl_tx_ctl_enable),
        .ctl_tx_rsfec_enable(cmac_control_0_rs_fec_ctl_tx_rsfec_enable),
        .ctl_tx_send_idle(1'b0),
        .ctl_tx_send_lfi(1'b0),
        .ctl_tx_send_rfi(cmac_control_0_ctl_tx_ctl_tx_send_rfi),
        .ctl_tx_test_pattern(1'b0),
        .drp_addr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_clk(init_clk_divider_init_clk),
        .drp_di({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .drp_en(1'b0),
        .drp_we(1'b0),
        .gt0_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt0_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt0_drpen(1'b0),
        .gt0_drpwe(1'b0),
        .gt1_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt1_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt1_drpen(1'b0),
        .gt1_drpwe(1'b0),
        .gt2_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt2_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt2_drpen(1'b0),
        .gt2_drpwe(1'b0),
        .gt3_drpaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt3_drpdi({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt3_drpen(1'b0),
        .gt3_drpwe(1'b0),
        .gt_drpclk(init_clk_divider_init_clk),
        .gt_eyescanreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_eyescantrigger({1'b0,1'b0,1'b0,1'b0}),
        .gt_loopback_in({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_ref_clk_n(Conn3_CLK_N),
        .gt_ref_clk_p(Conn3_CLK_P),
        .gt_rxcdrhold({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxdfelpmreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxlpmen({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxn_in(cmac_usplus_0_gt_serial_port_GRX_N),
        .gt_rxp_in(cmac_usplus_0_gt_serial_port_GRX_P),
        .gt_rxpolarity({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxprbscntreset({1'b0,1'b0,1'b0,1'b0}),
        .gt_rxprbssel({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_rxrate({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txdiffctrl(cmac_control_0_gt_trans_debug_gt_txdiffctrl),
        .gt_txinhibit({1'b0,1'b0,1'b0,1'b0}),
        .gt_txn_out(cmac_usplus_0_gt_serial_port_GTX_N),
        .gt_txp_out(cmac_usplus_0_gt_serial_port_GTX_P),
        .gt_txpippmen({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpippmsel({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpolarity({1'b0,1'b0,1'b0,1'b0}),
        .gt_txpostcursor({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txprbsforceerr({1'b0,1'b0,1'b0,1'b0}),
        .gt_txprbssel({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .gt_txprecursor(cmac_control_0_gt_trans_debug_gt_txprecursor),
        .gt_txusrclk2(cmac_gt_rxusrclk2),
        .gtwiz_reset_rx_datapath(cmac_control_0_reset_rx_datapath),
        .gtwiz_reset_tx_datapath(1'b0),
        .init_clk(init_clk_divider_init_clk),
        .rx_axis_tdata(cmac_axis_rx_TDATA),
        .rx_axis_tkeep(cmac_axis_rx_TKEEP),
        .rx_axis_tlast(cmac_axis_rx_TLAST),
        .rx_axis_tvalid(cmac_axis_rx_TVALID),
        .rx_clk(cmac_gt_rxusrclk2),
        .stat_rx_aligned(cmac_stat_rx_stat_rx_aligned),
        .sys_reset(cmac_control_sys_reset_out),
        .tx_axis_tdata(Conn1_TDATA),
        .tx_axis_tkeep(Conn1_TKEEP),
        .tx_axis_tlast(Conn1_TLAST),
        .tx_axis_tready(Conn1_TREADY),
        .tx_axis_tuser(1'b0),
        .tx_axis_tvalid(Conn1_TVALID),
        .tx_preamblein({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}));
  top_level_cmac_control_0_3 cmac_control
       (.ctl_rx_enable(cmac_control_0_ctl_rx_ctl_enable),
        .ctl_rx_rsfec_enable(cmac_control_0_rs_fec_ctl_rx_rsfec_enable),
        .ctl_rx_rsfec_enable_correction(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_correction),
        .ctl_rx_rsfec_enable_indication(cmac_control_0_rs_fec_ctl_rx_rsfec_enable_indication),
        .ctl_tx_enable(cmac_control_0_ctl_tx_ctl_enable),
        .ctl_tx_rsfec_enable(cmac_control_0_rs_fec_ctl_tx_rsfec_enable),
        .ctl_tx_send_rfi(cmac_control_0_ctl_tx_ctl_tx_send_rfi),
        .gt_txdiffctrl(cmac_control_0_gt_trans_debug_gt_txdiffctrl),
        .gt_txprecursor(cmac_control_0_gt_trans_debug_gt_txprecursor),
        .reset_rx_datapath(cmac_control_0_reset_rx_datapath),
        .rx_clk(cmac_gt_rxusrclk2),
        .rx_resetn_out(cmac_control_0_rx_resetn_out),
        .stat_rx_aligned(cmac_stat_rx_stat_rx_aligned),
        .sync_rx_aligned(cmac_control_0_sync_rx_aligned),
        .sys_reset_out(cmac_control_sys_reset_out),
        .sys_resetn_in(sys_resetn_1));
endmodule

module pcie_imp_P7FEFP
   (active0,
    active1,
    active2,
    active3,
    pcie_mgt_rxn,
    pcie_mgt_rxp,
    pcie_mgt_txn,
    pcie_mgt_txp,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p,
    resetn_out);
  input active0;
  input active1;
  input active2;
  input active3;
  input [15:0]pcie_mgt_rxn;
  input [15:0]pcie_mgt_rxp;
  output [15:0]pcie_mgt_txn;
  output [15:0]pcie_mgt_txp;
  input [0:0]pcie_refclk_clk_n;
  input [0:0]pcie_refclk_clk_p;
  output resetn_out;

  wire [0:0]CLK_IN_D_0_1_CLK_N;
  wire [0:0]CLK_IN_D_0_1_CLK_P;
  wire active0_1;
  wire active1_1;
  wire active2_1;
  wire active3_1;
  wire axi_config_resetn_out;
  wire [0:0]one_dout;
  wire [63:0]pcie_bridge_M_AXI_B_ARADDR;
  wire [1:0]pcie_bridge_M_AXI_B_ARBURST;
  wire [3:0]pcie_bridge_M_AXI_B_ARCACHE;
  wire [3:0]pcie_bridge_M_AXI_B_ARID;
  wire [7:0]pcie_bridge_M_AXI_B_ARLEN;
  wire pcie_bridge_M_AXI_B_ARLOCK;
  wire [2:0]pcie_bridge_M_AXI_B_ARPROT;
  wire pcie_bridge_M_AXI_B_ARREADY;
  wire [2:0]pcie_bridge_M_AXI_B_ARSIZE;
  wire pcie_bridge_M_AXI_B_ARVALID;
  wire [63:0]pcie_bridge_M_AXI_B_AWADDR;
  wire [1:0]pcie_bridge_M_AXI_B_AWBURST;
  wire [3:0]pcie_bridge_M_AXI_B_AWCACHE;
  wire [3:0]pcie_bridge_M_AXI_B_AWID;
  wire [7:0]pcie_bridge_M_AXI_B_AWLEN;
  wire pcie_bridge_M_AXI_B_AWLOCK;
  wire [2:0]pcie_bridge_M_AXI_B_AWPROT;
  wire pcie_bridge_M_AXI_B_AWREADY;
  wire [2:0]pcie_bridge_M_AXI_B_AWSIZE;
  wire pcie_bridge_M_AXI_B_AWVALID;
  wire [3:0]pcie_bridge_M_AXI_B_BID;
  wire pcie_bridge_M_AXI_B_BREADY;
  wire [1:0]pcie_bridge_M_AXI_B_BRESP;
  wire pcie_bridge_M_AXI_B_BVALID;
  wire [511:0]pcie_bridge_M_AXI_B_RDATA;
  wire [3:0]pcie_bridge_M_AXI_B_RID;
  wire pcie_bridge_M_AXI_B_RLAST;
  wire pcie_bridge_M_AXI_B_RREADY;
  wire [1:0]pcie_bridge_M_AXI_B_RRESP;
  wire pcie_bridge_M_AXI_B_RVALID;
  wire [511:0]pcie_bridge_M_AXI_B_WDATA;
  wire pcie_bridge_M_AXI_B_WLAST;
  wire pcie_bridge_M_AXI_B_WREADY;
  wire [63:0]pcie_bridge_M_AXI_B_WSTRB;
  wire pcie_bridge_M_AXI_B_WVALID;
  wire pcie_bridge_axi_aclk;
  wire pcie_bridge_axi_aresetn;
  wire [15:0]pcie_bridge_pcie_mgt_rxn;
  wire [15:0]pcie_bridge_pcie_mgt_rxp;
  wire [15:0]pcie_bridge_pcie_mgt_txn;
  wire [15:0]pcie_bridge_pcie_mgt_txp;
  wire [4:0]system_interconnect_M00_AXI_ARADDR;
  wire [2:0]system_interconnect_M00_AXI_ARPROT;
  wire system_interconnect_M00_AXI_ARREADY;
  wire system_interconnect_M00_AXI_ARVALID;
  wire [4:0]system_interconnect_M00_AXI_AWADDR;
  wire [2:0]system_interconnect_M00_AXI_AWPROT;
  wire system_interconnect_M00_AXI_AWREADY;
  wire system_interconnect_M00_AXI_AWVALID;
  wire system_interconnect_M00_AXI_BREADY;
  wire [1:0]system_interconnect_M00_AXI_BRESP;
  wire system_interconnect_M00_AXI_BVALID;
  wire [31:0]system_interconnect_M00_AXI_RDATA;
  wire system_interconnect_M00_AXI_RREADY;
  wire [1:0]system_interconnect_M00_AXI_RRESP;
  wire system_interconnect_M00_AXI_RVALID;
  wire [31:0]system_interconnect_M00_AXI_WDATA;
  wire system_interconnect_M00_AXI_WREADY;
  wire [3:0]system_interconnect_M00_AXI_WSTRB;
  wire system_interconnect_M00_AXI_WVALID;
  wire [31:0]system_interconnect_M01_AXI_ARADDR;
  wire [2:0]system_interconnect_M01_AXI_ARPROT;
  wire system_interconnect_M01_AXI_ARREADY;
  wire system_interconnect_M01_AXI_ARVALID;
  wire [31:0]system_interconnect_M01_AXI_AWADDR;
  wire [2:0]system_interconnect_M01_AXI_AWPROT;
  wire system_interconnect_M01_AXI_AWREADY;
  wire system_interconnect_M01_AXI_AWVALID;
  wire system_interconnect_M01_AXI_BREADY;
  wire [1:0]system_interconnect_M01_AXI_BRESP;
  wire system_interconnect_M01_AXI_BVALID;
  wire [31:0]system_interconnect_M01_AXI_RDATA;
  wire system_interconnect_M01_AXI_RREADY;
  wire [1:0]system_interconnect_M01_AXI_RRESP;
  wire system_interconnect_M01_AXI_RVALID;
  wire [31:0]system_interconnect_M01_AXI_WDATA;
  wire system_interconnect_M01_AXI_WREADY;
  wire [3:0]system_interconnect_M01_AXI_WSTRB;
  wire system_interconnect_M01_AXI_WVALID;
  wire [0:0]util_ds_buf_0_IBUF_DS_ODIV2;
  wire [0:0]util_ds_buf_0_IBUF_OUT;

  assign CLK_IN_D_0_1_CLK_N = pcie_refclk_clk_n[0];
  assign CLK_IN_D_0_1_CLK_P = pcie_refclk_clk_p[0];
  assign active0_1 = active0;
  assign active1_1 = active1;
  assign active2_1 = active2;
  assign active3_1 = active3;
  assign pcie_bridge_pcie_mgt_rxn = pcie_mgt_rxn[15:0];
  assign pcie_bridge_pcie_mgt_rxp = pcie_mgt_rxp[15:0];
  assign pcie_mgt_txn[15:0] = pcie_bridge_pcie_mgt_txn;
  assign pcie_mgt_txp[15:0] = pcie_bridge_pcie_mgt_txp;
  assign resetn_out = axi_config_resetn_out;
  top_level_axi_config_0_0 axi_config
       (.S_AXI_ARADDR(system_interconnect_M01_AXI_ARADDR),
        .S_AXI_ARPROT(system_interconnect_M01_AXI_ARPROT),
        .S_AXI_ARREADY(system_interconnect_M01_AXI_ARREADY),
        .S_AXI_ARVALID(system_interconnect_M01_AXI_ARVALID),
        .S_AXI_AWADDR(system_interconnect_M01_AXI_AWADDR),
        .S_AXI_AWPROT(system_interconnect_M01_AXI_AWPROT),
        .S_AXI_AWREADY(system_interconnect_M01_AXI_AWREADY),
        .S_AXI_AWVALID(system_interconnect_M01_AXI_AWVALID),
        .S_AXI_BREADY(system_interconnect_M01_AXI_BREADY),
        .S_AXI_BRESP(system_interconnect_M01_AXI_BRESP),
        .S_AXI_BVALID(system_interconnect_M01_AXI_BVALID),
        .S_AXI_RDATA(system_interconnect_M01_AXI_RDATA),
        .S_AXI_RREADY(system_interconnect_M01_AXI_RREADY),
        .S_AXI_RRESP(system_interconnect_M01_AXI_RRESP),
        .S_AXI_RVALID(system_interconnect_M01_AXI_RVALID),
        .S_AXI_WDATA(system_interconnect_M01_AXI_WDATA),
        .S_AXI_WREADY(system_interconnect_M01_AXI_WREADY),
        .S_AXI_WSTRB(system_interconnect_M01_AXI_WSTRB),
        .S_AXI_WVALID(system_interconnect_M01_AXI_WVALID),
        .active0(active0_1),
        .active1(active1_1),
        .active2(active2_1),
        .active3(active3_1),
        .clk(pcie_bridge_axi_aclk),
        .resetn(pcie_bridge_axi_aresetn),
        .resetn_out(axi_config_resetn_out));
  top_level_axi_revision_0_0 axi_revision
       (.AXI_ACLK(pcie_bridge_axi_aclk),
        .AXI_ARESETN(pcie_bridge_axi_aresetn),
        .S_AXI_ARADDR(system_interconnect_M00_AXI_ARADDR),
        .S_AXI_ARPROT(system_interconnect_M00_AXI_ARPROT),
        .S_AXI_ARREADY(system_interconnect_M00_AXI_ARREADY),
        .S_AXI_ARVALID(system_interconnect_M00_AXI_ARVALID),
        .S_AXI_AWADDR(system_interconnect_M00_AXI_AWADDR),
        .S_AXI_AWPROT(system_interconnect_M00_AXI_AWPROT),
        .S_AXI_AWREADY(system_interconnect_M00_AXI_AWREADY),
        .S_AXI_AWVALID(system_interconnect_M00_AXI_AWVALID),
        .S_AXI_BREADY(system_interconnect_M00_AXI_BREADY),
        .S_AXI_BRESP(system_interconnect_M00_AXI_BRESP),
        .S_AXI_BVALID(system_interconnect_M00_AXI_BVALID),
        .S_AXI_RDATA(system_interconnect_M00_AXI_RDATA),
        .S_AXI_RREADY(system_interconnect_M00_AXI_RREADY),
        .S_AXI_RRESP(system_interconnect_M00_AXI_RRESP),
        .S_AXI_RVALID(system_interconnect_M00_AXI_RVALID),
        .S_AXI_WDATA(system_interconnect_M00_AXI_WDATA),
        .S_AXI_WREADY(system_interconnect_M00_AXI_WREADY),
        .S_AXI_WSTRB(system_interconnect_M00_AXI_WSTRB),
        .S_AXI_WVALID(system_interconnect_M00_AXI_WVALID));
  top_level_util_ds_buf_0_0 bridge_input_clk
       (.IBUF_DS_N(CLK_IN_D_0_1_CLK_N),
        .IBUF_DS_ODIV2(util_ds_buf_0_IBUF_DS_ODIV2),
        .IBUF_DS_P(CLK_IN_D_0_1_CLK_P),
        .IBUF_OUT(util_ds_buf_0_IBUF_OUT));
  top_level_xlconstant_0_3 one
       (.dout(one_dout));
  top_level_xdma_0_0 pcie_bridge
       (.axi_aclk(pcie_bridge_axi_aclk),
        .axi_aresetn(pcie_bridge_axi_aresetn),
        .m_axib_araddr(pcie_bridge_M_AXI_B_ARADDR),
        .m_axib_arburst(pcie_bridge_M_AXI_B_ARBURST),
        .m_axib_arcache(pcie_bridge_M_AXI_B_ARCACHE),
        .m_axib_arid(pcie_bridge_M_AXI_B_ARID),
        .m_axib_arlen(pcie_bridge_M_AXI_B_ARLEN),
        .m_axib_arlock(pcie_bridge_M_AXI_B_ARLOCK),
        .m_axib_arprot(pcie_bridge_M_AXI_B_ARPROT),
        .m_axib_arready(pcie_bridge_M_AXI_B_ARREADY),
        .m_axib_arsize(pcie_bridge_M_AXI_B_ARSIZE),
        .m_axib_arvalid(pcie_bridge_M_AXI_B_ARVALID),
        .m_axib_awaddr(pcie_bridge_M_AXI_B_AWADDR),
        .m_axib_awburst(pcie_bridge_M_AXI_B_AWBURST),
        .m_axib_awcache(pcie_bridge_M_AXI_B_AWCACHE),
        .m_axib_awid(pcie_bridge_M_AXI_B_AWID),
        .m_axib_awlen(pcie_bridge_M_AXI_B_AWLEN),
        .m_axib_awlock(pcie_bridge_M_AXI_B_AWLOCK),
        .m_axib_awprot(pcie_bridge_M_AXI_B_AWPROT),
        .m_axib_awready(pcie_bridge_M_AXI_B_AWREADY),
        .m_axib_awsize(pcie_bridge_M_AXI_B_AWSIZE),
        .m_axib_awvalid(pcie_bridge_M_AXI_B_AWVALID),
        .m_axib_bid(pcie_bridge_M_AXI_B_BID),
        .m_axib_bready(pcie_bridge_M_AXI_B_BREADY),
        .m_axib_bresp(pcie_bridge_M_AXI_B_BRESP),
        .m_axib_bvalid(pcie_bridge_M_AXI_B_BVALID),
        .m_axib_rdata(pcie_bridge_M_AXI_B_RDATA),
        .m_axib_rid(pcie_bridge_M_AXI_B_RID),
        .m_axib_rlast(pcie_bridge_M_AXI_B_RLAST),
        .m_axib_rready(pcie_bridge_M_AXI_B_RREADY),
        .m_axib_rresp(pcie_bridge_M_AXI_B_RRESP),
        .m_axib_rvalid(pcie_bridge_M_AXI_B_RVALID),
        .m_axib_wdata(pcie_bridge_M_AXI_B_WDATA),
        .m_axib_wlast(pcie_bridge_M_AXI_B_WLAST),
        .m_axib_wready(pcie_bridge_M_AXI_B_WREADY),
        .m_axib_wstrb(pcie_bridge_M_AXI_B_WSTRB),
        .m_axib_wvalid(pcie_bridge_M_AXI_B_WVALID),
        .pci_exp_rxn(pcie_bridge_pcie_mgt_rxn),
        .pci_exp_rxp(pcie_bridge_pcie_mgt_rxp),
        .pci_exp_txn(pcie_bridge_pcie_mgt_txn),
        .pci_exp_txp(pcie_bridge_pcie_mgt_txp),
        .s_axil_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axil_arprot({1'b0,1'b0,1'b0}),
        .s_axil_arvalid(1'b0),
        .s_axil_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axil_awprot({1'b0,1'b0,1'b0}),
        .s_axil_awvalid(1'b0),
        .s_axil_bready(1'b0),
        .s_axil_rready(1'b0),
        .s_axil_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axil_wstrb({1'b1,1'b1,1'b1,1'b1}),
        .s_axil_wvalid(1'b0),
        .sys_clk(util_ds_buf_0_IBUF_DS_ODIV2),
        .sys_clk_gt(util_ds_buf_0_IBUF_OUT),
        .sys_rst_n(one_dout),
        .usr_irq_req(1'b0));
  top_level_smartconnect_0_0 system_interconnect
       (.M00_AXI_araddr(system_interconnect_M00_AXI_ARADDR),
        .M00_AXI_arprot(system_interconnect_M00_AXI_ARPROT),
        .M00_AXI_arready(system_interconnect_M00_AXI_ARREADY),
        .M00_AXI_arvalid(system_interconnect_M00_AXI_ARVALID),
        .M00_AXI_awaddr(system_interconnect_M00_AXI_AWADDR),
        .M00_AXI_awprot(system_interconnect_M00_AXI_AWPROT),
        .M00_AXI_awready(system_interconnect_M00_AXI_AWREADY),
        .M00_AXI_awvalid(system_interconnect_M00_AXI_AWVALID),
        .M00_AXI_bready(system_interconnect_M00_AXI_BREADY),
        .M00_AXI_bresp(system_interconnect_M00_AXI_BRESP),
        .M00_AXI_bvalid(system_interconnect_M00_AXI_BVALID),
        .M00_AXI_rdata(system_interconnect_M00_AXI_RDATA),
        .M00_AXI_rready(system_interconnect_M00_AXI_RREADY),
        .M00_AXI_rresp(system_interconnect_M00_AXI_RRESP),
        .M00_AXI_rvalid(system_interconnect_M00_AXI_RVALID),
        .M00_AXI_wdata(system_interconnect_M00_AXI_WDATA),
        .M00_AXI_wready(system_interconnect_M00_AXI_WREADY),
        .M00_AXI_wstrb(system_interconnect_M00_AXI_WSTRB),
        .M00_AXI_wvalid(system_interconnect_M00_AXI_WVALID),
        .M01_AXI_araddr(system_interconnect_M01_AXI_ARADDR),
        .M01_AXI_arprot(system_interconnect_M01_AXI_ARPROT),
        .M01_AXI_arready(system_interconnect_M01_AXI_ARREADY),
        .M01_AXI_arvalid(system_interconnect_M01_AXI_ARVALID),
        .M01_AXI_awaddr(system_interconnect_M01_AXI_AWADDR),
        .M01_AXI_awprot(system_interconnect_M01_AXI_AWPROT),
        .M01_AXI_awready(system_interconnect_M01_AXI_AWREADY),
        .M01_AXI_awvalid(system_interconnect_M01_AXI_AWVALID),
        .M01_AXI_bready(system_interconnect_M01_AXI_BREADY),
        .M01_AXI_bresp(system_interconnect_M01_AXI_BRESP),
        .M01_AXI_bvalid(system_interconnect_M01_AXI_BVALID),
        .M01_AXI_rdata(system_interconnect_M01_AXI_RDATA),
        .M01_AXI_rready(system_interconnect_M01_AXI_RREADY),
        .M01_AXI_rresp(system_interconnect_M01_AXI_RRESP),
        .M01_AXI_rvalid(system_interconnect_M01_AXI_RVALID),
        .M01_AXI_wdata(system_interconnect_M01_AXI_WDATA),
        .M01_AXI_wready(system_interconnect_M01_AXI_WREADY),
        .M01_AXI_wstrb(system_interconnect_M01_AXI_WSTRB),
        .M01_AXI_wvalid(system_interconnect_M01_AXI_WVALID),
        .S00_AXI_araddr(pcie_bridge_M_AXI_B_ARADDR),
        .S00_AXI_arburst(pcie_bridge_M_AXI_B_ARBURST),
        .S00_AXI_arcache(pcie_bridge_M_AXI_B_ARCACHE),
        .S00_AXI_arid(pcie_bridge_M_AXI_B_ARID),
        .S00_AXI_arlen(pcie_bridge_M_AXI_B_ARLEN),
        .S00_AXI_arlock(pcie_bridge_M_AXI_B_ARLOCK),
        .S00_AXI_arprot(pcie_bridge_M_AXI_B_ARPROT),
        .S00_AXI_arqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_arready(pcie_bridge_M_AXI_B_ARREADY),
        .S00_AXI_arsize(pcie_bridge_M_AXI_B_ARSIZE),
        .S00_AXI_arvalid(pcie_bridge_M_AXI_B_ARVALID),
        .S00_AXI_awaddr(pcie_bridge_M_AXI_B_AWADDR),
        .S00_AXI_awburst(pcie_bridge_M_AXI_B_AWBURST),
        .S00_AXI_awcache(pcie_bridge_M_AXI_B_AWCACHE),
        .S00_AXI_awid(pcie_bridge_M_AXI_B_AWID),
        .S00_AXI_awlen(pcie_bridge_M_AXI_B_AWLEN),
        .S00_AXI_awlock(pcie_bridge_M_AXI_B_AWLOCK),
        .S00_AXI_awprot(pcie_bridge_M_AXI_B_AWPROT),
        .S00_AXI_awqos({1'b0,1'b0,1'b0,1'b0}),
        .S00_AXI_awready(pcie_bridge_M_AXI_B_AWREADY),
        .S00_AXI_awsize(pcie_bridge_M_AXI_B_AWSIZE),
        .S00_AXI_awvalid(pcie_bridge_M_AXI_B_AWVALID),
        .S00_AXI_bid(pcie_bridge_M_AXI_B_BID),
        .S00_AXI_bready(pcie_bridge_M_AXI_B_BREADY),
        .S00_AXI_bresp(pcie_bridge_M_AXI_B_BRESP),
        .S00_AXI_bvalid(pcie_bridge_M_AXI_B_BVALID),
        .S00_AXI_rdata(pcie_bridge_M_AXI_B_RDATA),
        .S00_AXI_rid(pcie_bridge_M_AXI_B_RID),
        .S00_AXI_rlast(pcie_bridge_M_AXI_B_RLAST),
        .S00_AXI_rready(pcie_bridge_M_AXI_B_RREADY),
        .S00_AXI_rresp(pcie_bridge_M_AXI_B_RRESP),
        .S00_AXI_rvalid(pcie_bridge_M_AXI_B_RVALID),
        .S00_AXI_wdata(pcie_bridge_M_AXI_B_WDATA),
        .S00_AXI_wlast(pcie_bridge_M_AXI_B_WLAST),
        .S00_AXI_wready(pcie_bridge_M_AXI_B_WREADY),
        .S00_AXI_wstrb(pcie_bridge_M_AXI_B_WSTRB),
        .S00_AXI_wvalid(pcie_bridge_M_AXI_B_WVALID),
        .aclk(pcie_bridge_axi_aclk),
        .aresetn(pcie_bridge_axi_aresetn));
endmodule

(* CORE_GENERATION_INFO = "top_level,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLibrary=BlockDiagram,x_ipName=top_level,x_ipVersion=1.00.a,x_ipLanguage=VERILOG,numBlks=32,numReposBlks=24,numNonXlnxBlks=0,numHierBlks=8,maxHierDepth=2,numSysgenBlks=0,numHlsBlks=0,numHdlrefBlks=16,numPkgbdBlks=0,bdsource=USER,da_axi4_cnt=3,synth_mode=OOC_per_IP}" *) (* HW_HANDOFF = "top_level.hwdef" *) 
module top_level
   (init_clk,
    led_l,
    pcie_mgt_rxn,
    pcie_mgt_rxp,
    pcie_mgt_txn,
    pcie_mgt_txp,
    pcie_refclk_clk_n,
    pcie_refclk_clk_p,
    qsfp0_clk_clk_n,
    qsfp0_clk_clk_p,
    qsfp0_gt_grx_n,
    qsfp0_gt_grx_p,
    qsfp0_gt_gtx_n,
    qsfp0_gt_gtx_p,
    qsfp1_clk_clk_n,
    qsfp1_clk_clk_p,
    qsfp1_gt_grx_n,
    qsfp1_gt_grx_p,
    qsfp1_gt_gtx_n,
    qsfp1_gt_gtx_p,
    qsfp2_clk_clk_n,
    qsfp2_clk_clk_p,
    qsfp2_gt_grx_n,
    qsfp2_gt_grx_p,
    qsfp2_gt_gtx_n,
    qsfp2_gt_gtx_p,
    qsfp3_clk_clk_n,
    qsfp3_clk_clk_p,
    qsfp3_gt_grx_n,
    qsfp3_gt_grx_p,
    qsfp3_gt_gtx_n,
    qsfp3_gt_gtx_p,
    qsfp_ctl_en,
    qsfp_lp,
    qsfp_rst_l);
  input init_clk;
  output [3:0]led_l;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt rxn" *) input [15:0]pcie_mgt_rxn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt rxp" *) input [15:0]pcie_mgt_rxp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt txn" *) output [15:0]pcie_mgt_txn;
  (* X_INTERFACE_INFO = "xilinx.com:interface:pcie_7x_mgt:1.0 pcie_mgt txp" *) output [15:0]pcie_mgt_txp;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 pcie_refclk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME pcie_refclk, CAN_DEBUG false, FREQ_HZ 100000000" *) input [0:0]pcie_refclk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 pcie_refclk CLK_P" *) input [0:0]pcie_refclk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 qsfp0_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME qsfp0_clk, CAN_DEBUG false, FREQ_HZ 322265625" *) input qsfp0_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 qsfp0_clk CLK_P" *) input qsfp0_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp0_gt GRX_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME qsfp0_gt, CAN_DEBUG false" *) input [3:0]qsfp0_gt_grx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp0_gt GRX_P" *) input [3:0]qsfp0_gt_grx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp0_gt GTX_N" *) output [3:0]qsfp0_gt_gtx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp0_gt GTX_P" *) output [3:0]qsfp0_gt_gtx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 qsfp1_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME qsfp1_clk, CAN_DEBUG false, FREQ_HZ 322265625" *) input qsfp1_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 qsfp1_clk CLK_P" *) input qsfp1_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp1_gt GRX_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME qsfp1_gt, CAN_DEBUG false" *) input [3:0]qsfp1_gt_grx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp1_gt GRX_P" *) input [3:0]qsfp1_gt_grx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp1_gt GTX_N" *) output [3:0]qsfp1_gt_gtx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp1_gt GTX_P" *) output [3:0]qsfp1_gt_gtx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 qsfp2_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME qsfp2_clk, CAN_DEBUG false, FREQ_HZ 322265625" *) input qsfp2_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 qsfp2_clk CLK_P" *) input qsfp2_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp2_gt GRX_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME qsfp2_gt, CAN_DEBUG false" *) input [3:0]qsfp2_gt_grx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp2_gt GRX_P" *) input [3:0]qsfp2_gt_grx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp2_gt GTX_N" *) output [3:0]qsfp2_gt_gtx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp2_gt GTX_P" *) output [3:0]qsfp2_gt_gtx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 qsfp3_clk CLK_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME qsfp3_clk, CAN_DEBUG false, FREQ_HZ 322265625" *) input qsfp3_clk_clk_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:diff_clock:1.0 qsfp3_clk CLK_P" *) input qsfp3_clk_clk_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp3_gt GRX_N" *) (* X_INTERFACE_PARAMETER = "XIL_INTERFACENAME qsfp3_gt, CAN_DEBUG false" *) input [3:0]qsfp3_gt_grx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp3_gt GRX_P" *) input [3:0]qsfp3_gt_grx_p;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp3_gt GTX_N" *) output [3:0]qsfp3_gt_gtx_n;
  (* X_INTERFACE_INFO = "xilinx.com:interface:gt:1.0 qsfp3_gt GTX_P" *) output [3:0]qsfp3_gt_gtx_p;
  output qsfp_ctl_en;
  output [3:0]qsfp_lp;
  output [3:0]qsfp_rst_l;

  wire [0:0]CLK_IN_D_0_1_CLK_N;
  wire [0:0]CLK_IN_D_0_1_CLK_P;
  wire active1_1;
  wire active3_1;
  wire [3:0]cmac_usplus_0_gt_serial_port_GRX_N;
  wire [3:0]cmac_usplus_0_gt_serial_port_GRX_P;
  wire [3:0]cmac_usplus_0_gt_serial_port_GTX_N;
  wire [3:0]cmac_usplus_0_gt_serial_port_GTX_P;
  wire [3:0]eth_1_qsfp_gt_GRX_N;
  wire [3:0]eth_1_qsfp_gt_GRX_P;
  wire [3:0]eth_1_qsfp_gt_GTX_N;
  wire [3:0]eth_1_qsfp_gt_GTX_P;
  wire gt_ref_clk_0_1_CLK_N;
  wire gt_ref_clk_0_1_CLK_P;
  wire gt_ref_clk_0_2_CLK_N;
  wire gt_ref_clk_0_2_CLK_P;
  wire init_clk_0_1;
  wire loopback_active_0;
  wire loopback_active_2;
  wire loopback_aligned;
  wire loopback_aligned1;
  wire loopback_aligned2;
  wire loopback_aligned3;
  wire [3:0]loopback_qsfp_gt_0_GRX_N;
  wire [3:0]loopback_qsfp_gt_0_GRX_P;
  wire [3:0]loopback_qsfp_gt_0_GTX_N;
  wire [3:0]loopback_qsfp_gt_0_GTX_P;
  wire [3:0]loopback_qsfp_gt_1_GRX_N;
  wire [3:0]loopback_qsfp_gt_1_GRX_P;
  wire [3:0]loopback_qsfp_gt_1_GTX_N;
  wire [3:0]loopback_qsfp_gt_1_GTX_P;
  wire [15:0]pcie_bridge_pcie_mgt_rxn;
  wire [15:0]pcie_bridge_pcie_mgt_rxp;
  wire [15:0]pcie_bridge_pcie_mgt_txn;
  wire [15:0]pcie_bridge_pcie_mgt_txp;
  wire pcie_resetn_out;
  wire qsfp_clk_0_1_CLK_N;
  wire qsfp_clk_0_1_CLK_P;
  wire qsfp_clk_1_1_CLK_N;
  wire qsfp_clk_1_1_CLK_P;
  wire qsfp_pins_qsfp_ctl_en;
  wire [3:0]qsfp_pins_qsfp_lp;
  wire [3:0]qsfp_pins_qsfp_rst_l;
  wire [3:0]status_leds_led_green_l;

  assign CLK_IN_D_0_1_CLK_N = pcie_refclk_clk_n[0];
  assign CLK_IN_D_0_1_CLK_P = pcie_refclk_clk_p[0];
  assign cmac_usplus_0_gt_serial_port_GRX_N = qsfp0_gt_grx_n[3:0];
  assign cmac_usplus_0_gt_serial_port_GRX_P = qsfp0_gt_grx_p[3:0];
  assign eth_1_qsfp_gt_GRX_N = qsfp1_gt_grx_n[3:0];
  assign eth_1_qsfp_gt_GRX_P = qsfp1_gt_grx_p[3:0];
  assign gt_ref_clk_0_1_CLK_N = qsfp0_clk_clk_n;
  assign gt_ref_clk_0_1_CLK_P = qsfp0_clk_clk_p;
  assign gt_ref_clk_0_2_CLK_N = qsfp1_clk_clk_n;
  assign gt_ref_clk_0_2_CLK_P = qsfp1_clk_clk_p;
  assign init_clk_0_1 = init_clk;
  assign led_l[3:0] = status_leds_led_green_l;
  assign loopback_qsfp_gt_0_GRX_N = qsfp2_gt_grx_n[3:0];
  assign loopback_qsfp_gt_0_GRX_P = qsfp2_gt_grx_p[3:0];
  assign loopback_qsfp_gt_1_GRX_N = qsfp3_gt_grx_n[3:0];
  assign loopback_qsfp_gt_1_GRX_P = qsfp3_gt_grx_p[3:0];
  assign pcie_bridge_pcie_mgt_rxn = pcie_mgt_rxn[15:0];
  assign pcie_bridge_pcie_mgt_rxp = pcie_mgt_rxp[15:0];
  assign pcie_mgt_txn[15:0] = pcie_bridge_pcie_mgt_txn;
  assign pcie_mgt_txp[15:0] = pcie_bridge_pcie_mgt_txp;
  assign qsfp0_gt_gtx_n[3:0] = cmac_usplus_0_gt_serial_port_GTX_N;
  assign qsfp0_gt_gtx_p[3:0] = cmac_usplus_0_gt_serial_port_GTX_P;
  assign qsfp1_gt_gtx_n[3:0] = eth_1_qsfp_gt_GTX_N;
  assign qsfp1_gt_gtx_p[3:0] = eth_1_qsfp_gt_GTX_P;
  assign qsfp2_gt_gtx_n[3:0] = loopback_qsfp_gt_0_GTX_N;
  assign qsfp2_gt_gtx_p[3:0] = loopback_qsfp_gt_0_GTX_P;
  assign qsfp3_gt_gtx_n[3:0] = loopback_qsfp_gt_1_GTX_N;
  assign qsfp3_gt_gtx_p[3:0] = loopback_qsfp_gt_1_GTX_P;
  assign qsfp_clk_0_1_CLK_N = qsfp2_clk_clk_n;
  assign qsfp_clk_0_1_CLK_P = qsfp2_clk_clk_p;
  assign qsfp_clk_1_1_CLK_N = qsfp3_clk_clk_n;
  assign qsfp_clk_1_1_CLK_P = qsfp3_clk_clk_p;
  assign qsfp_ctl_en = qsfp_pins_qsfp_ctl_en;
  assign qsfp_lp[3:0] = qsfp_pins_qsfp_lp;
  assign qsfp_rst_l[3:0] = qsfp_pins_qsfp_rst_l;
  crossover_imp_1TLAWFG crossover
       (.active_0(loopback_active_0),
        .active_1(active1_1),
        .active_2(loopback_active_2),
        .active_3(active3_1),
        .aligned0(loopback_aligned),
        .aligned1(loopback_aligned1),
        .aligned2(loopback_aligned2),
        .aligned3(loopback_aligned3),
        .init_clk(init_clk_0_1),
        .qsfp0_clk_clk_n(gt_ref_clk_0_1_CLK_N),
        .qsfp0_clk_clk_p(gt_ref_clk_0_1_CLK_P),
        .qsfp0_gt_grx_n(cmac_usplus_0_gt_serial_port_GRX_N),
        .qsfp0_gt_grx_p(cmac_usplus_0_gt_serial_port_GRX_P),
        .qsfp0_gt_gtx_n(cmac_usplus_0_gt_serial_port_GTX_N),
        .qsfp0_gt_gtx_p(cmac_usplus_0_gt_serial_port_GTX_P),
        .qsfp1_clk_clk_n(gt_ref_clk_0_2_CLK_N),
        .qsfp1_clk_clk_p(gt_ref_clk_0_2_CLK_P),
        .qsfp1_gt_grx_n(eth_1_qsfp_gt_GRX_N),
        .qsfp1_gt_grx_p(eth_1_qsfp_gt_GRX_P),
        .qsfp1_gt_gtx_n(eth_1_qsfp_gt_GTX_N),
        .qsfp1_gt_gtx_p(eth_1_qsfp_gt_GTX_P),
        .qsfp2_clk_clk_n(qsfp_clk_0_1_CLK_N),
        .qsfp2_clk_clk_p(qsfp_clk_0_1_CLK_P),
        .qsfp2_gt_grx_n(loopback_qsfp_gt_0_GRX_N),
        .qsfp2_gt_grx_p(loopback_qsfp_gt_0_GRX_P),
        .qsfp2_gt_gtx_n(loopback_qsfp_gt_0_GTX_N),
        .qsfp2_gt_gtx_p(loopback_qsfp_gt_0_GTX_P),
        .qsfp3_clk_clk_n(qsfp_clk_1_1_CLK_N),
        .qsfp3_clk_clk_p(qsfp_clk_1_1_CLK_P),
        .qsfp3_gt_grx_n(loopback_qsfp_gt_1_GRX_N),
        .qsfp3_gt_grx_p(loopback_qsfp_gt_1_GRX_P),
        .qsfp3_gt_gtx_n(loopback_qsfp_gt_1_GTX_N),
        .qsfp3_gt_gtx_p(loopback_qsfp_gt_1_GTX_P),
        .sys_resetn(pcie_resetn_out));
  pcie_imp_P7FEFP pcie
       (.active0(loopback_active_0),
        .active1(active1_1),
        .active2(loopback_active_2),
        .active3(active3_1),
        .pcie_mgt_rxn(pcie_bridge_pcie_mgt_rxn),
        .pcie_mgt_rxp(pcie_bridge_pcie_mgt_rxp),
        .pcie_mgt_txn(pcie_bridge_pcie_mgt_txn),
        .pcie_mgt_txp(pcie_bridge_pcie_mgt_txp),
        .pcie_refclk_clk_n(CLK_IN_D_0_1_CLK_N),
        .pcie_refclk_clk_p(CLK_IN_D_0_1_CLK_P),
        .resetn_out(pcie_resetn_out));
  top_level_qsfp_pins_0_0 qsfp_pins
       (.qsfp_ctl_en(qsfp_pins_qsfp_ctl_en),
        .qsfp_lp(qsfp_pins_qsfp_lp),
        .qsfp_rst_l(qsfp_pins_qsfp_rst_l));
  top_level_status_leds_0_0 status_leds
       (.led_l(status_leds_led_green_l),
        .qsfp0_up(loopback_aligned),
        .qsfp1_up(loopback_aligned1),
        .qsfp2_up(loopback_aligned2),
        .qsfp3_up(loopback_aligned3));
endmodule
