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

module writeback (
    input         CLK,
    input         RES,
    input  [31:0] MEM_WB_pc,       // PC from memory stage
    input  [31:0] MEM_WB_inst,     // Instruction from memory stage
    input  [31:0] MEM_WB_alu,      // ALU result from memory stage
    input  [4:0]  MEM_WB_rd,       // Destination register
    input  [31:0] MEM_WB_data,     // Data from memory stage

    output [31:0] REGS_MEM_WB_rd   // Data to write to register file
);

reg [31:0] regs_mem_wb_rd;

assign REGS_MEM_WB_rd = regs_mem_wb_rd;

// Writeback data selection based on instruction type
always @(*) begin
    if (RES) begin
        case (MEM_WB_inst[6:0])
            `LUI:     regs_mem_wb_rd = MEM_WB_alu;        // LUI: use ALU result
            `AUIPC:   regs_mem_wb_rd = MEM_WB_alu;        // AUIPC: use ALU result
            `JAL:     regs_mem_wb_rd = MEM_WB_pc + 4;     // JAL: return address
            `JALR:    regs_mem_wb_rd = MEM_WB_pc + 4;     // JALR: return address
            `LCC:     regs_mem_wb_rd = MEM_WB_data;       // Load: use memory data
            `RCC:     regs_mem_wb_rd = MEM_WB_data;       // R-type: use ALU result
            `MCC:     regs_mem_wb_rd = MEM_WB_data;       // I-type: use ALU result
            default:  regs_mem_wb_rd = 0;                 // Default case
        endcase
    end
end   
endmodule