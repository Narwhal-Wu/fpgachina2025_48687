`timescale 1ns / 1ps
//========================================
// 4. Memory阶段：数据访问
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

// AHB传输大小定义
`define HSIZE_BYTE     3'b000
`define HSIZE_HALFWORD 3'b001
`define HSIZE_WORD     3'b010

// AHB保护控制定义
`define HPROT_DATA     4'b0001  // 数据访问，特权模式

module memory (
    input         CLK,
    input  [31:0] HRDATA_D,                // AHB读数据（数据）
    input         HREADY_D,                // AHB传输完成（数据）
    input         HRESP_D,                 // AHB响应（数据）
    input  [31:0] EX_MEM_pc,
    input  [31:0] EX_MEM_inst,
    input  [31:0] EX_MEM_alu,
    input  [31:0] EX_MEM_rs2,
    input  [4:0]  EX_MEM_rd,
    input         EX_MEM_is_load,
    input         EX_MEM_is_store,
    input         EX_MEM_is_sys,
    input  [31:0] EX_MEM_csr_data,
    input         forward_rs1_L_1,
    input         forward_rs1_L_2,
    input  [31:0] forward_rs1_L_1_datai,
    input  [31:0] forward_rs1_L_2_datai,

    output [31:0] MEM_WB_pc,
    output [31:0] MEM_WB_inst,
    output [31:0] MEM_WB_alu,
    output [4:0]  MEM_WB_rd,
    output [31:0] MEM_WB_data,   
    output [31:0] HADDR_D,                 // AHB地址（数据）
    output [31:0] HWDATA_D,                // AHB写数据（数据）
    output        HWRITE_D,                // AHB写使能（数据）
    output [2:0]  HSIZE_D,                 // AHB传输大小（数据）
    output [2:0]  HBURST_D,                // AHB突发类型（数据）
    output [1:0]  HTRANS_D,                // AHB传输类型（数据）
    output        HMASTLOCK_D,             // AHB主设备锁定（数据）
    output [3:0]  HPROT_D,                 // AHB保护控制（数据）
    output [31:0] load_data
);

reg [31:0] mem_wb_pc;
reg [31:0] mem_wb_inst; 
reg [31:0] mem_wb_alu;
reg [4:0]  mem_wb_rd;
reg [31:0] mem_wb_data;   

// AHB控制信号
assign MEM_WB_pc     = mem_wb_pc;
assign MEM_WB_inst   = mem_wb_inst;
assign MEM_WB_alu    = mem_wb_alu;
assign MEM_WB_rd     = mem_wb_rd;
assign MEM_WB_data   = mem_wb_data;
assign HADDR_D       = EX_MEM_alu;
assign HWDATA_D      = EX_MEM_rs2;
assign HWRITE_D      = EX_MEM_is_store;
assign HBURST_D      = `HBURST_SINGLE;     // 单次传输
assign HMASTLOCK_D   = 1'b0;               // 不锁定总线
assign HPROT_D       = `HPROT_DATA;        // 数据访问，特权模式

// 传输大小计算
wire [2:0] data_size = (EX_MEM_is_load || EX_MEM_is_store) ? 
                     ((EX_MEM_inst[14:12] == 3'b000 || EX_MEM_inst[14:12] == 3'b100) ? `HSIZE_BYTE :    // LB/LBU
                      (EX_MEM_inst[14:12] == 3'b001 || EX_MEM_inst[14:12] == 3'b101) ? `HSIZE_HALFWORD : // LH/LHU
                                                                                       `HSIZE_WORD       // LW
                                                                                   ) : `HSIZE_WORD;
assign HSIZE_D = data_size;

// 判断是否需要有效传输
wire valid_trans = EX_MEM_is_load || EX_MEM_is_store;

// HTRANS信号生成
assign HTRANS_D = (valid_trans) ? `HTRANS_NONSEQ : `HTRANS_IDLE;

// 根据读写数据前推情况确定读写的写回数据
assign load_data = (forward_rs1_L_1 && (EX_MEM_inst[14:12] == 3'b100 || EX_MEM_inst[14:12] == 3'b101)) ? 
                   ((data_size == `HSIZE_BYTE) ? {{24{1'b0}}, forward_rs1_L_1_datai[7:0]} : 
                    (data_size == `HSIZE_HALFWORD) ? {{16{1'b0}}, forward_rs1_L_1_datai[15:0]} : 
                    forward_rs1_L_1_datai) :
                   (forward_rs1_L_2 && (EX_MEM_inst[14:12] == 3'b100 || EX_MEM_inst[14:12] == 3'b101)) ? 
                   ((data_size == `HSIZE_BYTE) ? {{24{1'b0}}, forward_rs1_L_2_datai[7:0]} : 
                    (data_size == `HSIZE_HALFWORD) ? {{16{1'b0}}, forward_rs1_L_2_datai[15:0]} : 
                    forward_rs1_L_2_datai) :
                   (EX_MEM_inst[14:12] == 3'b100 || EX_MEM_inst[14:12] == 3'b101) ? 
                   ((data_size == `HSIZE_BYTE) ? {{24{1'b0}}, HRDATA_D[7:0]} :
                    (data_size == `HSIZE_HALFWORD) ? {{16{1'b0}}, HRDATA_D[15:0]} : 
                    HRDATA_D) :
                   forward_rs1_L_1 ? 
                   ((data_size == `HSIZE_BYTE) ? {{24{forward_rs1_L_1_datai[7]}}, forward_rs1_L_1_datai[7:0]} :
                    (data_size == `HSIZE_HALFWORD) ? {{16{forward_rs1_L_1_datai[15]}}, forward_rs1_L_1_datai[15:0]} : 
                    forward_rs1_L_1_datai) :
                   forward_rs1_L_2 ? 
                   ((data_size == `HSIZE_BYTE) ? {{24{forward_rs1_L_2_datai[7]}}, forward_rs1_L_2_datai[7:0]} :
                    (data_size == `HSIZE_HALFWORD) ? {{16{forward_rs1_L_2_datai[15]}}, forward_rs1_L_2_datai[15:0]} : 
                    forward_rs1_L_2_datai) :
                   ((data_size == `HSIZE_BYTE) ? {{24{HRDATA_D[7]}}, HRDATA_D[7:0]} :
                    (data_size == `HSIZE_HALFWORD) ? {{16{HRDATA_D[15]}}, HRDATA_D[15:0]} : 
                    HRDATA_D);

always @(posedge CLK) begin
    // 只有在HREADY_D为高时更新流水线寄存器
    if (HREADY_D) begin
        mem_wb_pc   <= EX_MEM_pc;
        mem_wb_inst <= EX_MEM_inst;
        mem_wb_alu  <= EX_MEM_alu;
        mem_wb_rd   <= EX_MEM_rd;
        
        // 根据操作类型选择写回数据
        if (EX_MEM_is_load) begin
            mem_wb_data <= load_data;
        end else if (EX_MEM_is_sys) begin
            mem_wb_data <= EX_MEM_csr_data;
        end else begin
            mem_wb_data <= EX_MEM_alu;
        end
    end else begin
        // HREADY_D为低，保持当前状态
        mem_wb_pc   <= mem_wb_pc;
        mem_wb_inst <= mem_wb_inst;
        mem_wb_alu  <= mem_wb_alu;
        mem_wb_rd   <= mem_wb_rd;
        mem_wb_data <= mem_wb_data;
    end
end
endmodule