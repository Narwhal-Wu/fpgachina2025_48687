`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// RV32I Test Bench with 7-Segment Display Monitor
// Monitors register x31 (t6) and displays on 7-segment
// Provides debug output for instruction testing
//////////////////////////////////////////////////////////////////////////////////

module rv32i_test_tb;

    // Clock and reset
    reg CLK100MHZ;
    reg CPU_RESETN;
    
    // Buttons (not used in this test)
    reg BTNC, BTNU, BTND, BTNL, BTNR;
    
    // Outputs
    wire [15:0] LED;
    wire LED16_R, LED16_G, LED16_B;
    wire LED17_R, LED17_G, LED17_B;
    wire [7:0] anode;
    wire [6:0] cathode;
    wire dp;
    
    // UART (not used)
    reg UART_RX;
    wire UART_TX;
    
    // Instantiate the TOP module (contains the processor and peripherals)
    TOP_AI dut (
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
    
    // Clock generation: 100 MHz
    initial CLK100MHZ = 0;
    always #5 CLK100MHZ = ~CLK100MHZ;
    
    // Monitor register x31 (the test result register)
    wire [31:0] x31_value;
    assign x31_value = dut.cpu_inst.REGS[31];
    
    // Monitor current PC
    wire [31:0] current_pc;
    assign current_pc = dut.cpu_inst.PC;
    
    // Monitor current instruction
    wire [31:0] current_inst;
    assign current_inst = dut.cpu_inst.IF_ID_inst;
    
    // Test result tracking
    reg [31:0] prev_x31;
    integer test_count;
    integer test_timeout;
    reg test_complete;
    
    // Decode 7-segment display
    function [3:0] decode_7seg;
        input [6:0] cathode_in;
        begin
            case (cathode_in)
                7'b1000000: decode_7seg = 4'h0;
                7'b1111001: decode_7seg = 4'h1;
                7'b0100100: decode_7seg = 4'h2;
                7'b0110000: decode_7seg = 4'h3;
                7'b0011001: decode_7seg = 4'h4;
                7'b0010010: decode_7seg = 4'h5;
                7'b0000010: decode_7seg = 4'h6;
                7'b1111000: decode_7seg = 4'h7;
                7'b0000000: decode_7seg = 4'h8;
                7'b0010000: decode_7seg = 4'h9;
                7'b0001000: decode_7seg = 4'hA;
                7'b0000011: decode_7seg = 4'hB;
                7'b1000110: decode_7seg = 4'hC;
                7'b0100001: decode_7seg = 4'hD;
                7'b0000110: decode_7seg = 4'hE;
                7'b0001110: decode_7seg = 4'hF;
                default:    decode_7seg = 4'hX;
            endcase
        end
    endfunction
    
    // Main test sequence
    initial begin
        // Initialize signals
        CPU_RESETN = 0;
        BTNC = 0;
        BTNU = 0;
        BTND = 0;
        BTNL = 0;
        BTNR = 0;
        UART_RX = 1;
        prev_x31 = 0;
        test_count = 0;
        test_complete = 0;
        test_timeout = 0;
        
        $display("==============================================");
        $display("  RV32I Instruction Test");
        $display("==============================================");
        $display("Time: %0t", $time);
        
        // Hold reset for 100ns
        #100;
        CPU_RESETN = 1;
        $display("[%0t] Reset released, processor starting...", $time);
        
        // Wait for test to complete or timeout
        #100000;  // Wait up to 100us
        
        if (!test_complete) begin
            $display("\n[%0t] WARNING: Test did not complete within timeout", $time);
            $display("Last x31 value: 0x%08h", x31_value);
            $display("Current PC: 0x%08h", current_pc);
            $display("Current instruction: 0x%08h", current_inst);
        end
        
        // Display final results
        display_results();
        
        $display("\n==============================================");
        $display("Test finished at time: %0t", $time);
        $display("==============================================");
        
        #1000;
        $finish;
    end
    
    // Monitor x31 register changes
    always @(posedge CLK100MHZ) begin
        if (CPU_RESETN) begin
            if (x31_value != prev_x31) begin
                prev_x31 <= x31_value;
                
                // Check if this is a test pass or fail
                if (x31_value[31:16] == 16'h0000) begin
                    // Normal test pass (low values)
                    test_count = x31_value[7:0];
                    $display("[%0t] Test Progress: %0d tests passed (x31=0x%08h)", 
                             $time, test_count, x31_value);
                end else begin
                    // Test failure (error code)
                    $display("[%0t] TEST FAILED! Error code: 0x%08h", $time, x31_value);
                    $display("         Error indicates failure in test #%0d", x31_value[7:0]);
                    test_complete = 1;
                end
            end
            
            // Check for test completion (processor stuck in infinite loop)
            if (current_inst == 32'h0000006F && test_timeout < 10000) begin
                test_timeout <= test_timeout + 1;
                if (test_timeout == 5000 && !test_complete) begin
                    test_complete = 1;
                    $display("[%0t] Test Complete - Processor halted", $time);
                end
            end else begin
                test_timeout <= 0;
            end
        end
    end
    
    // Display final test results
    task display_results;
        begin
            $display("\n==============================================");
            $display("  TEST RESULTS");
            $display("==============================================");
            $display("Final x31 value: 0x%08h (%0d decimal)", x31_value, x31_value);
            
            if (x31_value[31:16] != 16'h0000) begin
                $display("Status: FAILED");
                $display("Failed test number: %0d", x31_value[7:0]);
                $display("\nError code breakdown:");
                $display("  0xE00nn - Comprehensive test failure at test nn");
                $display("  0xF00nn - Basic test failure at test nn");
                $display("  0xA00nn - Arithmetic test failure at test nn");
                $display("  0xB00nn - Logic test failure at test nn");
                $display("  0xC00nn - Shift test failure at test nn");
                $display("  0xD00nn - Branch/Memory test failure at test nn");
            end else begin
                $display("Status: %0d tests PASSED", test_count);
                if (test_count >= 34) begin
                    $display("\n*** ALL COMPREHENSIVE TESTS PASSED! ***");
                end else if (test_count >= 3) begin
                    $display("\n*** BASIC TESTS PASSED ***");
                end
            end
            
            $display("\n7-Segment Display Output:");
            $display("  Raw x31 value displayed: 0x%08h", x31_value);
            $display("==============================================");
        end
    endtask
    
    // Monitor instruction execution (optional, for debugging)
    reg [31:0] inst_count;
    initial inst_count = 0;
    
    always @(posedge CLK100MHZ) begin
        if (CPU_RESETN && current_inst != 0) begin
            inst_count <= inst_count + 1;
        end
    end
    
    // Timeout watchdog
    initial begin
        #500000;  // 500us total timeout
        $display("\n[%0t] ERROR: Simulation timeout!", $time);
        $display("Final x31: 0x%08h", x31_value);
        $display("Total instructions executed: %0d", inst_count);
        display_results();
        $finish;
    end

endmodule
