`timescale 1ns / 1ps
//========================================
// 5. Writeback阶段：寄存器写回
//========================================
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
    input  [31:0] MEM_WB_pc,
    input  [31:0] MEM_WB_inst,
    input  [31:0] MEM_WB_alu,
    input  [4:0]  MEM_WB_rd,
    input  [31:0] MEM_WB_data,

    output [31:0] REGS_MEM_WB_rd
);

reg [31:0] regs_mem_wb_rd;

assign REGS_MEM_WB_rd = regs_mem_wb_rd;

always @(*) begin
    if (RES) begin
        case (MEM_WB_inst[6:0])
            `LUI:     regs_mem_wb_rd = MEM_WB_alu;
            `AUIPC:   regs_mem_wb_rd = MEM_WB_alu;
            `JAL:     regs_mem_wb_rd = MEM_WB_pc + 4;
            `JALR:    regs_mem_wb_rd = MEM_WB_pc + 4;
            `LCC:     regs_mem_wb_rd = MEM_WB_data; 
            `RCC:     regs_mem_wb_rd = MEM_WB_data; 
            `MCC:     regs_mem_wb_rd = MEM_WB_data; 
            default:  regs_mem_wb_rd = 0; 
        endcase
    end
end   
endmodule
