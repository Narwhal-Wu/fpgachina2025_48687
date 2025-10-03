// =============================================================================
// AHB BRAM controller testbench
// this testbench includes single word/half word/byte write and read test
// continue write and read test(not burst)
// =============================================================================

`timescale 1ns/1ps
module tb_AHB_bram_controller;
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
    wire [DATA_WIDTH-1:0] bram_dina;
    wire  [DATA_WIDTH-1:0] bram_douta;
    wire bram_ena;
    wire [(DATA_WIDTH/8)-1:0] bram_wea;

    reg [2:0] flag;

    // instantiation DUT
    AHB_bram_controller dut (
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
        .bram_dina(bram_dina),
        .bram_douta(bram_douta),
        .bram_ena(bram_ena),
        .bram_wea(bram_wea)
    );


    blk_mem_gen_0 utt (
        .clka(HCLK),
        .ena(bram_ena),
        .wea(bram_wea),
        .addra(bram_addra[ADDR_WIDTH-1:ADDR_LSB]),
        .dina(bram_dina),
        .douta(bram_douta)
    );

    // clk generate
    initial HCLK = 0;
    always #5 HCLK = ~HCLK;

    // drive signal
    initial begin
        // initial
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

//=====single word write test=========================================================================

    // write address 0000_0000
    @(posedge HCLK) begin
    flag    <= 1;
    HSELx   <= 1;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 1;
    HSIZE   <= 3'd2;
    HTRANS  <= 2'b10;
    HREADY  <= 1;
    HWDATA  <= 32'hcafe_babe;
    end 

    // write data 1111_1111
    @(posedge HCLK) begin
    HSELx   <= 0;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'h11111111;
    end

    // read address 0000_0000
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end

    // read data 0000_0000 IDLE
    @(posedge HCLK) begin
    HSELx   <= 0;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end

//==============================================================================

//=====half word write test=========================================================================
    
    // half word write address 0000_0002
    @(posedge HCLK) begin
    flag    <= 2;
    HSELx   <= 1;
    HADDR   <= 32'h0000_0002;
    HWRITE  <= 1;
    HSIZE   <= 3'd1;
    HWDATA  <= 32'hcafe_babe;
    end

    // half word write data 2222_2222
    @(posedge HCLK) begin
    HSELx   <= 0;
    HADDR   <= 32'h0000_0002;
    HWRITE  <= 0;
    HSIZE   <= 3'd1;
    HWDATA  <= 32'h2222_2222;
    end

    // read address 0000_0000
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end

    // read data 0000_0000 half read address 0000_0002
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0002;
    HWRITE  <= 0;
    HSIZE   <= 3'd1;
    HWDATA  <= 32'hcafe_babe;
    end

    // half read data 0000_0002 IDLE
    @(posedge HCLK) begin
    HSELx   <= 0;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end
//==============================================================================

//=====byte write test=========================================================================

    // byte write address 0x0000_0003
    @(posedge HCLK) begin
    flag    <= 3;
    HSELx   <= 1;
    HADDR   <= 32'h0000_0003;
    HWRITE  <= 1;
    HSIZE   <= 3'd0;
    HWDATA  <= 32'hcafe_babe;
    end

    // byte write data=0x33333333 read address 0000_0000
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'h3333_3333;
    end

    // read data 0000_0000 byte read address 0000_0003
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0003;
    HWRITE  <= 0;
    HSIZE   <= 3'd0;
    HWDATA  <= 32'hcafe_babe;
    end

    // read data 0000_0003 IDLE
    @(posedge HCLK) begin
    HSELx   <= 0;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end
//==============================================================================

//=====continue write read test (not burst =========================================================================
    // write address 0x0000_0000 
    @(posedge HCLK) begin
    flag    <= 4;
    HSELx   <= 1;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 1;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end

    // write data 11111111 write address 0000_0004 
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0004;
    HWRITE  <= 1;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'h1111_1111;
    end

    // write data 22222222 write address 0000_0008
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0008;
    HWRITE  <= 1;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'h2222_2222;
    end

    // write data 33333333 IDLE
    @(posedge HCLK) begin
    HSELx   <= 0;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'h3333_3333;
    end

    // read address 0000_0008
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0008;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end

    // read data 0000_0008 read address 00000004
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0004;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end

    // read data 0000_0004 read address 00000000
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end
    
    // read data 0000_0000 IDLE
    @(posedge HCLK) begin
    HSELx   <= 0;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end
//==============================================================================

//=====busy register test=========================================================================
    // write address 0000_0000 
    @(posedge HCLK) begin
    flag    <= 5;
    HSELx   <= 1;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 1;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end

    //write data aaaaaaaa read address 0000_0004  
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0004;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'haaaa_aaaa;
    end

    //read data 0000_0004 read address 0000_0000
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end

    // write address 0x0000_0004
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0004;
    HWRITE  <= 1;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end

    // write data bbbbbbbb read address 0000_0000
    @(posedge HCLK) begin
    HSELx   <= 1;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hbbbb_bbbb;
    end

    //read data 0000_0000 IDLE
    @(posedge HCLK) begin
    HSELx   <= 0;
    HADDR   <= 32'h0000_0000;
    HWRITE  <= 0;
    HSIZE   <= 3'd2;
    HWDATA  <= 32'hcafe_babe;
    end
    

        #20;
        $finish;
    end
endmodule