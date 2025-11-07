`timescale 1ns/1ps

module tb_AHB_interconnect ();

    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 32;
    localparam ADDR_LSB = (DATA_WIDTH/32) + 1;// 2 for 32 bits

    reg HCLK;
    reg HRESETn;

    reg [ADDR_WIDTH-1:0] HADDR;
    wire [DATA_WIDTH-1:0] HRDATA0;
    wire HRESP0;
    wire HREADYOUT0;
    wire [31:0] HRDATA1;
    wire HRESP1;
    wire HREADYOUT1;
    reg HWRITE;
    reg [2:0] HSIZE;
    reg [2:0] HBURST;
    reg [3:0] HPROT;
    reg [1:0] HTRANS;
    reg HMASTLOCK;
    reg [DATA_WIDTH-1:0] HWDATA;

    wire [DATA_WIDTH-1:0] HRDATA;
    wire HRESP;
    wire [1:0] HSEL;
    wire HREADY;
    wire [ADDR_WIDTH-1:0] bram_addra;
    wire [ADDR_WIDTH-1:0] irom_addra;
    wire [DATA_WIDTH-1:0] bram_douta;
    wire [DATA_WIDTH-1:0] irom_douta;
    wire [3:0] bram_wea;
    wire [DATA_WIDTH-1:0] bram_dina;
    wire irom_ena;
    wire bram_ena;

    AHB_interconnect connector (
        .HCLK(HCLK),
        .HRESETn(HRESETn),
        .HADDR(HADDR),
        .HRDATA0(HRDATA0),
        .HRESP0(HRESP0),
        .HREADYOUT0(HREADYOUT0),
        .HRDATA1(HRDATA1),
        .HRESP1(HRESP1),
        .HREADYOUT1(HREADYOUT1),

        .HRDATA(HRDATA),
        .HRESP(HRESP),
        .HSEL(HSEL),
        .HREADY(HREADY)
    );

     AHB_bram_controller bramc (
        .HCLK(HCLK),
        .HRESETn(HRESETn),
        .HSELx(HSEL[0]),
        .HADDR(HADDR),
        .HWRITE(HWRITE),
        .HSIZE(HSIZE),
        .HBURST(HBURST),
        .HPROT(HPROT),
        .HTRANS(HTRANS),
        .HMASTLOCK(HMASTLOCK),
        .HREADY(HREADY),
        .HWDATA(HWDATA),
        .HREADYOUT(HREADYOUT0),
        .HRESP(HRESP0),
        .HRDATA(HRDATA0),
        .bram_addra(bram_addra),
        .bram_dina(bram_dina),
        .bram_douta(bram_douta),
        .bram_ena(bram_ena),
        .bram_wea(bram_wea)
    );

    AHB_irom_controller iromc (
        .HCLK(HCLK),
        .HRESETn(HRESETn),
        .HSELx(HSEL[1]),
        .HADDR(HADDR),
        .HWRITE(HWRITE),
        .HSIZE(HSIZE),
        .HBURST(HBURST),
        .HPROT(HPROT),
        .HTRANS(HTRANS),
        .HMASTLOCK(HMASTLOCK),
        .HREADY(HREADY),
        .HWDATA(HWDATA),
        .HREADYOUT(HREADYOUT1),
        .HRESP(HRESP1),
        .HRDATA(HRDATA1),
        .bram_addra(irom_addra),
        .bram_douta(irom_douta),
        .bram_ena(irom_ena)
    );

    blk_mem_gen_1 irom (
        .clka(HCLK),
        .ena(irom_ena),
        .addra(irom_addra[ADDR_WIDTH-1:ADDR_LSB]),
        .douta(irom_douta)
    );

    blk_mem_gen_0 bram (
        .clka(HCLK),
        .ena(bram_ena),
        .wea(bram_wea),
        .addra(bram_addra[ADDR_WIDTH-1:ADDR_LSB]),
        .dina(bram_dina),
        .douta(bram_douta)
    );

    // Debug: check HSEL bit-to-instance mapping on every clock
    always @(posedge HCLK) begin
        if (HRESETn) begin
            if (HSEL[0] !== bramc.HSELx) begin
                $error("HSEL[0] != bramc.HSELx at %0t: HSEL=%b bramc.HSELx=%b", $time, HSEL, bramc.HSELx);
            end
            if (HSEL[1] !== iromc.HSELx) begin
                $error("HSEL[1] != iromc.HSELx at %0t: HSEL=%b iromc.HSELx=%b", $time, HSEL, iromc.HSELx);
            end
        end
    end

    always @(posedge HCLK) begin
        $display("%0t: HSEL=%b bramc.HSELx=%b", $time, HSEL, bramc.HSELx);
        $display("%0t: HSEL=%b iromc.HSELx=%b", $time, HSEL, iromc.HSELx);
    end

     initial begin
     HCLK = 0;
     forever #5 HCLK=~HCLK;
     end

    initial begin
        HRESETn = 0;
        HADDR = 0;
        HWRITE = 0;
        HSIZE = 0;
        HBURST = 0;
        HPROT = 0;
        HTRANS = 0;
        HMASTLOCK = 0;
        HWDATA = 0;

        #20;

        HRESETn = 1;

        #10
        
        // Use non-blocking assignments on posedge to avoid races with DUT sequential logic
        @(posedge HCLK) begin
            HADDR  <= 32'h0000_0000; // Access BRAM
            HWRITE <= 1;
            HSIZE  <= 3'b010; // Word size
            HBURST <= 3'b000; // Single transfer
            HTRANS <= 2'b10;  // Non-sequential
            HWDATA <= 32'hcafe_babe;
        end

        @(posedge HCLK) begin
            HADDR  <= 32'h0000_0000; // Access BRAM
            HWRITE <= 0;
            HSIZE  <= 3'b010; // Word size
            HWDATA <= 32'h0123_4567;
        end

        @(posedge HCLK) begin
            HADDR  <= 32'h0000_000C;
            HWRITE <= 1;
            HSIZE  <= 3'd1;
            HWDATA <= 32'hcafe_babe;
        end

        @(posedge HCLK) begin
            HADDR  <= 32'h0000_0008;
            HWRITE <= 1;
            HSIZE  <= 3'd0;
            HWDATA <= 32'h89ab_cdef;
        end


        @(posedge HCLK) begin
            HADDR  <= 32'h0000_000C;
            HWRITE <= 0;
            HSIZE  <= 3'd2;
            HWDATA <= 32'hfedc_ba98;
        end

        @(posedge HCLK) begin
            HADDR  <= 32'h0000_0008;
            HWRITE <= 0;
            HSIZE  <= 3'd2;
            HWDATA <= 32'hcafe_babe;
        end

        @(posedge HCLK) begin
            HADDR  <= 32'h0000_0000;
            HWRITE <= 0;
            HSIZE  <= 3'd1;
            HWDATA <= 32'hcafe_babe;
        end

        @(posedge HCLK) begin
            HADDR  <= 32'h0000_0000;
            HWRITE <= 0;
            HSIZE  <= 3'd0;
            HWDATA <= 32'hcafe_babe;
        end



        @(posedge HCLK) begin
            HADDR  <= 32'h4000_0000; // Access IROM
            HWRITE <= 0;
            HSIZE  <= 3'd2; // Word size
        end

        @(posedge HCLK) begin
            HADDR  <= 32'h4000_0000; // Access IROM
            HWRITE <= 0;
            HSIZE  <= 3'd1; // Word size
        end

        @(posedge HCLK) begin
            HADDR  <= 32'h4000_0004; // Access IROM
            HWRITE <= 0;
            HSIZE  <= 3'd0; // Word size
        end

        @(posedge HCLK) begin
            HADDR  <= 32'h4000_0008; // Access IROM
            HWRITE <= 0;
            HSIZE  <= 3'd2; // Word size
        end

        @(posedge HCLK) begin
            HADDR  <= 32'h4000_000C; // Access IROM
            HWRITE <= 0;
            HSIZE  <= 3'd2; // Word size
        end

        @(posedge HCLK) begin
            HADDR  <= 32'h0000_0000; // Access IROM
            HWRITE <= 0;
            HTRANS <= 2'b00;
            HSIZE  <= 3'd2; // Word size
        end


        #50;
        #50;
        $finish;
    end

endmodule