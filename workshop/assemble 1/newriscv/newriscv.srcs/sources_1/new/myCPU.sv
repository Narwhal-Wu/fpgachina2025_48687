`timescale 1ns / 1ps

// RISC-V instruction opcodes
`define LUI   7'b0110111
`define AUIPC 7'b0010111
`define JAL   7'b1101111
`define JALR  7'b1100111
`define BCC   7'b1100011
`define LCC   7'b0000011
`define SCC   7'b0100011
`define MCC   7'b0010011
`define RCC   7'b0110011
`define SYS   7'b1110011

module myCPU (
  // AHB global signals
  input             HCLK,                // AHB clock
  input             HRESETn,             // AHB reset (active low)
  
  // AHB instruction interface
  input      [31:0] HRDATA_I,            // AHB read data (instruction)
  input             HREADY_I,            // AHB transfer complete (instruction)
  input             HRESP_I,             // AHB response (instruction)
  output     [31:0] HADDR_I,             // AHB address (instruction)
  output            HWRITE_I,            // AHB write enable (instruction, always 0)
  output     [2:0]  HSIZE_I,             // AHB transfer size (instruction)
  output     [2:0]  HBURST_I,            // AHB burst type (instruction)
  output     [1:0]  HTRANS_I,            // AHB transfer type (instruction)
  output            HMASTLOCK_I,         // AHB master lock (instruction)
  output     [31:0] HWDATA_I,            // AHB write data (instruction)
  output     [3:0]  HPROT_I,             // AHB protection control (instruction)
  
  // AHB data interface
  input      [31:0] HRDATA_D,            // AHB read data (data)
  input             HREADY_D,            // AHB transfer complete (data)
  input             HRESP_D,             // AHB response (data)
  output     [31:0] HADDR_D,             // AHB address (data)
  output     [31:0] HWDATA_D,            // AHB write data (data)
  output            HWRITE_D,            // AHB write enable (data)
  output     [2:0]  HSIZE_D,             // AHB transfer size (data)
  output     [2:0]  HBURST_D,            // AHB burst type (data)
  output     [1:0]  HTRANS_D,            // AHB transfer type (data)
  output            HMASTLOCK_D,         // AHB master lock (data)
  output     [3:0]  HPROT_D,             // AHB protection control (data)
  
  // Debug outputs
  output     [31:0] REGS_X31,            // Register x31 value for display
  output     [31:0] PC                   // Current program counter
);

//====================================================================================
// 1. Fetch Stage: Instruction Fetch and PC Management
//====================================================================================
wire [31:0] PC_next;        // Next PC value
wire [31:0] IF_ID_pc;       // PC to decode stage
wire [31:0] IF_ID_inst;     // Instruction to decode stage
wire        branch_taken;   // Branch taken signal
wire        Load_bubble;    // Load hazard detection

fetch myfetch (
  .CLK             (HCLK),
  .RES             (HRESETn),
  .HRDATA_I        (HRDATA_I),
  .HREADY_I        (HREADY_I),
  .HRESP_I         (HRESP_I),
  .PC_next         (PC_next),
  .branch_taken    (branch_taken),
  .Load_bubble     (Load_bubble),

  .PC              (PC),
  .HADDR_I         (HADDR_I),
  .HWRITE_I        (HWRITE_I),
  .HSIZE_I         (HSIZE_I),
  .HBURST_I        (HBURST_I),
  .HTRANS_I        (HTRANS_I),
  .HMASTLOCK_I     (HMASTLOCK_I),
  .HWDATA_I        (HWDATA_I),
  .HPROT_I         (HPROT_I),
  .IF_ID_pc        (IF_ID_pc),
  .IF_ID_inst      (IF_ID_inst)
);

//====================================================================================
// 2. Decode Stage: Register Read and Instruction Decode
//====================================================================================
wire [31:0] ID_EX_pc;       // PC to execute stage
wire [31:0] ID_EX_inst;     // Instruction to execute stage
wire [31:0] ID_EX_rs1;      // RS1 value to execute stage
wire [31:0] ID_EX_rs2;      // RS2 value to execute stage
wire [ 4:0] ID_EX_rd;       // Destination register to execute stage
wire [31:0] ID_EX_imm;      // Immediate value to execute stage
wire [31:0] ID_EX_alu;      // ALU result for forwarding
wire        ID_EX_is_jalr;  // JALR instruction flag
wire        ID_EX_is_jal;   // JAL instruction flag
wire        ID_EX_is_sys;   // System instruction flag
wire        ID_EX_is_branch;// Branch instruction flag
wire [31:0] load_data;      // Load data from memory
wire        rs2_Flag;       // RS2 forwarding flag

// CPU register file
reg  [31:0] REGS [31:0];
integer i;
initial for (i = 0; i != 32; i = i + 1) REGS[i] = 0;  // Initialize registers

// Register read ports
reg  [31:0] rs1;
reg  [31:0] rs2;
always @(*) begin
  rs1 = REGS[IF_ID_inst[19:15]];  // Read RS1
  rs2 = REGS[IF_ID_inst[24:20]];  // Read RS2
end

decode mydecode (
  .CLK            (HCLK),
  .IF_ID_pc       (IF_ID_pc),
  .IF_ID_inst     (IF_ID_inst),
  .rs1            (rs1),
  .rs2            (rs2),
  .ID_EX_alu      (ID_EX_alu),
  .EX_MEM_rd      (EX_MEM_rd),
  .EX_MEM_alu     (EX_MEM_alu),
  .EX_MEM_inst    (EX_MEM_inst),
  .MEM_WB_rd      (MEM_WB_rd),
  .branch_taken   (branch_taken),
  .load_data      (load_data),
  
  .ID_EX_pc       (ID_EX_pc),
  .ID_EX_inst     (ID_EX_inst),
  .ID_EX_rs1      (ID_EX_rs1),
  .ID_EX_rs2      (ID_EX_rs2),
  .ID_EX_rd       (ID_EX_rd),
  .ID_EX_imm      (ID_EX_imm),
  .ID_EX_is_jalr  (ID_EX_is_jalr),
  .ID_EX_is_jal   (ID_EX_is_jal),
  .ID_EX_is_sys   (ID_EX_is_sys),
  .ID_EX_is_branch(ID_EX_is_branch),
  .Load_bubble    (Load_bubble),
  .rs2_Flag       (rs2_Flag)
);

//====================================================================================
// 3. Execute Stage: Arithmetic Operations and Branching
//====================================================================================
wire [31:0] EX_MEM_pc;            // PC to memory stage
wire [31:0] EX_MEM_inst;          // Instruction to memory stage
wire [31:0] EX_MEM_alu;           // ALU result to memory stage
wire [31:0] EX_MEM_rs2;           // RS2 value to memory stage
wire [ 4:0] EX_MEM_rd;            // Destination register to memory stage
wire        EX_MEM_is_load;       // Load instruction flag
wire        EX_MEM_is_store;      // Store instruction flag
wire        EX_MEM_is_jalr;       // JALR instruction flag
wire        EX_MEM_is_jal;        // JAL instruction flag
wire        EX_MEM_is_sys;        // System instruction flag
wire [31:0] EX_MEM_csr_data;      // CSR data to memory stage
wire        branch_cond_taken;    // Branch condition evaluation
wire        forward_rs1_L_1;      // Load forwarding level 1
wire        forward_rs1_L_2;      // Load forwarding level 2
wire [31:0] forward_rs1_L_1_datai;// Load forwarding data level 1
wire [31:0] forward_rs1_L_2_datai;// Load forwarding data level 2

execute myexecute (
  .CLK                   (HCLK),
  .RES                   (HRESETn),
  .ID_EX_pc              (ID_EX_pc),
  .ID_EX_inst            (ID_EX_inst),
  .ID_EX_rs1             (ID_EX_rs1),
  .ID_EX_rs2             (ID_EX_rs2),
  .ID_EX_rd              (ID_EX_rd),
  .ID_EX_imm             (ID_EX_imm),
  .ID_EX_is_jal          (ID_EX_is_jal),
  .ID_EX_is_jalr         (ID_EX_is_jalr),
  .ID_EX_is_sys          (ID_EX_is_sys),
  .ID_EX_is_branch       (ID_EX_is_branch),
  .PC                    (PC),
  .HRDATA_D              (HRDATA_D),
  .MEM_WB_inst           (MEM_WB_inst),
  .Load_bubble           (Load_bubble),
  .load_data             (load_data),
  .rs2_Flag              (rs2_Flag),

  .ID_EX_alu             (ID_EX_alu),
  .EX_MEM_pc             (EX_MEM_pc),
  .EX_MEM_inst           (EX_MEM_inst),
  .EX_MEM_alu            (EX_MEM_alu),
  .EX_MEM_rs2            (EX_MEM_rs2),
  .EX_MEM_rd             (EX_MEM_rd),
  .EX_MEM_is_load        (EX_MEM_is_load),
  .EX_MEM_is_store       (EX_MEM_is_store),
  .EX_MEM_is_jalr        (EX_MEM_is_jalr),
  .EX_MEM_is_jal         (EX_MEM_is_jal),
  .EX_MEM_is_sys         (EX_MEM_is_sys),
  .EX_MEM_csr_data       (EX_MEM_csr_data),
  .PC_next               (PC_next),
  .branch_taken          (branch_taken),
  .branch_cond_taken     (branch_cond_taken),
  .forward_rs1_L_1       (forward_rs1_L_1),
  .forward_rs1_L_2       (forward_rs1_L_2),
  .forward_rs1_L_1_datai (forward_rs1_L_1_datai),
  .forward_rs1_L_2_datai (forward_rs1_L_2_datai)
);

//====================================================================================
// 4. Memory Stage: Data Memory Access
//====================================================================================
wire [31:0] MEM_WB_pc;    // PC to writeback stage
wire [31:0] MEM_WB_inst;  // Instruction to writeback stage
wire [31:0] MEM_WB_alu;   // ALU result to writeback stage
wire [ 4:0] MEM_WB_rd;    // Destination register to writeback stage
wire [31:0] MEM_WB_data;  // Data to writeback stage

memory mymemory (
  .CLK                   (HCLK),
  .HRDATA_D              (HRDATA_D),
  .HREADY_D              (HREADY_D),
  .HRESP_D               (HRESP_D),
  .EX_MEM_pc             (EX_MEM_pc),
  .EX_MEM_inst           (EX_MEM_inst),
  .EX_MEM_alu            (EX_MEM_alu),
  .EX_MEM_rs2            (EX_MEM_rs2),
  .EX_MEM_rd             (EX_MEM_rd),
  .EX_MEM_is_load        (EX_MEM_is_load),
  .EX_MEM_is_store       (EX_MEM_is_store),
  .EX_MEM_is_sys         (EX_MEM_is_sys),
  .EX_MEM_csr_data       (EX_MEM_csr_data),
  .forward_rs1_L_1       (forward_rs1_L_1),
  .forward_rs1_L_2       (forward_rs1_L_2),
  .forward_rs1_L_1_datai (forward_rs1_L_1_datai),
  .forward_rs1_L_2_datai (forward_rs1_L_2_datai),

  .MEM_WB_pc             (MEM_WB_pc),
  .MEM_WB_inst           (MEM_WB_inst),
  .MEM_WB_alu            (MEM_WB_alu),
  .MEM_WB_rd             (MEM_WB_rd),
  .MEM_WB_data           (MEM_WB_data),
  .HADDR_D               (HADDR_D),
  .HWDATA_D              (HWDATA_D),
  .HWRITE_D              (HWRITE_D),
  .HSIZE_D               (HSIZE_D),
  .HBURST_D              (HBURST_D),
  .HTRANS_D              (HTRANS_D),
  .HMASTLOCK_D           (HMASTLOCK_D),
  .HPROT_D               (HPROT_D),
  .load_data             (load_data)
);

//====================================================================================
// 5. Writeback Stage: Register Write Back
//====================================================================================
wire [31:0] REGS_MEM_WB_rd;  // Data to write to register file

writeback mywriteback (
  .CLK           (HCLK),
  .RES           (HRESETn),
  .MEM_WB_pc     (MEM_WB_pc),
  .MEM_WB_inst   (MEM_WB_inst),
  .MEM_WB_alu    (MEM_WB_alu),
  .MEM_WB_rd     (MEM_WB_rd),
  .MEM_WB_data   (MEM_WB_data),

  .REGS_MEM_WB_rd(REGS_MEM_WB_rd)
);

// Export register x31 for external display
assign REGS_X31 = REGS[31];

// Register file write back
always @(negedge HCLK) begin
  if (HRESETn && MEM_WB_rd != 0) begin
    case (MEM_WB_inst[6:0])
      `LUI:   REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
      `AUIPC: REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
      `JAL:   REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
      `JALR:  REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
      `LCC:   REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
      `RCC:   REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
      `MCC:   REGS[MEM_WB_rd] = REGS_MEM_WB_rd;
    endcase
  end
end
endmodule