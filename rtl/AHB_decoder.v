`timescale 1ns/1ps
module AHB_decoder #(
    parameter ADDR_WIDTH = 32,
    parameter SEL_WIDTH  = 2
)(
    input  wire HRESETn,
    input  wire [31:0] HADDR,
    output reg  [SEL_WIDTH-1:0] HSEL
);

always @(*) begin
    if (!HRESETn) begin
        HSEL = {SEL_WIDTH{1'b0}};
    end else begin
        case (HADDR[ADDR_WIDTH-1:ADDR_WIDTH-2])
            2'b00: HSEL = 2'b01; // Select slave 0 for address range 0x00000000 to 0x3FFFFFFF
            2'b01: HSEL = 2'b10; // Select slave 1 for address range 0x40000000 to 0x7FFFFFFF
            default: HSEL = {SEL_WIDTH{1'b0}}; // No slave selected for other address ranges
        endcase
    end
end

endmodule