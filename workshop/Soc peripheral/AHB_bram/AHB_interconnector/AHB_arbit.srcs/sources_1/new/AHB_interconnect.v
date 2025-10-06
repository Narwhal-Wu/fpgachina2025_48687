`timescale 1ns / 1ps

module AHB_interconnect #(
    parameter ADDR_WIDTH = 32,
    parameter DATA_WIDTH = 32
)(
    input  wire HCLK,
    input  wire HRESETn,
    input  wire [ADDR_WIDTH -1:0] HADDR,
    input  wire [DATA_WIDTH-1:0] HRDATA0,
    input  wire HRESP0,
    input  wire HREADYOUT0,
    input  wire [DATA_WIDTH-1:0] HRDATA1,
    input  wire HRESP1,
    input  wire HREADYOUT1,

    output wire [DATA_WIDTH-1:0] HRDATA,
    output wire HRESP,
    output wire [1:0] HSEL,
    output wire HREADY
);

AHB_decoder #(
    .ADDR_WIDTH(ADDR_WIDTH)
) u_AHB_decoder (
    .HRESETn(HRESETn),
    .HADDR(HADDR),
    .HSEL(HSEL)
);

AHB_multiplexor #(
    .DATA_WIDTH(DATA_WIDTH)
) u_AHB_multiplexor (
    .HCLK(HCLK), 
    .HRESETn(HRESETn),
    .HSEL(HSEL),
    .HRDATA0(HRDATA0),
    .HRESP0(HRESP0),
    .HREADYOUT0(HREADYOUT0),
    .HRDATA1(HRDATA1),
    .HRESP1(HRESP1),
    .HREADYOUT1(HREADYOUT1),
    .HRDATA(HRDATA),
    .HRESP(HRESP),
    .HREADYOUT(HREADY)
);

endmodule
