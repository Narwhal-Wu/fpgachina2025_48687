`timescale 1ns / 1ps
//========================================
// 1. Fetch阶段：指令预取与PC管理
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

// AHB传输类型定义
`define HTRANS_IDLE    2'b00
`define HTRANS_BUSY    2'b01
`define HTRANS_NONSEQ  2'b10
`define HTRANS_SEQ     2'b11

// AHB突发类型定义
`define HBURST_SINGLE  3'b000
`define HBURST_INCR    3'b001
`define HBURST_WRAP4   3'b010
`define HBURST_INCR4   3'b011
`define HBURST_WRAP8   3'b100
`define HBURST_INCR8   3'b101
`define HBURST_WRAP16  3'b110
`define HBURST_INCR16  3'b111

// AHB传输大小定义
`define HSIZE_BYTE     3'b000
`define HSIZE_HALFWORD 3'b001
`define HSIZE_WORD     3'b010

// AHB保护控制定义
`define HPROT_OPCODE   4'b0011  // 指令取指，特权模式

module fetch (
    input         CLK,
    input         RES,
    input  [31:0] HRDATA_I,        // AHB读数据（指令）
    input         HREADY_I,        // AHB传输完成（指令）
    input         HRESP_I,         // AHB响应（指令）
    input  [31:0] PC_next,
    input         branch_taken,
    input         Load_bubble,
    
    output [31:0] PC,
    output [31:0] HADDR_I,         // AHB地址（指令）
    output        HWRITE_I,        // AHB写使能（指令，应为0）
    output [2:0]  HSIZE_I,         // AHB传输大小（指令）
    output [2:0]  HBURST_I,        // AHB突发类型（指令）
    output [1:0]  HTRANS_I,        // AHB传输类型（指令）
    output        HMASTLOCK_I,     // AHB主设备锁定（指令）
    output [31:0] HWDATA_I,        // AHB写数据（指令）
    output [3:0]  HPROT_I,         // AHB保护控制（指令）
    output [31:0] IF_ID_pc,
    output [31:0] IF_ID_inst
);

reg [31:0] pc; 
reg [31:0] if_id_pc; 
reg [31:0] if_id_inst; 

// AHB控制信号
assign PC           = pc;
assign HADDR_I      = pc;
assign HWRITE_I     = 1'b0;               // 指令接口总是读操作
assign HSIZE_I      = `HSIZE_WORD;        // 总是字传输
assign HBURST_I     = `HBURST_SINGLE;     // 单次传输
assign HMASTLOCK_I  = 1'b0;               // 不锁定总线
assign HWDATA_I     = 32'b0;              // 指令接口不写数据
assign HPROT_I      = `HPROT_OPCODE;      // 指令取指，特权模式
assign IF_ID_pc     = if_id_pc;
assign IF_ID_inst   = if_id_inst;

// 判断是否需要有效传输
wire valid_trans = RES && !branch_taken && !Load_bubble;

// HTRANS信号生成
assign HTRANS_I = (valid_trans) ? `HTRANS_NONSEQ : `HTRANS_IDLE;

// trmporary fix for HWDATA_I
  reg [31:0] HWDATA_I_reg;
  reg last_bubble; //used to active HWDATA_I_reg to deal with the bubble

  always @(posedge CLK or negedge RES) begin
      if(!RES) begin
          HWDATA_I_reg <= 32'b0;
      end else begin
          HWDATA_I_reg <= HRDATA_I;
      end
  end
// trmporary fix for HWDATA_I
always @(posedge CLK) begin
    if (!RES) begin          // 当产生复位信号时，刷新所有pc和指令
        pc           <= 32'd0;
        if_id_pc     <= 32'd0;
        if_id_inst   <= 32'd0;
        last_bubble  <= 1'b0;
    end 
    else begin              // 每一个周期更新当前fetch阶段的pc和decode阶段的pc
        if_id_pc <= PC;     // 当有跳转信号时，进行流水线的冲刷，否则fetch阶段正常取值
        
        // 只有在HREADY_I为高时更新PC和指令
        if (HREADY_I) begin
            if (branch_taken) begin
                // 分支跳转时，PC更新为跳转目标，指令置为气泡
                pc <= PC_next;
                if_id_inst <= 32'd0;
            end else if (Load_bubble) begin
                // 加载气泡时，保持PC，指令置为气泡
                if_id_inst <= 32'd0;
                last_bubble <= 1'b1;
            end else if (last_bubble) begin
                // 处理上一个周期的气泡，保持PC，指令更新为上一个周期的读数据
                if_id_inst <= HWDATA_I_reg;
                last_bubble <= 1'b0;
            end else if (valid_trans) begin
                // 正常指令获取
                pc <= PC_next;
                if_id_inst <= HRDATA_I;
            end 
            else begin
                // 无有效请求，保持当前状态
                if_id_inst <= if_id_inst;
            end
        end else begin
            // HREADY_I为低，保持所有状态
            pc <= pc;
            if_id_inst <= if_id_inst;
        end
    end    
end
endmodule