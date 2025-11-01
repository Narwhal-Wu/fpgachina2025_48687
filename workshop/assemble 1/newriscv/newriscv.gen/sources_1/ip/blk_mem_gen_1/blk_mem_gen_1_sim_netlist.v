// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Nov  1 16:41:50 2025
// Host        : LAPTOP-FB6BI1PT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/inbed/LibreCore/workshop/assemble
//               1/newriscv/newriscv.gen/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_sim_netlist.v}
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_1,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_1
   (clka,
    ena,
    addra,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
  wire clka;
  wire [31:0]douta;
  wire ena;
  wire NLW_U0_dbiterr_UNCONNECTED;
  wire NLW_U0_rsta_busy_UNCONNECTED;
  wire NLW_U0_rstb_busy_UNCONNECTED;
  wire NLW_U0_s_axi_arready_UNCONNECTED;
  wire NLW_U0_s_axi_awready_UNCONNECTED;
  wire NLW_U0_s_axi_bvalid_UNCONNECTED;
  wire NLW_U0_s_axi_dbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_rlast_UNCONNECTED;
  wire NLW_U0_s_axi_rvalid_UNCONNECTED;
  wire NLW_U0_s_axi_sbiterr_UNCONNECTED;
  wire NLW_U0_s_axi_wready_UNCONNECTED;
  wire NLW_U0_sbiterr_UNCONNECTED;
  wire [31:0]NLW_U0_doutb_UNCONNECTED;
  wire [9:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [9:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "10" *) 
  (* C_ADDRB_WIDTH = "10" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "0" *) 
  (* C_COUNT_36K_BRAM = "1" *) 
  (* C_CTRL_ECC_ALGO = "NONE" *) 
  (* C_DEFAULT_DATA = "0" *) 
  (* C_DISABLE_WARN_BHV_COLL = "0" *) 
  (* C_DISABLE_WARN_BHV_RANGE = "0" *) 
  (* C_ELABORATION_DIR = "./" *) 
  (* C_ENABLE_32BIT_ADDRESS = "0" *) 
  (* C_EN_DEEPSLEEP_PIN = "0" *) 
  (* C_EN_ECC_PIPE = "0" *) 
  (* C_EN_RDADDRA_CHG = "0" *) 
  (* C_EN_RDADDRB_CHG = "0" *) 
  (* C_EN_SAFETY_CKT = "0" *) 
  (* C_EN_SHUTDOWN_PIN = "0" *) 
  (* C_EN_SLEEP_PIN = "0" *) 
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.622 mW" *) 
  (* C_FAMILY = "artix7" *) 
  (* C_HAS_AXI_ID = "0" *) 
  (* C_HAS_ENA = "1" *) 
  (* C_HAS_ENB = "0" *) 
  (* C_HAS_INJECTERR = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MEM_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_A = "0" *) 
  (* C_HAS_MUX_OUTPUT_REGS_B = "0" *) 
  (* C_HAS_REGCEA = "0" *) 
  (* C_HAS_REGCEB = "0" *) 
  (* C_HAS_RSTA = "0" *) 
  (* C_HAS_RSTB = "0" *) 
  (* C_HAS_SOFTECC_INPUT_REGS_A = "0" *) 
  (* C_HAS_SOFTECC_OUTPUT_REGS_B = "0" *) 
  (* C_INITA_VAL = "0" *) 
  (* C_INITB_VAL = "0" *) 
  (* C_INIT_FILE = "blk_mem_gen_1.mem" *) 
  (* C_INIT_FILE_NAME = "blk_mem_gen_1.mif" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "1" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "1024" *) 
  (* C_READ_DEPTH_B = "1024" *) 
  (* C_READ_LATENCY_A = "1" *) 
  (* C_READ_LATENCY_B = "1" *) 
  (* C_READ_WIDTH_A = "32" *) 
  (* C_READ_WIDTH_B = "32" *) 
  (* C_RSTRAM_A = "0" *) 
  (* C_RSTRAM_B = "0" *) 
  (* C_RST_PRIORITY_A = "CE" *) 
  (* C_RST_PRIORITY_B = "CE" *) 
  (* C_SIM_COLLISION_CHECK = "ALL" *) 
  (* C_USE_BRAM_BLOCK = "0" *) 
  (* C_USE_BYTE_WEA = "0" *) 
  (* C_USE_BYTE_WEB = "0" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "1" *) 
  (* C_WEB_WIDTH = "1" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_1_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[9:0]),
        .regcea(1'b0),
        .regceb(1'b0),
        .rsta(1'b0),
        .rsta_busy(NLW_U0_rsta_busy_UNCONNECTED),
        .rstb(1'b0),
        .rstb_busy(NLW_U0_rstb_busy_UNCONNECTED),
        .s_aclk(1'b0),
        .s_aresetn(1'b0),
        .s_axi_araddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arburst({1'b0,1'b0}),
        .s_axi_arid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_arready(NLW_U0_s_axi_arready_UNCONNECTED),
        .s_axi_arsize({1'b0,1'b0,1'b0}),
        .s_axi_arvalid(1'b0),
        .s_axi_awaddr({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awburst({1'b0,1'b0}),
        .s_axi_awid({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awlen({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_awready(NLW_U0_s_axi_awready_UNCONNECTED),
        .s_axi_awsize({1'b0,1'b0,1'b0}),
        .s_axi_awvalid(1'b0),
        .s_axi_bid(NLW_U0_s_axi_bid_UNCONNECTED[3:0]),
        .s_axi_bready(1'b0),
        .s_axi_bresp(NLW_U0_s_axi_bresp_UNCONNECTED[1:0]),
        .s_axi_bvalid(NLW_U0_s_axi_bvalid_UNCONNECTED),
        .s_axi_dbiterr(NLW_U0_s_axi_dbiterr_UNCONNECTED),
        .s_axi_injectdbiterr(1'b0),
        .s_axi_injectsbiterr(1'b0),
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[9:0]),
        .s_axi_rdata(NLW_U0_s_axi_rdata_UNCONNECTED[31:0]),
        .s_axi_rid(NLW_U0_s_axi_rid_UNCONNECTED[3:0]),
        .s_axi_rlast(NLW_U0_s_axi_rlast_UNCONNECTED),
        .s_axi_rready(1'b0),
        .s_axi_rresp(NLW_U0_s_axi_rresp_UNCONNECTED[1:0]),
        .s_axi_rvalid(NLW_U0_s_axi_rvalid_UNCONNECTED),
        .s_axi_sbiterr(NLW_U0_s_axi_sbiterr_UNCONNECTED),
        .s_axi_wdata({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wlast(1'b0),
        .s_axi_wready(NLW_U0_s_axi_wready_UNCONNECTED),
        .s_axi_wstrb(1'b0),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(1'b0),
        .web(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2023.2"
`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
jLV29U0rrfMIZhYJzdoUrPoqB9eHQ5NXmWyCdqnN3Wgm+GU4C3zthrN1m4QGiaj0thPCIynZbX+0
7yjtkv+T5ByJ6NhiofAwWseGLvPXlYu6ERAPvi4SAYpF2VUqQHtPAbPmnPubGdDRgIEpeobF7hsz
rEcpEru1pyiScUriyuo=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
vsoizVrOONWw/DhjRLEYrtRmtji+Ok63CbpSg/l9VnoKAi8tAzqRbQ57atGB2N6IGGbKHkbK2Uzh
EHgWvYZeyt4hE+bpQX91vc9PNxfjQMGzPoFD3jCWk30EmEk+AND39eWx+DhJ8xhFuucoOQ2GwyAk
B+Mjs15naPE7DvlHel8hnD4dfSdYhGKp96oozu8JeBto8aHG6poOuYkxSwaut7NCI+mabCkMxtMp
RrydgmRuTvhRTbJMyx5CxFSZTRDrS5aU1vaRlnMiqKCI7g2KY9pemYaJsFeVodBuo6IyKGynyEhs
wr+VtUhQDtaVhMkwB95WwmMoDk9F2L5Au1I+TQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
W081dPMCWhKs5YlQD7n3zvf7+PTcnb8eFWxoVs8+zHLkxDMA1klITbsfztGYvJFce8Yao5XQLLqZ
oUE5Pq2arq+zwICFUcLjdMsmP1WmL82znHOPHm83zNwrxWMloHkySAqzFbgJeHa973uZqj0M8ydc
sYmzCYVlGVjt0QX0xqA=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Zpc3MmdLWaVOv+S4z2POuoyslYoAbWc+Npxq2UyQRtDwf566IId3uwAetolMAgfLo/G3ezuSOXMn
8NznS37h9XvmVrxA50SAux68P87WgkLtiUYqM3CMBKkxNlZ/TR8WzTuQyFdvzkOE9lp8HC7LXnk5
RDsnOM+su46FW7ysY01COslo9Xc7rhs6WFqx29+Xcqk8+ZMLSzaJfuwZdNmJFS3Q1vhlq3ZeYqMl
wMieB731KsPxjxp7VKNHpTbgFryC2isqc4ohBDOt52M/Bz4B/rIpFeHfZ7X3jWSiKtSuBsDN2NXf
EMjfAT248dlK7NxJ+NBNPhS5sLxTiGyQhta57A==

`pragma protect key_keyowner="Real Intent", key_keyname="RI-RSA-KEY-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
rPMYqnkKhJKV1wltOfDrKos9ZbucaoX3WGTuqsdLkGpcKObzslHBwlGrKtWV7bZYmS2SM+QuEMfa
CE+tCUdsSiprp+n5BuSQlJa6BJ8mlqccjoo/JLw2QEmUhyMXQ3TLGomGGoZdeTmMPXhUBAOyLPea
Ddc8mgtTN8Kpy117GOTXDKP+IKJqW01fLrPJpgEhFiJCbyElLgtCRWmI94gX+y4XNVS0Cd1YwNw6
4nHgnEdC7fXARDKcYO3VsWC/pdzPQgursXloNLrVYa6i2xr+8E1V0+nSWwNYQZP7XUIVqXKMU8Ea
bT4acXrRCF/5tJJ5B9JparYI0zxXSbaakn1dIw==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2022_10", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
mfroTgL8g2pyIXQ/mGO9YHm19cd5mOlJ++qpusOYeVxGmkIhvF4aKx+AyIUz2yGGAeCtOzIasHty
pyqKgZhibSqxcpHgR0m6GOxXXOXJiHaK8NzxUzXeRJovcBI/WjtDhXeb1LRMI1J97jVBtJPJQH0Y
fGOD7jWvkvQwxnrZdyLp6kPWgSIcavHHDbO7iJv4gnyGp6W3/FCDo2RKWNLoW+SNjSdLZ6YRP8a+
ldaGU8TYvJ03KWlmik7repuN6AwxCjg2KeQ+x1sBAEXzROXomuSbvX3ZAo8UiIKAQY1SJumHLG3L
QI/S4Wbl1Hz6LDTsttMwP480gq6+tb6s1E4oWw==

`pragma protect key_keyowner="Metrics Technologies Inc.", key_keyname="DSim", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QJIabgm8dx/gVHbOQFwt8maOKVHFgkpZTPR6dzD8fqoGo9M9oGPTqBqchtPZWgv2UYFF2KEUSlV4
L3SDXBKrLs+NsAVTcICaEMiEi6j82zj/C1LsPkQfS8RLrg0ab8lbDMb5YqJ7lkHs3iM65x2iN1Mf
66cTgCbkAdl3rDpab75btpTQt5ZKiq5CSY3RZfyIW0uWbTGTELm6liuRKM9+K8BQwTU7A+FFFQBA
/9eJwQYzNNA/iwoYJ2WTPd6pBlzXriNLu9M+/2bYicNBSuH1PBR9v2ESrTB6k7EiV1zvBXV9NuG/
sFt4MumWMuSNwP2W38bQATxxW/l0IrmaXGOC/w==

`pragma protect key_keyowner="Atrenta", key_keyname="ATR-SG-RSA-1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=384)
`pragma protect key_block
lhKf/Vgj6pHpme1ji4HVe36BU8pMkam/2I9lFeyOiBnIbzgdEGfLJBcEvkL33A7s0hxa6LFbHnkT
upgMpPjmIghBz3xUQ13vpiY152thFec6qvlcdg1r+GTmnBOSFl6g/OfZ3eFUhfsve6ZjQHpXnKFo
a55hN2+eP1EG9+VxGeM7XkHaeFhEIry52qtnmg072KEFIwRiGs2d/TJ4AqupuIdIiP1kTN9k+oqa
2ta1vdtqPY0dDHqrf+5YSd0CejkhQeCqg/bauLP3755SwdOPRgooG5ANT8hUpTiFMFXtU+GC9NSp
evJtMHUy1NbgMmhFHO+w3URLEdjSaBxZPD7YLdWkF65jY526tJzoek+BzEKoBaGfCaY7O1nHKXm+
89k3rPUy0Xo4/0nHpno+N/Db09heJPbnGsCwN/l+KnR6Lz8kvWziBjZe0ijOkKI+T12y3T1VeOtY
H/aqtNlQt1mhFwrbw6ezaAiDPVbCQXnly6b4tbb8+nFsxWOGIGAfLozB

`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="CDS_RSA_KEY_VER_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
PNsQ8uEcQYrl+GaDuBaq1tQ5br5aAdaqHnyrc0NVu/JnQUk53jaiLx8Oz5fNACvWelUUk2/C+P5I
b2rbU1bb/dC6TqC5J1N0yoMYRYw58u4Lrl8Kgqgt9Rlph5Qgzzfxp+oblXF/pO4mRyAXpZhpNkFT
0Ar9BUtPOTOtJ9/g53SRnZ6GjxzfeD+25J4fcXBNo2gCTgUkwiLSsJRwTB/cJmn+dZPwPdIOHEP9
TkfDK+OrbLYO3T+DFBTCMRNH2NB1J9sc5s+nPU8iYnjgPTo6HoGW+LIlCz6yNJMZzJzoeW708utc
0fJXkT7vLDVh7olvy3V9AAY8Do0YR1kiZlhVhQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
zAz8RnGHFebkJFAS+gjC+mXHW7m7We+JgSmIz15mS01u/4+9Ng0sJfkeXOClmVPTQ2Mp2Yuv6/6f
ehzUTcANilWsqLM6Q1FToCPNX/NTqodlcHirGM7b5R9yevouNT/aqH12nmbunBQmBHmehNutdCjG
r6Z7kZgeZ2ZE7MMOF0rTy1XHEPkqgMNTRoS8R/pPWPTW4/j+bn3aJj0Q/fTz4Gi3mbSUKWs2fREQ
UKiuolNJkN6DiDvhlVYHUyytXNJG44ikmBXehoQQRLapkYaxnQmMRT1ok9uY6pKoy71CtvJ3Mt2x
EQv1GU2i4qQyAOwa0mkEohWXduicU6tDz3zQwQ==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TK3eE9V+v1z2P1KjG4GrjhA1n3qDOpNzLGXdtjnjhF0QBFPSuhC+nmNqTPOb3p2a9r5KD0miY3Cd
+KpjH6Ao09E2/LD2Go4aLQh6vP+9BldlSKEwCGfx2NjBQrXWVH21lQR7IRjOvyTOclpd7SgtUJLw
dvebETyLiKr9C6RfnIBeptuCA3iJlXfwkh6I0JfzD5WBizQkotioZmmrXv5105pCXQ4Ta1WThFsA
2ll9dZeSjEDHUxxhfyfjryv9m4VL89ZDU/rGITsdptwB1BC1jLqmPDymY05lyECnjA6NIR5GGfI4
K2y2f4GfikKoN5r9IOvFzw963Wm82ZZPtXOKGg==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27408)
`pragma protect data_block
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
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
