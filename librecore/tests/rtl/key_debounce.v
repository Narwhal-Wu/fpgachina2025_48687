`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2025/09/20 23:22:40
// Design Name: 
// Module Name: key_debounce
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

module key_debounce #(
    parameter CLK_FREQ = 100_000_000,
    parameter DEBOUNCE_MS = 20
) (
    input  wire clk,
    input  wire rst_n,
    input  wire key_i,        // 原始按键输入
    output reg  key_press,    // 按键按下脉冲
    output reg  key_state     // 按键稳定状态
);

    localparam COUNTER_MAX = (CLK_FREQ / 1000) * DEBOUNCE_MS - 1;
    
    reg [31:0] counter;
    reg [2:0]  key_sync;

    // 同步器
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            key_sync <= 3'b111;
        else
            key_sync <= {key_sync[1:0], key_i};
    end

    // 消抖逻辑
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            counter <= 0;
            key_state <= 1'b1;
            key_press <= 1'b0;
        end else begin
            if (key_sync[2] != key_state) begin
                if (counter == COUNTER_MAX) begin
                    key_state <= key_sync[2];
                    key_press <= ~key_sync[2]; // 按下时产生脉冲
                    counter <= 0;
                end else begin
                    counter <= counter + 1;
                    key_press <= 1'b0;
                end
            end else begin
                counter <= 0;
                key_press <= 1'b0;
            end
        end
    end

endmodule
