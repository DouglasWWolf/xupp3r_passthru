//====================================================================================
//                        ------->  Revision History  <------
//====================================================================================
//
//   Date     Who   Ver  Changes
//====================================================================================
// 08-Jun-24  DWW     1  Initial creation
//====================================================================================

/*
    
    Provides basic register access to the surrounding design

*/


module axi_config #
(
    parameter CLK_HZ              = 250000000,
    parameter[4:0] DEFAULT_TXPRE  = 5'h00,
    parameter[4:0] DEFAULT_TXPOST = 5'h00,
    parameter[4:0] DEFAULT_TXDIFF = 5'h18
)
(
    (* X_INTERFACE_INFO      = "xilinx.com:signal:clock:1.0 clk CLK"    *)
    (* X_INTERFACE_PARAMETER = "ASSOCIATED_RESET resetn:resetn_out" *)
    input clk,
    input resetn,

    input active0, active1, active2, active3,

    // This feeds the CMACs
    output reg       RSFEC_ENABLE,

    // Waveform shaping for the CMAC transceivers
    output reg[4:0]  CMAC_TXPRE, CMAC_TXPOST, CMAC_TXDIFF,

    // This drives "resetn" for most of the rest of the system
    (* X_INTERFACE_INFO      = "xilinx.com:signal:reset:1.0 resetn_out RST" *)
    (* X_INTERFACE_PARAMETER = "POLARITY ACTIVE_LOW"                            *)
    output reg resetn_out,


    //================== This is an AXI4-Lite slave interface ==================
        
    // "Specify write address"              -- Master --    -- Slave --
    input[31:0]                             S_AXI_AWADDR,   
    input                                   S_AXI_AWVALID,  
    output                                                  S_AXI_AWREADY,
    input[2:0]                              S_AXI_AWPROT,

    // "Write Data"                         -- Master --    -- Slave --
    input[31:0]                             S_AXI_WDATA,      
    input                                   S_AXI_WVALID,
    input[3:0]                              S_AXI_WSTRB,
    output                                                  S_AXI_WREADY,

    // "Send Write Response"                -- Master --    -- Slave --
    output[1:0]                                             S_AXI_BRESP,
    output                                                  S_AXI_BVALID,
    input                                   S_AXI_BREADY,

    // "Specify read address"               -- Master --    -- Slave --
    input[31:0]                             S_AXI_ARADDR,     
    input                                   S_AXI_ARVALID,
    input[2:0]                              S_AXI_ARPROT,     
    output                                                  S_AXI_ARREADY,

    // "Read data back to master"           -- Master --    -- Slave --
    output[31:0]                                            S_AXI_RDATA,
    output                                                  S_AXI_RVALID,
    output[1:0]                                             S_AXI_RRESP,
    input                                   S_AXI_RREADY
    //==========================================================================
);  


//=========================  AXI Register Map  =============================
localparam REG_RESET  = 0;
localparam REG_RSFEC  = 1;
localparam REG_TXPRE  = 2;
localparam REG_TXPOST = 3;
localparam REG_TXDIFF = 4;
//==========================================================================


//==========================================================================
// We'll communicate with the AXI4-Lite Slave core with these signals.
//==========================================================================
// AXI Slave Handler Interface for write requests
wire[31:0]  ashi_windx;     // Input   Write register-index
wire[31:0]  ashi_waddr;     // Input:  Write-address
wire[31:0]  ashi_wdata;     // Input:  Write-data
wire        ashi_write;     // Input:  1 = Handle a write request
reg[1:0]    ashi_wresp;     // Output: Write-response (OKAY, DECERR, SLVERR)
wire        ashi_widle;     // Output: 1 = Write state machine is idle

// AXI Slave Handler Interface for read requests
wire[31:0]  ashi_rindx;     // Input   Read register-index
wire[31:0]  ashi_raddr;     // Input:  Read-address
wire        ashi_read;      // Input:  1 = Handle a read request
reg[31:0]   ashi_rdata;     // Output: Read data
reg[1:0]    ashi_rresp;     // Output: Read-response (OKAY, DECERR, SLVERR);
wire        ashi_ridle;     // Output: 1 = Read state machine is idle
//==========================================================================

