`timescale 1ns / 1ps
// Simple AHB-Lite Timer (64-bit free-running counter)
// Map (byte offsets from base):
//   0x00 CNT_LO  [31:0]   (RO)
//   0x04 CNT_HI  [63:32]  (RO)
//   0x08 CTRL             (WO) bit0=1 to reset counter
//   0x0C ID    = 0x54494D52 ('TIMR') (RO)
// Address decode expects this as Slave-1 at 0x4000_0000 .. 0x7FFF_FFFF via AHB_decoder

module AHB_timer (
    input  wire        HCLK,
    input  wire        HRESETn,

    // AHB-Lite Slave Interface
    input  wire        HSELx,
    input  wire [31:0] HADDR,
    input  wire        HWRITE,
    input  wire [2:0]  HSIZE,
    input  wire [2:0]  HBURST,
    input  wire [3:0]  HPROT,
    input  wire [1:0]  HTRANS,
    input  wire        HMASTLOCK,
    input  wire        HREADY,
    input  wire [31:0] HWDATA,

    output reg  [31:0] HRDATA,
    output wire        HREADYOUT,
    output wire        HRESP
);

    // AHB-Lite simple ready/resp: always ready & OKAY
    assign HREADYOUT = 1'b1;
    assign HRESP     = 1'b0; // OKAY

    // Counter
    reg [63:0] counter;

    // AHB transfer qualify
    wire trans_valid = HSELx & HREADY & HTRANS[1]; // NONSEQ or SEQ when [1]==1

    // Write strobe
    wire do_write = trans_valid & HWRITE;
    wire do_read  = trans_valid & ~HWRITE;

    // Byte address -> word offset
    wire [5:2] word_off = HADDR[5:2];

    // Counter increment
    always @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            counter <= 64'd0;
        end else begin
            counter <= counter + 64'd1;

            // CTRL write: bit0=1 -> reset counter
            if (do_write && word_off == 4'h2) begin // 0x08
                if (HWDATA[0]) begin
                    counter <= 64'd0;
                end
            end
        end
    end

    // Read mux
    always @(*) begin
        case (word_off)
            4'h0: HRDATA = counter[31:0];         // CNT_LO (0x00)
            4'h1: HRDATA = counter[63:32];        // CNT_HI (0x04)
            4'h2: HRDATA = 32'h0000_0000;         // CTRL (WO)
            4'h3: HRDATA = 32'h5449_4D52;         // ID 'TIMR' (0x0C)
            default: HRDATA = 32'h0000_0000;
        endcase
    end

endmodule
