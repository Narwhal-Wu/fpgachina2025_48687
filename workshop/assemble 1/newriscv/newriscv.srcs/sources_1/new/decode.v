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

module decode (
    input         CLK,
    input  [31:0] IF_ID_pc,        // Program counter from Fetch stage
    input  [31:0] IF_ID_inst,      // Instruction from Fetch stage
    input  [31:0] rs1,             // Register source 1 value
    input  [31:0] rs2,             // Register source 2 value
    input  [31:0] ID_EX_alu,       // ALU result from Execute stage for forwarding
    input  [4:0]  EX_MEM_rd,       // Destination register from Memory stage
    input  [31:0] EX_MEM_alu,      // ALU result from Memory stage for forwarding
    input  [31:0] EX_MEM_inst,     // Instruction from Memory stage
    input  [4:0]  MEM_WB_rd,       // Destination register from Writeback stage
    input         branch_taken,    // Branch taken signal
    input  [31:0] load_data,       // Load data from memory
    
    output [31:0] ID_EX_pc,        // PC to Execute stage
    output [31:0] ID_EX_inst,      // Instruction to Execute stage
    output [31:0] ID_EX_rs1,       // RS1 value to Execute stage
    output [31:0] ID_EX_rs2,       // RS2 value to Execute stage
    output [4:0]  ID_EX_rd,        // Destination register to Execute stage
    output [31:0] ID_EX_imm,       // Immediate value to Execute stage
    output        ID_EX_is_jalr,   // JALR instruction flag
    output        ID_EX_is_jal,    // JAL instruction flag
    output        ID_EX_is_sys,    // System instruction flag
    output        ID_EX_is_branch, // Branch instruction flag
    output        Load_bubble,     // Load hazard detection
    output        rs2_Flag         // RS2 forwarding flag
);

reg [31:0] id_ex_inst; 
reg [31:0] id_ex_pc;
reg [31:0] id_ex_rs1;    
reg [31:0] id_ex_rs2;   
reg [4:0]  id_ex_rd;    
reg [31:0] id_ex_imm;   
reg        id_ex_is_jalr;
reg        id_ex_is_jal;
reg        id_ex_is_sys;
reg        id_ex_is_branch;
reg        load_bubble;
reg        forward_rs1_EX;  // Forward RS1 from EX stage
reg        forward_rs2_EX;  // Forward RS2 from EX stage
reg        forward_rs1_MEM; // Forward RS1 from MEM stage
reg        forward_rs2_MEM; // Forward RS2 from MEM stage
reg        rs2_flag;

// Immediate value generation with sign extension
wire [31:0] ALL0  = 0;
wire [31:0] ALL1  = -1;
wire [31:0] imm_i_s = { IF_ID_inst[31] ? ALL1[31:12]: ALL0[31:12], IF_ID_inst[31:20] };
wire [31:0] imm_s_s = { IF_ID_inst[31] ? ALL1[31:12]: ALL0[31:12], IF_ID_inst[31:25], IF_ID_inst[11:7] };
wire [31:0] imm_b_s = { IF_ID_inst[31] ? ALL1[31:13]: ALL0[31:13], IF_ID_inst[31],    IF_ID_inst[7],  IF_ID_inst[30:25],IF_ID_inst[11:8],ALL0[0] };
wire [31:0] imm_j_s = { IF_ID_inst[31] ? ALL1[31:21]: ALL0[31:21], IF_ID_inst[31],    IF_ID_inst[19:12], IF_ID_inst[20], IF_ID_inst[30:21], ALL0[0] };
wire [31:0] imm_u_s = { IF_ID_inst[31:12], ALL0[11:0] };

assign ID_EX_pc        = id_ex_pc;
assign ID_EX_inst      = id_ex_inst;
assign ID_EX_rs1       = id_ex_rs1;
assign ID_EX_rs2       = id_ex_rs2;
assign ID_EX_rd        = id_ex_rd;
assign ID_EX_imm       = id_ex_imm;
assign ID_EX_is_jalr   = id_ex_is_jalr;
assign ID_EX_is_jal    = id_ex_is_jal;
assign ID_EX_is_sys    = id_ex_is_sys;
assign ID_EX_is_branch = id_ex_is_branch;
assign Load_bubble     = load_bubble;
assign rs2_Flag        = rs2_flag;

