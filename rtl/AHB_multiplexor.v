`timescale 1ns/1ps
module AHB_multiplexor #(
    parameter DATA_WIDTH = 32
)(
    input  wire HCLK,
    input  wire HRESETn,
    input  wire [1:0] HSEL,
    input  wire [DATA_WIDTH-1:0] HRDATA0,
    input  wire HRESP0,
    input  wire HREADYOUT0,
    input  wire [DATA_WIDTH-1:0] HRDATA1,
    input  wire HRESP1,
    input  wire HREADYOUT1,

    output reg [DATA_WIDTH-1:0] HRDATA,
    output reg HRESP,
    output reg HREADYOUT
);

    reg [1:0] HSEL_reg;

    always @(posedge HCLK or negedge HRESETn) begin
        if (!HRESETn) begin
            HSEL_reg <= 2'b00;
        end else begin
            HSEL_reg <= HSEL;
        end
    end

    always @(*) begin
        case (HSEL_reg)
            2'b01: begin
                HRDATA = HRDATA0;
                HRESP  = HRESP0;
                HREADYOUT = HREADYOUT0;
            end
            2'b10: begin
                HRDATA = HRDATA1;
                HRESP  = HRESP1;
                HREADYOUT = HREADYOUT1;
            end
            default: begin
                HRDATA = {DATA_WIDTH{1'b0}};
                HRESP  = 1'b0; // OKAY response
                HREADYOUT = 1'b1;  // Ready
            end
        endcase
    end

endmodule