`timescale 1ns / 1ps
//========================================
// 3. Execute阶段：运算与跳转
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

module execute (
    input         CLK,
    input         RES,
    input  [31:0] ID_EX_pc,
    input  [31:0] ID_EX_inst,
    input  [31:0] ID_EX_rs1,
    input  [31:0] ID_EX_rs2,
    input  [4:0]  ID_EX_rd,
    input  [31:0] ID_EX_imm,
    input         ID_EX_is_jal,
    input         ID_EX_is_jalr,
    input         ID_EX_is_sys,
    input         ID_EX_is_branch,
    input  [31:0] PC,
    input  [31:0] HRDATA_D,
    input  [31:0] MEM_WB_inst,
    input         Load_bubble,

    output [31:0] ID_EX_alu,
    output [31:0] EX_MEM_pc,
    output [31:0] EX_MEM_inst,
    output [31:0] EX_MEM_alu,
    output [31:0] EX_MEM_rs2,
    output [4:0]  EX_MEM_rd,
    output        EX_MEM_is_load,
    output        EX_MEM_is_store,
    output        EX_MEM_is_jalr,
    output        EX_MEM_is_jal,
    output        EX_MEM_is_sys,
    output [31:0] EX_MEM_csr_data,
    output [31:0] PC_next,
    output        branch_taken,
    output        branch_cond_taken,
    output        forward_rs1_L_1,
    output        forward_rs1_L_2,
    output [31:0] forward_rs1_L_1_datai,
    output [31:0] forward_rs1_L_2_datai
);
    
reg [31:0] ex_mem_inst;   
reg [31:0] ex_mem_alu;    
reg [31:0] ex_mem_rs2;    
reg [4:0]  ex_mem_rd;
reg [31:0] ex_mem_pc;
reg        ex_mem_is_load;
reg        ex_mem_is_store;
reg        ex_mem_is_jalr;
reg        ex_mem_is_jal;
reg [31:0] ex_mem_csr_data;
reg [31:0] pc_next;
reg        branch_taken_reg;

assign ID_EX_alu             = alu_result;
assign EX_MEM_pc             = ex_mem_pc;
assign EX_MEM_inst           = ex_mem_inst;
assign EX_MEM_alu            = ex_mem_alu;
assign EX_MEM_rs2            = ex_mem_rs2;
assign EX_MEM_rd             = ex_mem_rd;
assign EX_MEM_is_load        = ex_mem_is_load;
assign EX_MEM_is_store       = ex_mem_is_store;
assign EX_MEM_is_jalr        = ex_mem_is_jalr;
assign EX_MEM_is_jal         = ex_mem_is_jal;
assign EX_MEM_is_sys         = ID_EX_is_sys;
assign EX_MEM_csr_data       = ex_mem_csr_data;
assign PC_next               = pc_next;
assign branch_taken          = branch_taken_reg;
assign forward_rs1_L_1       = forward_rs1_l_1;
assign forward_rs1_L_2       = forward_rs1_l_2;
assign forward_rs1_L_1_datai = forward_rs1_l_1_datai;
assign forward_rs1_L_2_datai = forward_rs1_l_2_datai;

//ALU操作
wire [31:0] alu_in1 = forward_rs1_l_1 ? forward_rs1_l_1_datai : forward_rs1_l_2 ? forward_rs1_l_2_datai : ID_EX_rs1;
wire [31:0] alu_in2 = (ID_EX_inst[6:0] == `MCC   || 
                       ID_EX_inst[6:0] == `LUI   || 
                       ID_EX_inst[6:0] == `AUIPC || 
                       ID_EX_inst[6:0] == `SCC   || 
                       ID_EX_inst[6:0] == `LCC   ||
                       ID_EX_inst[6:0] == `JALR) ? ID_EX_imm : ID_EX_rs2;
reg [31:0] alu_result;
wire is_sub = ((ID_EX_inst[31:25] == 7'b0100000)&&(ID_EX_inst[6:0] == `RCC));

