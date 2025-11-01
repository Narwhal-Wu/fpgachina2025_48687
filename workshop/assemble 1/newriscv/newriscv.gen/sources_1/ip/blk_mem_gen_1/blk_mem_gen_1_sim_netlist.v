// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Nov  1 17:03:46 2025
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