// The state of the state-machines that handle AXI4-Lite read and AXI4-Lite write
reg ashi_write_state, ashi_read_state;

// The AXI4 slave state machines are idle when in state 0 and their "start" signals are low
assign ashi_widle = (ashi_write == 0) && (ashi_write_state == 0);
assign ashi_ridle = (ashi_read  == 0) && (ashi_read_state  == 0);
   
// These are the valid values for ashi_rresp and ashi_wresp
localparam OKAY   = 0;
localparam SLVERR = 2;
localparam DECERR = 3;

// An AXI slave is gauranteed a minimum of 128 bytes of address space
// (128 bytes is 32 32-bit registers)
localparam ADDR_MASK = 7'h7F;

// A reset sequence on resetn_out is initiated when this strobes high
reg[1:0] perform_reset;

// These are the "active0","active1", "active2", and "active3" inputs, synchronized to "clk"
wire[3:0] active;

// Synchronize "active0" and "active1" into "active[1:0]"
cdc_single i_sync_act0(active0, clk, active[0]);
cdc_single i_sync_act1(active1, clk, active[1]);
cdc_single i_sync_act2(active2, clk, active[2]);
cdc_single i_sync_act3(active3, clk, active[3]);


//==========================================================================
// This state machine handles AXI4-Lite write requests
//
// Drives:
//==========================================================================
always @(posedge clk) begin

    // This strobes high for exactly 1 cycle at a time
    perform_reset[0] <= 0;

    // If we're in reset, initialize important registers
    if (resetn == 0) begin
        ashi_write_state  <= 0;
        RSFEC_ENABLE      <= 1;
        CMAC_TXPRE        <= DEFAULT_TXPRE;
        CMAC_TXPOST       <= DEFAULT_TXPOST;
        CMAC_TXDIFF       <= DEFAULT_TXDIFF;

    // If we're not in reset, and a write-request has occured...        
    end else case (ashi_write_state)
        
        0:  if (ashi_write) begin
       
                // Assume for the moment that the result will be OKAY
                ashi_wresp <= OKAY;              
            
                // Do the right thing depending on the register index
                case (ashi_windx)
               
                    REG_RSFEC:  RSFEC_ENABLE <= ashi_wdata;
                    REG_TXPRE:  CMAC_TXPRE   <= ashi_wdata;
                    REG_TXPOST: CMAC_TXPOST  <= ashi_wdata;
                    REG_TXDIFF: CMAC_TXDIFF  <= ashi_wdata;

                    REG_RESET:  perform_reset[0] <= 1;

                    // Writes to any other register are a decode-error
                    default: ashi_wresp <= DECERR;
                endcase
            end

        // Dummy state, doesn't do anything
        1: ashi_write_state <= 0;

    endcase
end
//==========================================================================




//==========================================================================
// World's simplest state machine for handling AXI4-Lite read requests
//==========================================================================
always @(posedge clk) begin
    // If we're in reset, initialize important registers
    if (resetn == 0) begin
        ashi_read_state <= 0;
    
    // If we're not in reset, and a read-request has occured...        
    end else if (ashi_read) begin
   
        // Assume for the moment that the result will be OKAY
        ashi_rresp <= OKAY;              
        
        // Do the right thing depending on the register index
        case (ashi_rindx)
            
            // Allow a read from any valid register                
            REG_RESET:  ashi_rdata <= (resetn_out == 0);
            REG_RSFEC:  ashi_rdata <= RSFEC_ENABLE;
            REG_TXPRE:  ashi_rdata <= CMAC_TXPRE;
            REG_TXPOST: ashi_rdata <= CMAC_TXPOST;
            REG_TXDIFF: ashi_rdata <= CMAC_TXDIFF;

            // Reads of any other register are a decode-error
            default: ashi_rresp <= DECERR;
        endcase
    end
end
//==========================================================================



