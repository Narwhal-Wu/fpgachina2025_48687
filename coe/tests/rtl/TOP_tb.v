`timescale 1ns / 1ps

module TOP_tb;
    reg CLK100MHZ;
    reg CPU_RESETN;

    reg BTNC;
    reg BTNU;
    reg BTND;
    reg BTNL;
    reg BTNR;

    wire [15:0] LED;

    wire LED16_R;
    wire LED16_G;
    wire LED16_B;
    wire LED17_R;
    wire LED17_G;
    wire LED17_B;

    wire [7:0] anode;
    wire [6:0] cathode;
    wire dp;

    reg UART_RX;
    wire UART_TX;

    TOP dut (
        .CLK100MHZ(CLK100MHZ),
        .CPU_RESETN(CPU_RESETN),
        .BTNC(BTNC),
        .BTNU(BTNU),
        .BTND(BTND),
        .BTNL(BTNL),
        .BTNR(BTNR),
        .LED(LED),
        .LED16_R(LED16_R),
        .LED16_G(LED16_G),
        .LED16_B(LED16_B),
        .LED17_R(LED17_R),
        .LED17_G(LED17_G),
        .LED17_B(LED17_B),
        .anode(anode),
        .cathode(cathode),
        .dp(dp),
        .UART_RX(UART_RX),
        .UART_TX(UART_TX)
    );

    // Clock generation: 100 MHz -> period 10 ns
    initial CLK100MHZ = 1'b0;
    always #5 CLK100MHZ = ~CLK100MHZ;

    // Reset and stimulus
    initial begin
        CPU_RESETN = 1'b0;
        BTNC = 1'b0;
        BTNU = 1'b0;
        BTND = 1'b0;
        BTNL = 1'b0;
        BTNR = 1'b0;
        UART_RX = 1'b1;

        #100;
        CPU_RESETN = 1'b1;

        // Simple stimulus placeholder
        #10000;
        $finish;
    end
endmodule