// Data forwarding logic
always @(*) begin
    // Forward RS1 from EX stage
    if ((ID_EX_rd == IF_ID_inst[19:15]) && (ID_EX_rd != 0) && 
        (ID_EX_inst[6:0] != `SCC) && (ID_EX_inst[6:0] != `BCC) && (ID_EX_inst != 0)) forward_rs1_EX = 1;
    else                                                                             forward_rs1_EX = 0;
    
    // Forward RS2 from EX stage
    if ((ID_EX_rd == IF_ID_inst[24:20]) && (ID_EX_rd != 0) && 
        (ID_EX_inst[6:0] != `SCC) && (ID_EX_inst[6:0] != `BCC) && (ID_EX_inst != 0)) forward_rs2_EX = 1;
    else                                                                             forward_rs2_EX = 0;
    
    // Forward RS1 from MEM stage
    if ((EX_MEM_rd == IF_ID_inst[19:15]) && (EX_MEM_rd != 0) && 
        (EX_MEM_inst[6:0] != `BCC) && (EX_MEM_inst[6:0] != `SCC) && (EX_MEM_inst != 0)) forward_rs1_MEM = 1;
    else                                                                                forward_rs1_MEM = 0;
    
    // Forward RS2 from MEM stage
    if ((EX_MEM_rd == IF_ID_inst[24:20]) && (EX_MEM_rd != 0) && 
        (EX_MEM_inst[6:0] != `BCC) && (EX_MEM_inst[6:0] != `SCC) && (EX_MEM_inst != 0)) forward_rs2_MEM = 1;
    else                                                                                forward_rs2_MEM = 0;
end

// Load hazard detection
always @(*) begin
    if (IF_ID_inst[6:0] == `LCC) load_bubble = 1;
    else                         load_bubble = 0;
end

// RS2 forwarding flag for load instructions
always @(posedge CLK) begin
    if (forward_rs2_MEM && EX_MEM_inst[6:0] == `LCC && EX_MEM_inst[11:7] == IF_ID_inst[24:20]) rs2_flag <= 1;
    else                                                                                       rs2_flag <= 0;
end

// Pipeline register update
always @(posedge CLK) begin
    id_ex_pc <= IF_ID_pc;

    // Insert bubble if branch taken
    if (branch_taken) id_ex_inst <= 32'h00000000;
    else              id_ex_inst <= IF_ID_inst;

    // RS1 value selection with forwarding
    if           (forward_rs1_EX)  id_ex_rs1 <= ID_EX_alu;
    else if      (forward_rs1_MEM && EX_MEM_inst[6:0] == `LCC && EX_MEM_inst[11:7] == IF_ID_inst[19:15]) id_ex_rs1 <= load_data;
    else if      (forward_rs1_MEM) id_ex_rs1 <= EX_MEM_alu;
    else                           id_ex_rs1 <= rs1;

    // RS2 value selection with forwarding
    if           (forward_rs2_EX)  id_ex_rs2 <= ID_EX_alu;
    else if      (forward_rs2_MEM && EX_MEM_inst[6:0] == `LCC && EX_MEM_inst[11:7] == IF_ID_inst[24:20]) id_ex_rs2 <= load_data;
    else if      (forward_rs2_MEM) id_ex_rs2 <= EX_MEM_alu;
    else                           id_ex_rs2 <= rs2;

    id_ex_rd <= IF_ID_inst[11:7];
        
    // Immediate value selection based on instruction type
    case (IF_ID_inst[6:0])
        `JALR:    id_ex_imm <= imm_i_s;
        `JAL:     id_ex_imm <= imm_j_s;
        `BCC:     id_ex_imm <= imm_b_s;
        `LUI:     id_ex_imm <= imm_u_s;
        `AUIPC:   id_ex_imm <= imm_u_s;
        `LCC:     id_ex_imm <= imm_i_s;
        `SCC:     id_ex_imm <= imm_s_s;
        default:  id_ex_imm <= imm_i_s;
    endcase
        
    // Instruction type flags
    id_ex_is_jalr   <= (IF_ID_inst[6:0] == `JALR);
    id_ex_is_jal    <= (IF_ID_inst[6:0] == `JAL);
    id_ex_is_sys    <= (IF_ID_inst[6:0] == `SYS);
    id_ex_is_branch <= (IF_ID_inst[6:0] == `BCC); 
end    
endmodule