//==========================================================================
// This block initiates a reset sequence on "resetn_out" when it detects
// that activity on the RX streams has ceased
//==========================================================================
reg asm_state;
always @(posedge clk) begin
    
    // This only ever strobes high for 1 clock-cycle
    perform_reset[1] <= 0;

    // If we're in reset...    
    if (resetn == 0) begin
        asm_state <= 0;
    end

    // Otherwise, we're not in reset, run the state machine
    else case(asm_state)

        // Wait for activity on the CMAC RX lines
        0:  if (active) asm_state <= 1;

        // Wait for activity on the CMAC RX lines to cease
        1:  if (active == 0) begin
                perform_reset[1] <= 1;
                asm_state        <= 0;
            end

    endcase

end
//==========================================================================



//==========================================================================
// This state machine manages "resetn_out".   Whenever "perform_reset" is
// strobed high, the "resetn_out" signal will be asserted for "RESET_USECS" 
// microseconds
//==========================================================================
reg[31:0] reset_timer;
reg[ 1:0] rsm_state;
localparam RESETN_OUT_ACTIVE   = 0;
localparam RESETN_OUT_INACTIVE = 1;
localparam RESET_USECS         = 100;
//--------------------------------------------------------------------------
always @(posedge clk) begin
    
    // This timer continuously counts down
    if (reset_timer) reset_timer <= reset_timer - 1;
    
    // Are we being held in reset?
    if (resetn == 0) begin
        rsm_state  <= 0;
        resetn_out <= RESETN_OUT_ACTIVE;
    end 

    // We're not in reset, run the state machine
    else case(rsm_state)
        0:  begin
                resetn_out  <= RESETN_OUT_ACTIVE;
                reset_timer <= (CLK_HZ / 1000000) * RESET_USECS;
                rsm_state   <= 1;
            end
        1:  if (reset_timer == 0) begin
                resetn_out <= RESETN_OUT_INACTIVE;
                rsm_state  <= 2;
            end
        2:  if (perform_reset) begin
                resetn_out  <= RESETN_OUT_ACTIVE;
                reset_timer <= (CLK_HZ / 1000000) * RESET_USECS;
                rsm_state   <= 1;
            end 
    endcase
end
//==========================================================================



//==========================================================================
// This connects us to an AXI4-Lite slave core
//==========================================================================
axi4_lite_slave#(ADDR_MASK) axil_slave
(
    .clk            (clk),
    .resetn         (resetn),
    
    // AXI AW channel
    .AXI_AWADDR     (S_AXI_AWADDR),
    .AXI_AWVALID    (S_AXI_AWVALID),   
    .AXI_AWREADY    (S_AXI_AWREADY),
    
    // AXI W channel
    .AXI_WDATA      (S_AXI_WDATA),
    .AXI_WVALID     (S_AXI_WVALID),
    .AXI_WSTRB      (S_AXI_WSTRB),
    .AXI_WREADY     (S_AXI_WREADY),

    // AXI B channel
    .AXI_BRESP      (S_AXI_BRESP),
    .AXI_BVALID     (S_AXI_BVALID),
    .AXI_BREADY     (S_AXI_BREADY),

    // AXI AR channel
    .AXI_ARADDR     (S_AXI_ARADDR), 
    .AXI_ARVALID    (S_AXI_ARVALID),
    .AXI_ARREADY    (S_AXI_ARREADY),

    // AXI R channel
    .AXI_RDATA      (S_AXI_RDATA),
    .AXI_RVALID     (S_AXI_RVALID),
    .AXI_RRESP      (S_AXI_RRESP),
    .AXI_RREADY     (S_AXI_RREADY),

    // ASHI write-request registers
    .ASHI_WADDR     (ashi_waddr),
    .ASHI_WINDX     (ashi_windx),
    .ASHI_WDATA     (ashi_wdata),
    .ASHI_WRITE     (ashi_write),
    .ASHI_WRESP     (ashi_wresp),
    .ASHI_WIDLE     (ashi_widle),

    // ASHI read registers
    .ASHI_RADDR     (ashi_raddr),
    .ASHI_RINDX     (ashi_rindx),
    .ASHI_RDATA     (ashi_rdata),
    .ASHI_READ      (ashi_read ),
    .ASHI_RRESP     (ashi_rresp),
    .ASHI_RIDLE     (ashi_ridle)
);
//==========================================================================



endmodule
