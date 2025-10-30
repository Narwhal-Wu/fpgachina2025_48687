// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Oct 30 19:52:53 2025
// Host        : lsh running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {c:/Users/lsh/Desktop/qiansai/OpenRV/LibreCore/workshop/assemble
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