always @(*) begin
    if (ID_EX_inst != 0) begin
        case (ID_EX_inst[14:12])
            3'b000: alu_result = is_sub ? (alu_in1 - alu_in2) : (alu_in1 + alu_in2);
            3'b001: alu_result = alu_in1 << alu_in2[4:0];
            3'b010: alu_result = $signed(alu_in1) < $signed(alu_in2);
            3'b011: alu_result = alu_in1 < alu_in2;
            3'b100: alu_result = alu_in1 ^ alu_in2;
            3'b101: alu_result = ID_EX_inst[30] ? ({{32{alu_in1[31]}}, alu_in1} >> alu_in2[4:0]) : (alu_in1 >> alu_in2[4:0]);
            3'b110: alu_result = alu_in1 | alu_in2;
            3'b111: alu_result = alu_in1 & alu_in2;
        endcase
    end
    if (ID_EX_inst[6:0] == `LUI) alu_result = alu_in2;
    if (ID_EX_inst[6:0] == `AUIPC) alu_result = ID_EX_pc + alu_in2;
    if ((ID_EX_inst[6:0] == `SCC) || (ID_EX_inst[6:0] == `LCC)) alu_result = alu_in1 + alu_in2;
end

//b型分支条件判断
wire beq_taken  = (forward_rs1_l_1 || forward_rs1_l_2) ? (alu_in1 == ID_EX_rs2) : (ID_EX_rs1 == ID_EX_rs2);
wire bne_taken  = (forward_rs1_l_1 || forward_rs1_l_2) ? (alu_in1 != ID_EX_rs2) : (ID_EX_rs1 != ID_EX_rs2);
wire blt_taken  = (forward_rs1_l_1 || forward_rs1_l_2) ? ($signed(alu_in1) <  $signed(ID_EX_rs2)) : ($signed(ID_EX_rs1) <  $signed(ID_EX_rs2));
wire bge_taken  = (forward_rs1_l_1 || forward_rs1_l_2) ? ($signed(alu_in1) >=  $signed(ID_EX_rs2)) : ($signed(ID_EX_rs1) >= $signed(ID_EX_rs2));
wire bltu_taken = (forward_rs1_l_1 || forward_rs1_l_2) ? (alu_in1 < ID_EX_rs2) : (ID_EX_rs1 <  ID_EX_rs2);
wire bgeu_taken = (forward_rs1_l_1 || forward_rs1_l_2) ? (alu_in1 >= ID_EX_rs2) : (ID_EX_rs1 >= ID_EX_rs2);

