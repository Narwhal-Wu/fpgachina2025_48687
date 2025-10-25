`timescale 1ns / 1ps

// RISC-V instruction opcodes
`define LUI     7'b0110111
`define AUIPC   7'b0010111
`define JAL     7'b1101111
`define JALR    7'b1100111
`define BCC     7'b1100011
`define LCC     7'b0000011
`define SCC     7'b0100011
`define MCC     7'b0010011
`define RCC     7'b0110011
`define SYS     7'b1110011

// AHB transfer type definitions
`define HTRANS_IDLE    2'b00
`define HTRANS_BUSY    2'b01
`define HTRANS_NONSEQ  2'b10
`define HTRANS_SEQ     2'b11

// AHB burst type definitions
`define HBURST_SINGLE  3'b000
`define HBURST_INCR    3'b001
`define HBURST_WRAP4   3'b010
`define HBURST_INCR4   3'b011
`define HBURST_WRAP8   3'b100
`define HBURST_INCR8   3'b101
`define HBURST_WRAP16  3'b110
`define HBURST_INCR16  3'b111

// AHB transfer size definitions
`define HSIZE_BYTE     3'b000
`define HSIZE_HALFWORD 3'b001
`define HSIZE_WORD     3'b010

// AHB protection control definitions
`define HPROT_OPCODE   4'b0011  // Instruction fetch, privileged mode

module fetch (
    input         CLK,
    input         RES,
    input  [31:0] HRDATA_I,        // AHB read data (instruction)
    input         HREADY_I,        // AHB transfer complete (instruction)
    input         HRESP_I,         // AHB response (instruction)
    input  [31:0] PC_next,         // Next PC from execute stage
    input         branch_taken,    // Branch taken signal
    input         Load_bubble,     // Load hazard bubble
    
    output [31:0] PC,              // Current program counter
    output [31:0] HADDR_I,         // AHB address (instruction)
    output        HWRITE_I,        // AHB write enable (instruction, always 0)
    output [2:0]  HSIZE_I,         // AHB transfer size (instruction)
    output [2:0]  HBURST_I,        // AHB burst type (instruction)
    output [1:0]  HTRANS_I,        // AHB transfer type (instruction)
    output        HMASTLOCK_I,     // AHB master lock (instruction)
    output [31:0] HWDATA_I,        // AHB write data (instruction)
    output [3:0]  HPROT_I,         // AHB protection control (instruction)
    output [31:0] IF_ID_pc,        // PC to decode stage
    output [31:0] IF_ID_inst       // Instruction to decode stage
);

reg [31:0] pc; 
reg [31:0] if_id_pc; 
reg [31:0] if_id_inst; 
reg [31:0] HWDATA_I_reg;
reg        last_bubble; 

// Determine if valid transfer is needed
wire valid_trans = RES && !branch_taken && !Load_bubble;

// AHB control signals
assign PC           = pc;
assign HADDR_I      = pc;
assign HWRITE_I     = 1'b0;               // Instruction interface is always read
assign HSIZE_I      = `HSIZE_WORD;        // Always word transfers
assign HBURST_I     = `HBURST_SINGLE;     // Single transfers
assign HMASTLOCK_I  = 1'b0;               // No bus locking
assign HWDATA_I     = 32'b0;              // Instruction interface doesn't write data
assign HPROT_I      = `HPROT_OPCODE;      // Instruction fetch, privileged mode
assign IF_ID_pc     = if_id_pc;
assign IF_ID_inst   = if_id_inst;

// HTRANS signal generation
assign HTRANS_I = (valid_trans) ? `HTRANS_NONSEQ : `HTRANS_IDLE;

// HRDATA buffer
always @(posedge CLK or negedge RES) begin
    if(!RES) HWDATA_I_reg <= 32'b0;
    else     HWDATA_I_reg <= HRDATA_I;
end

// Main fetch logic
always @(posedge CLK) begin
    if (!RES) begin
        // Reset all PC and instruction registers
        pc           <= 32'd0;
        if_id_pc     <= 32'd0;
        if_id_inst   <= 32'd0;
        last_bubble  <= 1'b0;
    end 
    else begin
        if_id_pc <= PC;  // Pass PC to decode stage
        
        // Update PC and instruction only when HREADY_I is high
        if (HREADY_I) begin
            if (branch_taken) begin
                // Branch taken: update PC to branch target, insert bubble
                pc         <= PC_next;
                if_id_inst <= 32'd0;
            end 
            else if (Load_bubble) begin
                // Load hazard: maintain PC, insert bubble
                if_id_inst  <= 32'd0;
                last_bubble <= 1'b1;
            end 
            else if (last_bubble) begin
                // Handle previous cycle bubble: update PC, use buffered instruction
                pc          <= PC_next;
                if_id_inst  <= HWDATA_I_reg;
                last_bubble <= 1'b0;
            end 
            else if (valid_trans) begin
                // Normal instruction fetch
                pc         <= PC_next;
                if_id_inst <= HRDATA_I;
            end 
            else if_id_inst <= if_id_inst;
        end 
        else begin
            // HREADY_I low: maintain current state
            pc         <= pc;
            if_id_inst <= if_id_inst;
        end
    end    
end
endmodule