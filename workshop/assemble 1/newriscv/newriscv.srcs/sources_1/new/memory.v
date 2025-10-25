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

// AHB transfer size definitions
`define HSIZE_BYTE     3'b000
`define HSIZE_HALFWORD 3'b001
`define HSIZE_WORD     3'b010

// AHB protection control definitions
`define HPROT_DATA     4'b0001  // Data access, privileged mode

module memory (
    input         CLK,
    input  [31:0] HRDATA_D,                // AHB read data (data)
    input         HREADY_D,                // AHB transfer complete (data)
    input         HRESP_D,                 // AHB response (data)
    input  [31:0] EX_MEM_pc,               // PC from execute stage
    input  [31:0] EX_MEM_inst,             // Instruction from execute stage
    input  [31:0] EX_MEM_alu,              // ALU result from execute stage
    input  [31:0] EX_MEM_rs2,              // RS2 value from execute stage
    input  [4:0]  EX_MEM_rd,               // Destination register from execute stage
    input         EX_MEM_is_load,          // Load instruction flag
    input         EX_MEM_is_store,         // Store instruction flag
    input         EX_MEM_is_sys,           // System instruction flag
    input  [31:0] EX_MEM_csr_data,         // CSR data from execute stage
    input         forward_rs1_L_1,         // Load forwarding level 1
    input         forward_rs1_L_2,         // Load forwarding level 2
    input  [31:0] forward_rs1_L_1_datai,   // Load forwarding data level 1
    input  [31:0] forward_rs1_L_2_datai,   // Load forwarding data level 2

    output [31:0] MEM_WB_pc,               // PC to writeback stage
    output [31:0] MEM_WB_inst,             // Instruction to writeback stage
    output [31:0] MEM_WB_alu,              // ALU result to writeback stage
    output [4:0]  MEM_WB_rd,               // Destination register to writeback stage
    output [31:0] MEM_WB_data,             // Data to writeback stage
    output [31:0] HADDR_D,                 // AHB address (data)
    output [31:0] HWDATA_D,                // AHB write data (data)
    output        HWRITE_D,                // AHB write enable (data)
    output [2:0]  HSIZE_D,                 // AHB transfer size (data)
    output [2:0]  HBURST_D,                // AHB burst type (data)
    output [1:0]  HTRANS_D,                // AHB transfer type (data)
    output        HMASTLOCK_D,             // AHB master lock (data)
    output [3:0]  HPROT_D,                 // AHB protection control (data)
    output [31:0] load_data                // Load data for forwarding
);

reg [31:0] mem_wb_pc;
reg [31:0] mem_wb_inst; 
reg [31:0] mem_wb_alu;
reg [4:0]  mem_wb_rd;
reg [31:0] mem_wb_data;   
reg [31:0] EX_MEM_rs2_reg;
reg        EX_MEM_is_load_buffer;

// AHB control signals
assign MEM_WB_pc     = mem_wb_pc;
assign MEM_WB_inst   = mem_wb_inst;
assign MEM_WB_alu    = mem_wb_alu;
assign MEM_WB_rd     = mem_wb_rd;
assign MEM_WB_data   = mem_wb_data;
assign HADDR_D       = EX_MEM_alu;         // Memory address from ALU result
assign HWDATA_D      = EX_MEM_rs2_reg;     // Store data from RS2
assign HWRITE_D      = EX_MEM_is_store;    // Write enable for stores
assign HBURST_D      = `HBURST_SINGLE;     // Single transfers
assign HMASTLOCK_D   = 1'b0;               // No bus locking
assign HPROT_D       = `HPROT_DATA;        // Data access, privileged mode
assign HSIZE_D       = data_size;          // Dynamic size based on instruction

// Pipeline registers for timing
always @(posedge CLK) begin
    EX_MEM_rs2_reg        <= EX_MEM_rs2;
    EX_MEM_is_load_buffer <= EX_MEM_is_load;
end

// Data size calculation based on instruction type
wire [2:0] data_size = (EX_MEM_is_load || EX_MEM_is_store) ? 
                       ((EX_MEM_inst[14:12] == 3'b000 || EX_MEM_inst[14:12] == 3'b100) ? `HSIZE_BYTE :    
                        (EX_MEM_inst[14:12] == 3'b001 || EX_MEM_inst[14:12] == 3'b101) ? `HSIZE_HALFWORD :
                                                                                         `HSIZE_WORD) :   
                       EX_MEM_is_load_buffer ? 
                       ((MEM_WB_inst[14:12] == 3'b000 || MEM_WB_inst[14:12] == 3'b100) ? `HSIZE_BYTE :    
                        (MEM_WB_inst[14:12] == 3'b001 || MEM_WB_inst[14:12] == 3'b101) ? `HSIZE_HALFWORD :
                                                                                         `HSIZE_WORD) :                                                          
                       `HSIZE_WORD;

// Determine if valid transfer is needed
wire valid_trans = EX_MEM_is_load || EX_MEM_is_store;

// HTRANS signal generation
assign HTRANS_D = (valid_trans) ? `HTRANS_NONSEQ : `HTRANS_IDLE;

// Load data processing with sign/zero extension
assign load_data = (MEM_WB_inst[14:12] == 3'b100 || MEM_WB_inst[14:12] == 3'b101) ? 
                   // Zero-extended loads (LBU, LHU)
                   ((data_size == `HSIZE_BYTE)     ? {{24{1'b0}}, HRDATA_D[7:0]}  :
                    (data_size == `HSIZE_HALFWORD) ? {{16{1'b0}}, HRDATA_D[15:0]} : 
                                                     HRDATA_D) :
                   // Sign-extended loads (LB, LH, LW)
                   ((data_size == `HSIZE_BYTE)    ? {{24{HRDATA_D[7]}}, HRDATA_D[7:0]}   :
                    (data_size == `HSIZE_HALFWORD) ? {{16{HRDATA_D[15]}}, HRDATA_D[15:0]} : 
                                                     HRDATA_D);

// Pipeline register updates
always @(posedge CLK) begin
    // Update pipeline registers only when HREADY_D is high
    if (HREADY_D) begin
        if (!EX_MEM_is_load_buffer) begin
            mem_wb_pc   <= EX_MEM_pc;
            mem_wb_inst <= EX_MEM_inst;
            mem_wb_alu  <= EX_MEM_alu;
            mem_wb_rd <= EX_MEM_rd;
        end
        
        // Writeback data selection based on instruction type
        if      (EX_MEM_is_load_buffer) mem_wb_data <= load_data;  // Load result
        else if (EX_MEM_is_sys)         mem_wb_data <= EX_MEM_csr_data;  // CSR data
        else                            mem_wb_data <= EX_MEM_alu;  // ALU result
    end 
    else begin
        // HREADY_D low: maintain current state
        mem_wb_pc   <= mem_wb_pc;
        mem_wb_inst <= mem_wb_inst;
        mem_wb_alu  <= mem_wb_alu;
        mem_wb_rd   <= mem_wb_rd;
        mem_wb_data <= mem_wb_data;
    end
end
endmodule