//综合分支跳转条件
assign branch_cond_taken = 
       ((ID_EX_inst != 0) &&
       ((ID_EX_inst[14:12] == 3'b000 && beq_taken)  ||  
        (ID_EX_inst[14:12] == 3'b001 && bne_taken)  || 
        (ID_EX_inst[14:12] == 3'b100 && blt_taken)  ||  
        (ID_EX_inst[14:12] == 3'b101 && bge_taken)  ||  
        (ID_EX_inst[14:12] == 3'b110 && bltu_taken) || 
        (ID_EX_inst[14:12] == 3'b111 && bgeu_taken)));   

//JALR跳转地址处理
wire [31:0] jalr_target = (alu_in1 + ID_EX_imm); 

//跳转目标地址选择
wire [31:0] branch_target = ID_EX_is_jalr ? jalr_target : (ID_EX_pc + ID_EX_imm);

reg branch_taken_buffer;
reg branch_taken_buffer2;

always @(*) begin
    if ((branch_taken_buffer || branch_taken_buffer2 ) == 1)   branch_taken_reg = 0;
    else branch_taken_reg = (ID_EX_is_jalr || ID_EX_is_jal) || 
                            (ID_EX_is_branch && branch_cond_taken);
end

//系统指令处理
always @(*) begin
    if (ID_EX_is_sys) begin
        case (ID_EX_inst[31:20])
            12'h302: ex_mem_csr_data = 0;
            default: ex_mem_csr_data = 0;
        endcase
    end else begin
        ex_mem_csr_data = 0;
    end
end

//更新pc的逻辑
always @(*) begin
    if(RES) pc_next=32'h8000_0004;
    else pc_next = branch_taken ? branch_target : Load_bubble ? PC : PC + 4;
end

//产生读写数据前推信号的逻辑
reg forward_rs1_l_1,forward_rs1_l_2;
reg [31:0] DATAI_buffer;
reg [31:0] forward_rs1_l_1_datai;
reg [31:0] forward_rs1_l_2_datai;

always @(*) begin
    forward_rs1_l_1 = ((ID_EX_inst[6:0] != `JAL)   && 
                       (ID_EX_inst[6:0] != `LUI)   && 
                       (ID_EX_inst[6:0] != `AUIPC) &&
                       (EX_MEM_inst[6:0] == `LCC)  &&
                       (ID_EX_inst[19:15] == EX_MEM_inst[11:7]));

    forward_rs1_l_2 = ((ID_EX_inst[6:0] != `JAL)   && 
                       (ID_EX_inst[6:0] != `LUI)   && 
                       (ID_EX_inst[6:0] != `AUIPC) &&
                       (MEM_WB_inst[6:0] == `LCC)  &&
                       (ID_EX_inst[19:15] == MEM_WB_inst[11:7]));

    if ((EX_MEM_inst[6:0] == `LCC) && (EX_MEM_inst[14:12] == 3'b000)) forward_rs1_l_1_datai = {{24{HRDATA_D[7]}}, HRDATA_D[7:0]};
    else if ((EX_MEM_inst[6:0] == `LCC) && (EX_MEM_inst[14:12] == 3'b001)) forward_rs1_l_1_datai = {{16{HRDATA_D[15]}}, HRDATA_D[15:0]};
    else if ((EX_MEM_inst[6:0] == `LCC) && (EX_MEM_inst[14:12] == 3'b010)) forward_rs1_l_1_datai = HRDATA_D;
    else if ((EX_MEM_inst[6:0] == `LCC) && (EX_MEM_inst[14:12] == 3'b100)) forward_rs1_l_1_datai = {{24{1'b0}}, HRDATA_D[7:0]};
    else if ((EX_MEM_inst[6:0] == `LCC) && (EX_MEM_inst[14:12] == 3'b101)) forward_rs1_l_1_datai = {{16{1'b0}}, HRDATA_D[15:0]};
    
    if ((MEM_WB_inst[6:0] == `LCC) && (MEM_WB_inst[14:12] == 3'b000)) forward_rs1_l_2_datai = {{24{DATAI_buffer[7]}}, DATAI_buffer[7:0]};
    else if ((MEM_WB_inst[6:0] == `LCC) && (MEM_WB_inst[14:12] == 3'b001)) forward_rs1_l_2_datai = {{16{DATAI_buffer[15]}}, DATAI_buffer[15:0]};
    else if ((MEM_WB_inst[6:0] == `LCC) && (MEM_WB_inst[14:12] == 3'b010)) forward_rs1_l_2_datai = DATAI_buffer;
    else if ((MEM_WB_inst[6:0] == `LCC) && (MEM_WB_inst[14:12] == 3'b100)) forward_rs1_l_2_datai = {{24{1'b0}}, DATAI_buffer[7:0]};
    else if ((MEM_WB_inst[6:0] == `LCC) && (MEM_WB_inst[14:12] == 3'b101)) forward_rs1_l_2_datai = {{16{1'b0}}, DATAI_buffer[15:0]};
end

always @(posedge CLK) begin
    ex_mem_pc       <= ID_EX_pc;
    ex_mem_inst     <= ID_EX_inst;
    ex_mem_alu      <= alu_result;
    ex_mem_rs2      <= ID_EX_rs2;
    ex_mem_rd       <= ID_EX_rd;
    ex_mem_is_load  <= (ID_EX_inst[6:0] == `LCC);
    ex_mem_is_store <= (ID_EX_inst[6:0] == `SCC);
    ex_mem_is_jalr  <= ID_EX_is_jalr;
    ex_mem_is_jal   <= ID_EX_is_jal;

    branch_taken_buffer  <= branch_taken;
    branch_taken_buffer2 <= branch_taken_buffer;

    DATAI_buffer <= HRDATA_D;
end
endmodule