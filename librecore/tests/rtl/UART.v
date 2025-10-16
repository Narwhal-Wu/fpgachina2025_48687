`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/10/04 17:15:42
// Design Name: 
// Module Name: UART
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

`timescale 1ns / 1ps

module UART #(
    parameter CLK_FREQ = 100_000_000,  // 时钟频率，默认100MHz
    parameter BAUD_RATE = 9600         // 波特率，默认9600
)(
    input wire clk,                    // 时钟信号
    input wire reset,                  // 复位信号，高电平有效
    input wire rx,                     // UART接收引脚
    output wire tx,                    // UART发送引脚
    input wire [7:0] tx_data,          // 要发送的数据
    input wire tx_start,               // 发送启动信号
    output reg tx_busy,                // 发送忙标志
    output reg [7:0] rx_data,          // 接收到的数据
    output reg rx_ready                // 接收完成标志
);

    // 计算波特率计数器的最大值
    localparam integer BAUD_DIV = CLK_FREQ / BAUD_RATE;

    // UART发送逻辑
    reg [3:0] tx_bit_cnt = 0;          // 发送位计数器
    reg [15:0] tx_clk_cnt = 0;         // 发送时钟计数器
    reg tx_reg = 1'b1;                 // 发送寄存器，默认高电平（空闲状态）
    reg [9:0] tx_shift_reg = 10'b1111111111; // 发送移位寄存器

    assign tx = tx_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            tx_bit_cnt <= 0;
            tx_clk_cnt <= 0;
            tx_reg <= 1'b1;
            tx_busy <= 1'b0;
            tx_shift_reg <= 10'b1111111111;
        end else begin
            if (tx_start && !tx_busy) begin
                // 开始发送
                tx_busy <= 1'b1;
                tx_shift_reg <= {1'b1, tx_data, 1'b0}; // 起始位+数据+停止位
                tx_clk_cnt <= 0;
                tx_bit_cnt <= 0;
            end else if (tx_busy) begin
                if (tx_clk_cnt == BAUD_DIV - 1) begin
                    tx_clk_cnt <= 0;
                    tx_reg <= tx_shift_reg[0];
                    tx_shift_reg <= {1'b1, tx_shift_reg[9:1]};
                    if (tx_bit_cnt == 9) begin
                        tx_busy <= 1'b0; // 发送完成
                    end else begin
                        tx_bit_cnt <= tx_bit_cnt + 1;
                    end
                end else begin
                    tx_clk_cnt <= tx_clk_cnt + 1;
                end
            end
        end
    end

    // UART接收逻辑
    reg [3:0] rx_bit_cnt = 0;          // 接收位计数器
    reg [15:0] rx_clk_cnt = 0;         // 接收时钟计数器
    reg [7:0] rx_shift_reg = 0;        // 接收移位寄存器
    reg rx_sync = 1'b1;                // 同步接收信号
    reg rx_prev = 1'b1;                // 上一个接收信号

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            rx_bit_cnt <= 0;
            rx_clk_cnt <= 0;
            rx_ready <= 1'b0;
            rx_shift_reg <= 0;
            rx_sync <= 1'b1;
            rx_prev <= 1'b1;
        end else begin
            rx_sync <= rx;
            rx_prev <= rx_sync;

            if (!rx_ready) begin
                if (rx_prev && !rx_sync) begin
                    // 检测到起始位
                    rx_clk_cnt <= BAUD_DIV / 2;
                    rx_bit_cnt <= 0;
                end else if (rx_clk_cnt == BAUD_DIV - 1) begin
                    rx_clk_cnt <= 0;
                    if (rx_bit_cnt < 8) begin
                        rx_shift_reg <= {rx_sync, rx_shift_reg[7:1]};
                        rx_bit_cnt <= rx_bit_cnt + 1;
                    end else if (rx_bit_cnt == 8) begin
                        rx_data <= rx_shift_reg;
                        rx_ready <= 1'b1; // 接收完成
                    end
                end else begin
                    rx_clk_cnt <= rx_clk_cnt + 1;
                end
            end else if (rx_ready) begin
                // 清除接收完成标志
                rx_ready <= 1'b0;
            end
        end
    end

endmodule
