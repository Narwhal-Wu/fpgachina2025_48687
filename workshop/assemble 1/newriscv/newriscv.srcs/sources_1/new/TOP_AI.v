`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/14 15:49:26
// Design Name: 
// Module Name: TOP
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

module TOP_AI(

    input  wire        CLK100MHZ,      
    input  wire        CPU_RESETN,
    
    // 按键输入
    input  wire        BTNC,      // 中间按键
    input  wire        BTNU,      // 上按�??
    input  wire        BTND,      // 下按�??
    input  wire        BTNL,      // 左按�??
    input  wire        BTNR,      // 右按�??
    
    // LED输出
    output wire [15:0] LED,
    
    // RGB LED输出
    output wire        LED16_R,
    output wire        LED16_G,
    output wire        LED16_B,
    output wire        LED17_R,
    output wire        LED17_G,
    output wire        LED17_B,

    // 7-segment display
    output [7:0] anode,         // anodes for 7-segment
    output [6:0] cathode,       // cathodes for 7-segment
    output dp,                  // dot point for 7-segment

    // UART接口
    input  wire        UART_RX, // UART接收引脚
    output wire        UART_TX  // UART发�?�引�??
    );
    
    parameter ADDR_WIDTH = 32;
    parameter DATA_WIDTH = 32;
    localparam integer ADDR_LSB = (DATA_WIDTH/32) + 1; // 2 for 32 bits
    
    wire        pll_reset;
    wire        pll_locked;
    wire        clk_cpu;
    
    // 按键去抖信号
    wire btnc_press, btnc_state;
    wire btnu_press, btnu_state;
    wire btnd_press, btnd_state;
    wire btnl_press, btnl_state;
    wire btnr_press, btnr_state;
    
    // LED寄存�??
    reg  [15:0] led_reg;
    reg  [5:0]  rgb_reg; // [LED17_R, LED17_G, LED17_B, LED16_R, LED16_G, LED16_B]
    
    assign pll_reset = ~CPU_RESETN;

    // ================================
    // myCPU 实例�??
    // ================================

    // AHB指令接口信号
    wire [31:0] HADDR_I;
    wire [31:0] HRDATA_I;
    wire        HWRITE_I;
    wire [2:0]  HSIZE_I;
    wire [2:0]  HBURST_I;
    wire [1:0]  HTRANS_I;
    wire        HMASTLOCK_I;
    wire [31:0] HWDATA_I;
    wire [3:0]  HPROT_I;
    wire        HREADY_I;
    wire        HRESP_I;

    // AHB数据接口信号
    wire [31:0] HADDR_D;
    wire [31:0] HRDATA_D;
    wire        HWRITE_D;
    wire [2:0]  HSIZE_D;
    wire [2:0]  HBURST_D;
    wire [1:0]  HTRANS_D;
    wire        HMASTLOCK_D;
    wire [31:0] HWDATA_D;
    wire [3:0]  HPROT_D;
    wire        HREADY_D;
    wire        HRESP_D;

    // Wire to read x31 register for test result display
    wire [31:0] test_result;
    
    myCPU cpu_inst (
        .HCLK(clk_cpu),                // 时钟信号
        .HRESETn(pll_locked),          // 复位信号（低有效�??

        // AHB指令接口
        .HRDATA_I(HRDATA_I),
        .HREADY_I(1),
        .HRESP_I(HRESP_I),
        .HADDR_I(HADDR_I),
        .HWRITE_I(HWRITE_I),
        .HSIZE_I(HSIZE_I),
        .HBURST_I(HBURST_I),
        .HTRANS_I(HTRANS_I),
        .HMASTLOCK_I(HMASTLOCK_I),
        .HWDATA_I(HWDATA_I),
        .HPROT_I(HPROT_I),

        // AHB数据接口
        .HRDATA_D(HRDATA_D),
        .HREADY_D(1),
        .HRESP_D(HRESP_D),
        .HADDR_D(HADDR_D),
        .HWDATA_D(HWDATA_D),
        .HWRITE_D(HWRITE_D),
        .HSIZE_D(HSIZE_D),
        .HBURST_D(HBURST_D),
        .HTRANS_D(HTRANS_D),
        .HMASTLOCK_D(HMASTLOCK_D),
        .HPROT_D(HPROT_D)
    );
    
    // Read x31 register (test result) for 7-segment display
    assign test_result = cpu_inst.REGS[31];

    // PLL实例�??
    clk_wiz_0 clk_pll (
        .clk_out1(clk_cpu),
        .reset(pll_reset),
        .locked(pll_locked),
        .clk_in1(CLK100MHZ)
    );

    // 中间按键去抖
    key_debounce debounce_btnc (
        .clk(clk_cpu),
        .rst_n(pll_locked),
        .key_i(BTNC),
        .key_press(btnc_press),
        .key_state(btnc_state)
    );

    // 上按键去�??
    key_debounce debounce_btnu (
        .clk(clk_cpu),
        .rst_n(pll_locked),
        .key_i(BTNU),
        .key_press(btnu_press),
        .key_state(btnu_state)
    );

    // 下按键去�??
    key_debounce debounce_btnd (
        .clk(clk_cpu),
        .rst_n(pll_locked),
        .key_i(BTND),
        .key_press(btnd_press),
        .key_state(btnd_state)
    );

    // 左按键去�??
    key_debounce debounce_btnl (
        .clk(clk_cpu),
        .rst_n(pll_locked),
        .key_i(BTNL),
        .key_press(btnl_press),
        .key_state(btnl_state)
    );

    // 右按键去�??
    key_debounce debounce_btnr (
        .clk(clk_cpu),
        .rst_n(pll_locked),
        .key_i(BTNR),
        .key_press(btnr_press),
        .key_state(btnr_state)
    );

    // LED控制逻辑
    always @(posedge clk_cpu or negedge pll_locked) begin
        if (!pll_locked) begin
            led_reg <= 16'h0000;
            rgb_reg <= 6'b000000;
        end else begin
            // 中间按键切换LED
            if (btnc_press) begin
                led_reg <= ~led_reg;
            end
            
            // 上按键LED加法
            if (btnu_press) begin
                led_reg <= led_reg + 1;
            end
            
            // 下按键LED减法
            if (btnd_press) begin
                led_reg <= led_reg - 1;
            end
            
            // 左按键左�??
            if (btnl_press) begin
                led_reg <= {led_reg[14:0], 1'b0};
            end
            
            // 右按键右�??
            if (btnr_press) begin
                led_reg <= {1'b0, led_reg[15:1]};
            end
            
            // 按键状�?�控制RGB LED显示
            if (btnu_state) begin
                rgb_reg <= 6'b111000; // LED17全亮，LED16全灭
            end else if (btnd_state) begin
                rgb_reg <= 6'b000111; // LED16全亮，LED17全灭
            end else begin
                rgb_reg <= 6'b000000; // 默认全灭
            end
        end
    end

    // LED输出
    assign LED = led_reg;
    assign {LED17_R, LED17_G, LED17_B} = rgb_reg[5:3];
    assign {LED16_R, LED16_G, LED16_B} = rgb_reg[2:0];

    // 7-segment display module instantiation
    // Display test_result (x31 register) for RV32I instruction tests
    Seven_Seg seven_seg_inst (
        .clk(clk_cpu),
        .reset(~pll_locked), // 使用PLL锁定信号作为复位
        .data(test_result),  // 显示x31寄存器的值（测试结果�?
        .anode(anode),
        .cathode(cathode),
        .dp(dp)
    );

    // UART模块实例�??
    wire [7:0] uart_rx_data;
    wire uart_rx_ready;
    reg [7:0] uart_tx_data;
    reg uart_tx_start;
    wire uart_tx_busy;

    UART #(
        .CLK_FREQ(100_000_000),  // 时钟频率
        .BAUD_RATE(9600)         // 波特�??
    ) uart_inst (
        .clk(clk_cpu),
        .reset(~pll_locked),
        .rx(UART_RX),
        .tx(UART_TX),
        .tx_data(uart_tx_data),
        .tx_start(uart_tx_start),
        .tx_busy(uart_tx_busy),
        .rx_data(uart_rx_data),
        .rx_ready(uart_rx_ready)
    );

    // 用于存储接收到的数据的寄存器
    reg [31:0] display_data;

    // UART接收逻辑
    always @(posedge clk_cpu or negedge pll_locked) begin
        if (!pll_locked) begin
            display_data <= 32'h00000000; // 初始化显示数�??
        end else begin
            if (uart_rx_ready) begin
                // 将接收到的数据存储到 display_data 的低8位，并左移显�??
                display_data <= {display_data[23:0], uart_rx_data};
            end
        end
    end

    // UART发�?��?�辑
    always @(posedge clk_cpu or negedge pll_locked) begin
        if (!pll_locked) begin
            uart_tx_data <= 8'h00;
            uart_tx_start <= 1'b0;
        end else begin
            if (btnc_press && !uart_tx_busy) begin
                uart_tx_data <= 8'h55; // 示例：发送固定数�?? 0x55
                uart_tx_start <= 1'b1;
            end else begin
                uart_tx_start <= 1'b0;
            end
        end
    end


    //=====bram & connector=========================================================================

    wire [ADDR_WIDTH-1:0] bram_addra;
    wire [ADDR_WIDTH-1:0] irom_addra;
    wire [DATA_WIDTH-1:0] bram_douta;
    wire [DATA_WIDTH-1:0] irom_douta;
    wire [3:0] bram_wea;
    wire [DATA_WIDTH-1:0] bram_dina;
    wire irom_ena;
    wire bram_ena;

    // AHB_interconnect connector (
    //     .HCLK(clk_cpu),
    //     .HRESETn(pll_locked),
    //     .HADDR(HADDR),
    //     .HRDATA0(HRDATA0),
    //     .HRESP0(HRESP0),
    //     .HREADYOUT0(HREADYOUT0),
    //     .HRDATA1(HRDATA1),
    //     .HRESP1(HRESP1),
    //     .HREADYOUT1(HREADYOUT1),

    //     .HRDATA(HRDATA),
    //     .HRESP(HRESP),
    //     .HSEL(HSEL),
    //     .HREADY(HREADY)
    // );


     AHB_bram_controller bramc (
        .HCLK(clk_cpu),
        .HRESETn(pll_locked),
        .HSELx(1),
        .HADDR(HADDR_D),
        .HWRITE(HWRITE_D),
        .HSIZE(HSIZE_D),
        .HBURST(HBURST_D),
        .HPROT(HPROT_D),
        .HTRANS(HTRANS_D),
        .HMASTLOCK(HMASTLOCK_D),
        .HREADY(1),
        .HWDATA(HWDATA_D),
        .HREADYOUT(),
        .HRESP(HRESP_D),
        .HRDATA(HRDATA_D),
        .bram_addra(bram_addra),
        .bram_dina(bram_dina),
        .bram_douta(bram_douta),
        .bram_ena(bram_ena),
        .bram_wea(bram_wea)
    );

    AHB_irom_controller iromc (
        .HCLK(clk_cpu),
        .HRESETn(pll_locked),
        .HSELx(1),
        .HADDR(HADDR_I),
        .HWRITE(HWRITE_I),
        .HSIZE(HSIZE_I),
        .HBURST(HBURST_I),
        .HPROT(HPROT_I),
        .HTRANS(HTRANS_I),
        .HMASTLOCK(HMASTLOCK_I),
        .HREADY(1),
        .HWDATA(HWDATA_I),
        .HREADYOUT(),
        .HRESP(HRESP_I),
        .HRDATA(HRDATA_I),
        .bram_addra(irom_addra),
        .bram_douta(irom_douta),
        .bram_ena(irom_ena)
    );

    blk_mem_gen_1 irom (
        .clka(clk_cpu),
        .ena(irom_ena),
        .addra(irom_addra[ADDR_WIDTH-1:ADDR_LSB]),
        .douta(irom_douta)
    );

    blk_mem_gen_0 bram (
        .clka(clk_cpu),
        .ena(bram_ena),
        .wea(bram_wea),
        .addra(bram_addra[ADDR_WIDTH-1:ADDR_LSB]),
        .dina(bram_dina),
        .douta(bram_douta)
    );

endmodule