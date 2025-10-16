`timescale 1ns / 1ps

module Seven_Seg(
    input clk,              // fundamental frequency 100MHz (in Xilinx Board) 50MHZ (in Pango board)
    input reset,            // reset signal, active high
    input [31:0] data,      // 32-bit MEM contents willing to display on 7-segments
    output reg [7:0] anode,     // anodes for 7-segments
    output reg         dp,     // dot point for 7-segments
    output reg [6:0] cathode    // cathodes for 7-segments
);

wire [3:0] hex [7:0];
assign hex[0] = data[3:0];
assign hex[1] = data[7:4];
assign hex[2] = data[11:8];
assign hex[3] = data[15:12];
assign hex[4] = data[19:16];
assign hex[5] = data[23:20];
assign hex[6] = data[27:24];
assign hex[7] = data[31:28];

// 七段码查找表（0-F，低电平有效）
reg [6:0] seg_lut [0:15];
initial begin
        seg_lut[ 0] = 7'b1000000; // 0
        seg_lut[ 1] = 7'b1111001; // 1
        seg_lut[ 2] = 7'b0100100; // 2
        seg_lut[ 3] = 7'b0110000; // 3
        seg_lut[ 4] = 7'b0011001; // 4
        seg_lut[ 5] = 7'b0010010; // 5
        seg_lut[ 6] = 7'b0000010; // 6
        seg_lut[ 7] = 7'b1111000; // 7
        seg_lut[ 8] = 7'b0000000; // 8
        seg_lut[ 9] = 7'b0010000; // 9
        seg_lut[10] = 7'b0001000; // A
        seg_lut[11] = 7'b0000011; // b
        seg_lut[12] = 7'b1000110; // C
        seg_lut[13] = 7'b0100001; // d
        seg_lut[14] = 7'b0000110; // E
        seg_lut[15] = 7'b0001110; // F
    end

reg [2:0] scan_cnt = 0;
reg [16:0] div_cnt = 0;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        div_cnt <= 0;
        scan_cnt <= 0;
    end else if (div_cnt == 17'd99999) begin
        div_cnt <= 0;
        scan_cnt <= scan_cnt + 1;
    end else begin
        div_cnt <= div_cnt + 1;
    end
end

// 动态扫描
always @(*) begin
    if (reset) begin
        anode = 8'b1111_1111;
        cathode = 7'b1111111;
        dp = 1'b1; // 小数点默认不亮
    end else begin
        anode = 8'b1111_1111;
        anode[scan_cnt] = 1'b0; // 低电平选中当前位
        cathode = seg_lut[hex[scan_cnt]]; // 当前位显示内容
        dp = 1'b1; // 默认小数点不亮
    end
end

endmodule
