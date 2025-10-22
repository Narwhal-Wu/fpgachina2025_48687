//use in TOP
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

// 七段码查找表�??0-F，低电平有效�??
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

// 动�?�扫�??
always @(*) begin
    if (reset) begin
        anode = 8'b1111_1111;
        cathode = 7'b1111111;
        dp = 1'b1; // 小数点默认不�??
    end else begin
        anode = 8'b1111_1111;
        anode[scan_cnt] = 1'b0; // 低电平�?�中当前�??
        cathode = seg_lut[hex[scan_cnt]]; // 当前位显示内�??
        dp = 1'b1; // 默认小数点不�??
    end
end

endmodule

//use in TOP_AI
/*

`timescale 1ns / 1ps

module Seven_Seg #(
    parameter integer CLK_HZ          = 10_000_000,  // ����ʱ��Ƶ��
    parameter integer PER_DIGIT_HZ    = 2000          // ÿ�����ֵ�Ŀ��ˢ��Ƶ��(���� 1~2 kHz)
)(
    input  wire        clk,        // ʱ��
    input  wire        reset,      // ��λ������Ч
    input  wire [31:0] data,       // ��Ҫ��ʾ�� 32bit ����
    output reg  [7:0]  anode,      // λѡ������Ч
    output reg         dp,         // С���㣬����Ч
    output reg  [6:0]  cathode     // ��ѡ CA..CG������Ч��cathode[0]=CA
);

    localparam integer DIGITS      = 8;
    localparam integer TICK_HZ     = DIGITS * PER_DIGIT_HZ;                  // ��λƵ��
    localparam integer DIV_VAL     = (CLK_HZ / TICK_HZ) - 1;                 // ��Ƶ����
    localparam integer DIV_W       = $clog2(DIV_VAL + 1);

    reg [DIV_W-1:0] div_cnt = 0;
    reg             phase   = 0;       // 0: �հ���λ����λѡ+���¶��룩��1: ������λ����λѡ��
    reg [2:0]       idx     = 0;       // ��ǰλ(0..7)
    reg [31:0]      data_latched = 32'h0;   // ����ʾ���֡����?
    reg [6:0]       seg_reg = 7'h7F;        // ����Ĵ棨����Ч��?
    reg [7:0]       an_reg  = 8'hFF;        // λѡ�Ĵ棨����Ч��

    // �ӿ����а�λȡ nibble��idx=0 �� bits[3:0], idx=7 �� bits[31:28]��
    wire [3:0] nibble = data_latched[idx*4 +: 4];

    // �������룺���� {g,f,e,d,c,b,a} ����Ч
    function [6:0] hex_to_seg;
        input [3:0] h;
        case (h)
            4'h0: hex_to_seg = 7'b1000000;
            4'h1: hex_to_seg = 7'b1111001;
            4'h2: hex_to_seg = 7'b0100100;
            4'h3: hex_to_seg = 7'b0110000;
            4'h4: hex_to_seg = 7'b0011001;
            4'h5: hex_to_seg = 7'b0010010;
            4'h6: hex_to_seg = 7'b0000010;
            4'h7: hex_to_seg = 7'b1111000;
            4'h8: hex_to_seg = 7'b0000000;
            4'h9: hex_to_seg = 7'b0010000;
            4'hA: hex_to_seg = 7'b0001000;
            4'hB: hex_to_seg = 7'b0000011;
            4'hC: hex_to_seg = 7'b1000110;
            4'hD: hex_to_seg = 7'b0100001;
            4'hE: hex_to_seg = 7'b0000110;
            4'hF: hex_to_seg = 7'b0001110;
        endcase
    endfunction

    // ��Ƶ + ɨ��״̬��
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            div_cnt       <= 0;
            phase         <= 1'b0;
            idx           <= 3'd0;
            data_latched  <= 32'h0;
            seg_reg       <= 7'h7F;
            an_reg        <= 8'hFF;
            dp            <= 1'b1; // С����Ĭ���𣨵���Ч��
        end else begin
            // ��Ƶ������λ"tick"
            if (div_cnt == DIV_VAL[DIV_W-1:0]) begin
                div_cnt <= 0;
                phase   <= ~phase;

                if (phase == 1'b0) begin
                    // �հ���λ���ȹ�����λѡ���ٸ��¶��룬����֡�߽��������?
                    an_reg  <= 8'hFF;              // ȫ���رգ�����Ч��
                    seg_reg <= hex_to_seg(nibble); // ������һ�� idx �����ϸ�������λȷ��

                    // ֡�߽磺�����Ǽ���ȥ���� idx==0 ��λ֮ǰ������ data
                    if (idx == 3'd0)
                        data_latched <= data;

                end else begin
                    // ������λ���򿪵�ǰλѡ
                    an_reg <= ~(8'b1 << idx); // ����ǰλΪ 0������Ϊ 1������Ч��

                    // ��һ�ν���հ���λǰ��׼������һ��? idx
                    idx <= idx + 3'd1;
                end
            end else begin
                div_cnt <= div_cnt + 1'b1;
            end

            // С���㳣�����谴λ���ƣ��ɷ��� cathode ���Ĵ棩
            dp <= 1'b1;
        end
    end

    // ���Ĵ������������?
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            anode    <= 8'hFF;
            cathode  <= 7'h7F;
        end else begin
            anode    <= an_reg;
            cathode  <= seg_reg;
        end
    end

endmodule

*/