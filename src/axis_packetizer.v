//=============================================================================
//                ------->  Revision History  <------
//=============================================================================
//
//   Date     Who   Ver  Changes
//=============================================================================
// 20-Jul24  DWW     1  Initial creation
//=============================================================================

/*

   This module contains two FIFO in sequence.

   The first FIFO is small and converts the input stream from the s_axis_aclk
   domain to the m_axis_aclk domain.

   The second FIFO is a large "packet-mode" FIFO to ensure that an entire packet
   is present in the FIFO before it assert the "TVALID" signal

*/

module axis_packetizer # (parameter DW=512, FIFO_DEPTH=1024)
(

    (* X_INTERFACE_INFO      = "xilinx.com:signal:clock:1.0 s_axis_aclk CLK"                  *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_RESET s_axis_aresetn, ASSOCIATED_INTERFACE s_axis" *)
    input s_axis_aclk,

    (* X_INTERFACE_INFO      = "xilinx.com:signal:reset:1.0 s_axis_aresetn RST" *)
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW "                           *)
    input s_axis_aresetn,

    (* X_INTERFACE_INFO      = "xilinx.com:signal:clock:1.0 m_axis_aclk CLK"                  *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_RESET m_axis_aresetn, ASSOCIATED_INTERFACE m_axis" *)
    input m_axis_aclk,

    (* X_INTERFACE_INFO      = "xilinx.com:signal:reset:1.0 m_axis_aresetn RST" *)
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW "                           *)
    input m_axis_aresetn,


    // The input stream
    input[DW-1:0]    s_axis_tdata,
    input[DW/8-1:0]  s_axis_tkeep,
    input            s_axis_tlast,
    input            s_axis_tvalid,
    output           s_axis_tready,

    // The output stream
    output[DW-1:0]   m_axis_tdata,
    output[DW/8-1:0] m_axis_tkeep,
    output           m_axis_tlast,
    output           m_axis_tvalid,
    input            m_axis_tready
);

// These wires connect the two FIFOs
wire[DW-1:0]   wire_tdata;
wire[DW/8-1:0] wire_tkeep;
wire           wire_tlast;
wire           wire_tvalid;
wire           wire_tready;


//=============================================================================
// This is the clock-conversion FIFO
//=============================================================================
xpm_fifo_axis #
(
   .FIFO_DEPTH      (16),
   .TDATA_WIDTH     (DW),
   .FIFO_MEMORY_TYPE("auto"),
   .PACKET_FIFO     ("false"),
   .USE_ADV_FEATURES("0000"),
   .CDC_SYNC_STAGES (2),
   .CLOCKING_MODE   ("independent_clock")
)
clock_conversion_fifo
(
    // Clock and reset
   .s_aclk   (s_axis_aclk   ),
   .m_aclk   (m_axis_aclk   ),
   .s_aresetn(s_axis_aresetn),

    // The input bus to the FIFO comes straight from the input stream
   .s_axis_tdata (s_axis_tdata ),
   .s_axis_tkeep (s_axis_tkeep ),
   .s_axis_tlast (s_axis_tlast ),
   .s_axis_tvalid(s_axis_tvalid),
   .s_axis_tready(s_axis_tready),

    // The output bus of the FIFO
   .m_axis_tdata (wire_tdata ),
   .m_axis_tkeep (wire_tkeep ),
   .m_axis_tlast (wire_tlast ),
   .m_axis_tvalid(wire_tvalid),
   .m_axis_tready(wire_tready),

    // Unused input stream signals
   .s_axis_tdest(),
   .s_axis_tid  (),
   .s_axis_tstrb(),
   .s_axis_tuser(),

    // Unused output stream signals
   .m_axis_tdest(),
   .m_axis_tid  (),
   .m_axis_tstrb(),
   .m_axis_tuser(),

    // Other unused signals
   .almost_empty_axis(),
   .almost_full_axis(),
   .dbiterr_axis(),
   .prog_empty_axis(),
   .prog_full_axis(),
   .rd_data_count_axis(),
   .sbiterr_axis(),
   .wr_data_count_axis(),
   .injectdbiterr_axis(),
   .injectsbiterr_axis()
);
//=============================================================================



//=============================================================================
// This is the packetizing FIFO
//=============================================================================
xpm_fifo_axis #
(
   .FIFO_DEPTH      (FIFO_DEPTH),
   .TDATA_WIDTH     (DW),
   .FIFO_MEMORY_TYPE("auto"),
   .PACKET_FIFO     ("true"),
   .USE_ADV_FEATURES("0000"),
   .CDC_SYNC_STAGES (2),
   .CLOCKING_MODE   ("common_clock")
)
packetizing_fifo
(
    // Clock and reset
   .s_aclk   (m_axis_aclk   ),
   .m_aclk   (m_axis_aclk   ),
   .s_aresetn(m_axis_aresetn),

    // The input bus of the FIFO
   .s_axis_tdata (wire_tdata ),
   .s_axis_tkeep (wire_tkeep ),
   .s_axis_tlast (wire_tlast ),
   .s_axis_tvalid(wire_tvalid),
   .s_axis_tready(wire_tready),

    // The output bus of the FIFO goes straight to the output stream
   .m_axis_tdata (m_axis_tdata ),
   .m_axis_tkeep (m_axis_tkeep ),
   .m_axis_tlast (m_axis_tlast ),
   .m_axis_tvalid(m_axis_tvalid),
   .m_axis_tready(m_axis_tready),


    // Unused input stream signals
   .s_axis_tdest(),
   .s_axis_tid  (),
   .s_axis_tstrb(),
   .s_axis_tuser(),

    // Unused output stream signals
   .m_axis_tdest(),
   .m_axis_tid  (),
   .m_axis_tstrb(),
   .m_axis_tuser(),

    // Other unused signals
   .almost_empty_axis(),
   .almost_full_axis(),
   .dbiterr_axis(),
   .prog_empty_axis(),
   .prog_full_axis(),
   .rd_data_count_axis(),
   .sbiterr_axis(),
   .wr_data_count_axis(),
   .injectdbiterr_axis(),
   .injectsbiterr_axis()
);
//=============================================================================






endmodule
