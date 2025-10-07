`timescale 1ns / 1ps
//====================================================================================
//根据RV32I指令集，定义每一种opcode
//====================================================================================
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

//====================================================================================
module myCPU (
  //AHB全局信号
  input             HCLK,                //AHB时钟信号
  input             HRESETn,             //AHB复位（低有效）
  
  //AHB指令接口
  input      [31:0] HRDATA_I,            // AHB读数据（指令）
  input             HREADY_I,            // AHB传输完成（指令）
  input             HRESP_I,             // AHB响应（指令）
  output     [31:0] HADDR_I,             // AHB地址（指令）
  output            HWRITE_I,            // AHB写使能（指令，应为0）
  output     [2:0]  HSIZE_I,             // AHB传输大小（指令）
  output     [2:0]  HBURST_I,            // AHB突发类型（指令）
  output     [1:0]  HTRANS_I,            // AHB传输类型（指令）
  output            HMASTLOCK_I,         // AHB主设备锁定（指令）
  output     [31:0] HWDATA_I,            // AHB写数据（指令）
  output     [3:0]  HPROT_I,             // AHB保护控制（指令）
  
  //AHB数据接口
  input      [31:0] HRDATA_D,            // AHB读数据（数据）
  input             HREADY_D,            // AHB传输完成（数据）
  input             HRESP_D,             // AHB响应（数据）
  output     [31:0] HADDR_D,             // AHB地址（数据）
  output     [31:0] HWDATA_D,            // AHB写数据（数据）
  output            HWRITE_D,            // AHB写使能（数据）
  output     [2:0]  HSIZE_D,             // AHB传输大小（数据）
  output     [2:0]  HBURST_D,            // AHB突发类型（数据）
  output     [1:0]  HTRANS_D,            // AHB传输类型（数据）
  output            HMASTLOCK_D,         // AHB主设备锁定（数据）
  output     [3:0]  HPROT_D              // AHB保护控制（数据）
);

//====================================================================================
// 1. Fetch阶段：指令预取与PC管理
//==================================================================================== 
wire [31:0] PC;             //当前PC——fetch阶段的pc
wire [31:0] PC_next;        //下一条PC
wire [31:0] IF_ID_pc;       //存入IF-ID流水线的pc——decode阶段的pc
wire [31:0] IF_ID_inst;     //存入IF-ID流水线的指令——decode阶段的指令
wire        branch_taken;   //跳转标识
wire        Load_bubble;

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
// 2. Decode阶段：寄存器读取与指令译码
//====================================================================================
wire [31:0] ID_EX_pc;       //存入ID-EX流水线的pc——decode阶段的pc
wire [31:0] ID_EX_inst;     //存入ID-EX流水线的指令——decode阶段的指令
wire [31:0] ID_EX_rs1;      //存入ID-EX流水线的rs1的值
wire [31:0] ID_EX_rs2;      //存入ID-EX流水线的rs2的值
wire [ 4:0] ID_EX_rd;       //存入ID-EX流水线的rd的地址
wire [31:0] ID_EX_imm;      //存入ID-EX流水线的立即数
wire [31:0] ID_EX_alu;      //返回ID-EX流水线的alu模块计算结果——数据前推需要
wire        ID_EX_is_jalr;  //存入ID-EX流水线的JALR标志
wire        ID_EX_is_jal;   //存入ID-EX流水线的JAL标志
wire        ID_EX_is_sys;   //存入ID-EX流水线的SYS标志
wire        ID_EX_is_branch;//存入ID-EX流水线的跳转标志
wire [31:0] load_data;

reg  [31:0] REGS [31:0];    //cpu内部的file register
integer i;
initial for (i = 0; i != 32; i = i + 1) REGS[i] = 0;//初始化

reg  [31:0] rs1;
reg  [31:0] rs2;
always @(*) begin
  rs1 = REGS[IF_ID_inst[19:15]];
  rs2 = REGS[IF_ID_inst[24:20]];
end                             //取出当前指令对应的rs1和rs2的地址

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
  .Load_bubble    (Load_bubble)
);

//====================================================================================
// 3. Execute阶段：运算与跳转
//====================================================================================
wire [31:0] EX_MEM_pc;            //存入EX-MEM流水线的pc——execute阶段的pc
wire [31:0] EX_MEM_inst;          //存入EX-MEM流水线的指令——execute阶段的指令
wire [31:0] EX_MEM_alu;           //存入EX-MEM流水线的alu模块计算结果
wire [31:0] EX_MEM_rs2;           //存入EX-MEM流水线的rs2的值
wire [ 4:0] EX_MEM_rd;            //存入EX-MEM流水线的rd的地址
wire        EX_MEM_is_load;       //存入EX-MEM流水线的读取标志
wire        EX_MEM_is_store;      //存入EX-MEM流水线的写入标志
wire        EX_MEM_is_jalr;       //存入EX-MEM流水线的JALR标志
wire        EX_MEM_is_jal;        //存入EX-MEM流水线的JAL标志
wire        EX_MEM_is_sys;        //存入EX-MEM流水线的SYS标志
wire [31:0] EX_MEM_csr_data;      //存入EX-MEM流水线的系统指令的值
wire        branch_cond_taken;    //存入EX-MEM流水线的b型指令判断成功标志
wire        forward_rs1_L_1;      //数据前推信号-与读写有关的情况-一级标志
wire        forward_rs1_L_2;      //数据前推信号-与读写有关的情况-二级标志
wire [31:0] forward_rs1_L_1_datai;//数据前推信号-与读写有关的情况-一级数据
wire [31:0] forward_rs1_L_2_datai;//数据前推信号-与读写有关的情况-二级数据

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
// 4. Memory阶段：数据访问
//====================================================================================
wire [31:0] MEM_WB_pc;  //存入MEM-WB流水线的pc——memory阶段的pc
wire [31:0] MEM_WB_inst;//存入MEM-WB流水线的指令——memory阶段的指令
wire [31:0] MEM_WB_alu; //存入MEM-WB流水线的alu模块计算结果
wire [ 4:0] MEM_WB_rd;  //存入MEM-WB流水线的rd的地址
wire [31:0] MEM_WB_data;//存入MEM-WB流水线的写回数据

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
// 5. Writeback阶段：寄存器写回
//====================================================================================
wire [31:0] REGS_MEM_WB_rd;

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

//根据指令写回file register
always @(*) begin
  if (!HRESETn && MEM_WB_rd != 0) begin
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