// =============================================================================
// AHB BRAM controller testbench
// this testbench includes single word/half word/byte write and read test
// continue write and read test(not burst)
// =============================================================================

`timescale 1ns/1ps
module tb_AHB_irom_controller;
    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 32;
    parameter integer ADDR_LSB = (DATA_WIDTH/32) + 1; // 2 for 32 bits


    // DUT signal
    reg HCLK;
    reg HRESETn;
    reg HSELx;
    reg [ADDR_WIDTH-1:0] HADDR;
    reg HWRITE;
    reg [2:0] HSIZE;
    reg [2:0] HBURST;
    reg [3:0] HPROT;
    reg [1:0] HTRANS;
    reg HMASTLOCK;
    reg HREADY;
    reg [DATA_WIDTH-1:0] HWDATA;
    wire HREADYOUT;
    wire HRESP;
    wire [DATA_WIDTH-1:0] HRDATA;

    // BRAM signal
    wire [ADDR_WIDTH-1:0] bram_addra;
    wire  [DATA_WIDTH-1:0] bram_douta;
    wire bram_ena;

    reg [2:0] flag;

    // instantiation DUT
    AHB_irom_controller dut (
        .HCLK(HCLK),
        .HRESETn(HRESETn),
        .HSELx(HSELx),
        .HADDR(HADDR),
        .HWRITE(HWRITE),
        .HSIZE(HSIZE),
        .HBURST(HBURST),
        .HPROT(HPROT),
        .HTRANS(HTRANS),
        .HMASTLOCK(HMASTLOCK),
        .HREADY(HREADY),
        .HWDATA(HWDATA),
        .HREADYOUT(HREADYOUT),
        .HRESP(HRESP),
        .HRDATA(HRDATA),
        .bram_addra(bram_addra),
        .bram_douta(bram_douta),
        .bram_ena(bram_ena)
    );


    blk_mem_gen_1 utt (
        .clka(HCLK),
        .ena(bram_ena),
        .addra(bram_addra[ADDR_WIDTH-1:ADDR_LSB]),
        .douta(bram_douta)
    );

    // clk generate
    initial HCLK = 0;
    always #5 HCLK = ~HCLK;

    initial begin
        HRESETn = 0;
        HSELx = 0;
        HADDR = 0;
        HWRITE = 0;
        HSIZE = 0;
        HBURST = 0;
        HPROT = 0;
        HTRANS = 0;
        HMASTLOCK = 0;
        HREADY = 0;
        HWDATA = 0;
        flag = 0;
        #20;
        HRESETn = 1;
        #10;

        @(posedge HCLK) begin
        flag    <= 1;
        HSELx   <= 1;
        HADDR   <= 32'h0000_0000;
        HWRITE  <= 0;
        HSIZE   <= 3'd2;
        HTRANS  <= 2'b10;
        HREADY  <= 1;
        HWDATA  <= 32'hcafe_babe;
        end

        @(posedge HCLK) begin
        flag    <= 1;
        HSELx   <= 1;
        HADDR   <= 32'h0000_0000;
        HWRITE  <= 0;
        HSIZE   <= 3'd1;
        HTRANS  <= 2'b10;
        HREADY  <= 1;
        HWDATA  <= 32'hcafe_babe;
        end

        @(posedge HCLK) begin
        flag    <= 1;
        HSELx   <= 1;
        HADDR   <= 32'h0000_0002;
        HWRITE  <= 0;
        HSIZE   <= 3'd1;
        HTRANS  <= 2'b10;
        HREADY  <= 1;
        HWDATA  <= 32'hcafe_babe;
        end

        @(posedge HCLK) begin
        flag    <= 1;
        HSELx   <= 1;
        HADDR   <= 32'h0000_0000;
        HWRITE  <= 0;
        HSIZE   <= 3'd0;
        HTRANS  <= 2'b10;
        HREADY  <= 1;
        HWDATA  <= 32'hcafe_babe;
        end

        @(posedge HCLK) begin
        flag    <= 1;
        HSELx   <= 1;
        HADDR   <= 32'h0000_0001;
        HWRITE  <= 0;
        HSIZE   <= 3'd0;
        HTRANS  <= 2'b10;
        HREADY  <= 1;
        HWDATA  <= 32'hcafe_babe;
        end

        @(posedge HCLK) begin
        flag    <= 1;
        HSELx   <= 1;
        HADDR   <= 32'h0000_0004;
        HWRITE  <= 0;
        HSIZE   <= 3'd2;
        HTRANS  <= 2'b10;
        HREADY  <= 1;
        HWDATA  <= 32'hcafe_babe;
        end

        @(posedge HCLK) begin
        flag    <= 1;
        HSELx   <= 1;
        HADDR   <= 32'h0000_0008;
        HWRITE  <= 0;
        HSIZE   <= 3'd1;
        HTRANS  <= 2'b10;
        HREADY  <= 1;
        HWDATA  <= 32'hcafe_babe;
        end

        @(posedge HCLK) begin
        flag    <= 1;
        HSELx   <= 1;
        HADDR   <= 32'h0000_000C;
        HWRITE  <= 0;
        HSIZE   <= 3'd0;
        HTRANS  <= 2'b10;
        HREADY  <= 1;
        HWDATA  <= 32'hcafe_babe;
        end

        @(posedge HCLK) begin
        flag    <= 1;
        HSELx   <= 0;
        HADDR   <= 32'h0000_0000;
        HWRITE  <= 0;
        HSIZE   <= 3'd2;
        HTRANS  <= 2'b10;
        HREADY  <= 1;
        HWDATA  <= 32'hcafe_babe;
        end
        #20;
        $finish;
    end
endmodule