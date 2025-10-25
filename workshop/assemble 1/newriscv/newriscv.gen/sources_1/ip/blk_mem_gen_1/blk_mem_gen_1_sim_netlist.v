// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Oct 25 21:16:21 2025
// Host        : LAPTOP-N8FCCN37 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/M/nk/verilog/openRV/myq/LibreCore/workshop/assemble
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
MLBaqHQ4ekU76Awb3vc5xFGMOcfx51jLbnb3oBP21vpaH6PKTuXX/Q6RncZM+b5mPhrR/dt3tcVw
A7PcQH295xEvn9His9OVEMuVe4Ag3HclJvmLGQZQZ9X8YPixv87NZin+qnd22iEi7lDn0hd4tQ5c
PA85e812eY7q3AJhqPrPsgo2QkClJK83iEOQhn2HajcS6vi2IjHtqGFOd4HVbvonAdVKy0XNbK7c
m13QUSNj8afVF7n2vVpDlbYJED0EXH5bOokjLVb7A4jRLVwmqC6qfTVmeB55Wm5kYCtH60SSNVFT
LgxyLreyLlAZZD44Z1QcERDJm07qx0YXiWJkVGZSiaTlb4oVCl7VqcQQkdM4BByz5JYbB9vzG/29
kqf/zPkF+qGp3/1guhYDEGxSA56GF87eYbjXxPPgXd9Xi/yO4X56gX9IAah9skj6h2oZGhSv+Xm6
B8+KCL5Tfm3y50yPQ3pFraGxlcNz6kmi8kxbViPYSdZoE6X1it6F2LlDvSEDiPTruJLoizeYXaTw
zEvxLqNj7YRoY62MoRqngTmF1UoiNawD+IbtcLVy7n6bK18v2mkuzfLUtIHxmLJtTxX26YnvNxMG
7GHmjyPNfAp5ug0UzIAMiA+BppeANBdtNC/vFysn0R7g2CbrLucW2skZq3mgFNQjJwKFLs1KFpNa
6sYTYrStdDJ55KvJSop/nglblEY5s8np6NEst564wJcYgrQSCjGbuvs9kJ5G0gh1QkCm54PvM5Wi
Ci01IGb6hZVf6W5gfKyMo4ZsSpBByKpbz70HyFxC3iMb+S8LWl64a+K6yIfoLGVnzyxZUxQd/ZVY
JCRLYGFxAKqKoD3+u8ONf+8pM2qJVAoaklBoi9IzxeWlA2uxR+GDRdTGdJDG+Wa3T9XY9T2N65JA
wXUPUnti/70Iz2Qhxm0NPfEPEOWm3yIA+P3mLVgU2lmJiblN5aHhux4LtA/ALhhu1xf39pEnvPaG
M7jK6LNQkJqREOoQDl0prF1ZhUtrVH4mzz5oiZO2g64j7ujYW2FYviY0Xi5iKtP7fB33mxR2xGKZ
QEkK17DSroAtbgVeH96gor8nOajrGkznuH7iH0UsHky+TeZ0ubfGOpBhRjrVaXCZ8rll6hqcImnw
CgoP/zrZjXX2J9SFM7a6XnB+T62q8ZkQLHmibnTOm7djDFgGmez5v52TUhsp6pur9TEmmwFLMaal
/J0On1oVNEW3nL039qftrCdNSbwMVQkyJXqxzquiUGMl1ftTbC5FMiDAMy0PYGX1l/YxD12B3vmj
d/spII3GAi5za9CrK9oulOLuGsa/FrTo1q5pQ6PIDwDCcHzX5+aXD966MF14w4v6pb7y9g7SlAMJ
OGcSTkUB2T5ZxLeZ6+7Nk6RraecUg5SXKbgUjAzjdsyaFquTQ0fxIqX34OXDRAQzRnpdlHNdyWEF
mHt8neo5nwncDh5mr8SMjMJ9ep/3F1lgNWZF4s8HMegwDIML8MxkMU2BDpxblxOjzCVvvzwzv52V
cCGubux8+UvoriS+bBDLhvRkWy8NzTpqcr/fgRl+TbZ/suHTVKC1o4SFPUn0XFvwoLsZsjAVSHAz
pfvied1BIyVplQsNuG3Pumfy20XkBFqU1pLPd8wKxqmhuEDT1TMggHqI79bDyWMvHgjnQ0rvHHfi
hUtCL3iKPvFseLlFxzkAoIWVFnyvJXP8BFuZZ8hyC9S0bUYAyDpWVqYJzexGJWKpbUMYxyJ4NFiT
58juo3Kn+F+c9AKmi7g5ej+iHpwJ3H2RMhzLaTUecJ88gpxFwTvWg+ZVzgYSGhVct9Zt2Rw7MdLQ
aH61YJvBYUqviFYc+cCD833gS+Tq26mr9bz3VKTkEjfBCM+LMqPAZaAmlvch6B1k3BvwfqpDVVQ0
8i703cD2vjFbLMHzsGMBd6Wq5kpcfchNlqe2p2HUCKa0XoEOI3qe7VR/SOCiicoM3agFsDobRJNc
DzHUT9K4xGzDBbEb41L2Ydo9dVO6PHdHbvL41Jv9gQR5GrwdsBO98PtHwRaq9lChkyagYh3GIPbQ
rZfXO6/BnL8qMd/C4haE0UlMcguSl33fFBpsSBGLjotYFagTXf2/dCrIo5SeJRX+bnuF9G5GU2z/
wrX0c09oPs91HrwphIJ3qartnJBoDiTR9j1gf3AP8uOiui/QD3JPkuOhtXqRpOiIf89fJLoPkUDS
E9E4SkGI1z10GozITtFwsuDebqzI4L4cRu4Q4q3J+W9Go4MT/RqPlMfuZNPm/vjSlDc/SJNU13Hj
eAYJLtA22fDJjAyJlYZnzUPWxN0+lrRYa1ERT8aauMA7hJD4HuTziZ8o25AI3ckk1oI4IbOZ4EFl
/jGriF3lNrzmi92VI4rs/M7/RCCS1pQRKaYQbkc2MubxYAwg8eFJ6s10Vtgg244ruKPSVwAYF/hV
5y/Upmd5On0YfP5kGEBsIcTlV3simS+Tdo1E1AOa5dcme0+l53MPDcK72LarklVuNYkxonfAKacW
vJTDr4gZ+0BQuTSs3xhpG11UA6TwvpD8nlKm6MolgusuypurpVCD9HPYlLtrseJK3B2/xvbSvXGB
CYus4sxev4Yl7+fgBwE+Tvm+jg77rceaAEHXaOOtntB6FQZ9pTBNGX/jGGJPMs1Zsegj+1b5mG1u
WsdyxJzexHh7fG3+F9EbvGGL4enhIEImCK56P+GdMaCy89jcJYnrA1aLjvrU7bTeLGTrofBoXrKw
J6YbDBKk0DDrlTUGJ3SbcYfyiEy6iJ46widQ3SgxFnaVflK7392sFegBmwVYRGJMIjMnXqdllUrC
3r3HPVU0Cc5lZmNyQvvZwhdMv8G32la5Xaxopxdvp52akABp9LfEIH+GJ31t8kbFxW3jQwUPueva
+LugwSvsSBuLm+0JBN5oK4VziBeOUnNhQfPEK67dCOzAeHBA+FweRxTSqCtpu24q34ADB/igPUUb
6SZdQ4Ac7W4S+eq2uUo1bhDk7CDN1bs380oqHVmCJlpJwWeOqoxNNTp6GPvBYTqT1zgyqaP+m80y
x2yqIiIjoHCKTCq95A6k5xMRtAUGXYkxIhemtkXHNE2VCJiZXrcy3yrhIdQTdeUr177ZJfPsNTOH
tQyba8wCDKoxz84W8ZOSViOmmGIsxyK9wPQm+P5LWO25pfQ+LFTl6PF7z0DkQzzZQWjiHD1h3x9Q
YgcEdsyUDM4q9uLvO0+xV30EsFtVhskoa4CxMWNj+aEBvZNcUVm5eiWMCOtIpYTv1AgvvBgVEzeN
d8cnIwYJRWTYlq12+C3oKHmFwK+WaYBPp0XXDZu4Zt0SLDnDIicfrJJP/hEmiRiiFA7YkmD+u5lX
mtJYjGK+7h7ExyNGk8367iZEY6CEwMYnSiRWqFySxJCJLfnmeq4u1WGrmfB4D1tauJvPMTrMDPsm
uA/DV0xEy+nemRd/NBiCbg2H07eqPyVtLgXda8au+4lYRwwwuuZRZi7TB5lfdGa8H0EytknFy0Lh
BKUCmnik+A8doDgp3c9rzK7riVoNQqAVmPXY01B9Kn9BzJQg5veBhu6XSEts1MnGvnaN7AwORq6I
3o9p0UyA7A++3MJxIO86ZcZ2TKd3Q4JtAppPIt0F2/nUJGivuva+oq0/7KKFuPt0hd42q8rCdF4Z
8m/FJYREheP9+DVKAc4TsRCxZE02CYXGjv746rQUPsN3vwaY984Gs3hE4lpK4CYdK/O3w37R11Qv
RUI2/aLxZ0IhyFMW2Ouvbf56bLq/h/yafe+5R0WYxijJxCgx8Wx5zqPqInXScuJU7xA/2615tvos
+63oe6wH8kr4foPlc+AOaZOHVxZkral34mS8Rv32BRPEJ7YzWRI4XHdnFKjc5GVXk2AaosOnk8jn
l99RfjW7DB7fhT+VbrjI5j14bQB7415PhZ4vbZMBm/9ca3Ew/b3XvWp4b/YBpFQv0eo+k92efSVV
WKvHb6YJ6wuZ9hm9267mCn1FqrAObr3ZUpUncbZoJcKi20BnCZLBqGY4o+x5urkB8cEpw2WAR6qz
QIgAkNT9yWqzCW/V4llqsaGfufIpqYpJWCDbZyusyuKQCL499YNVBsoJ6SRAA3QbkYMIuXtiw9U0
lzXT12gt+Dw4KqsMDoZQeeHq3+Kn9KJp+X9+h/9J6LjztTARjg5FUqfobzso1jne3F25P0o8ueN8
2lJSkk4vvmmtyf2tI6hbReeYLu/mZIhfm9JbjT2hopE/Ltyd0PyqaFFfUpvTmrICvpzo9uALOVBe
y8xmfsce5ij93gVMmPghVq/BupJsoAGgr8qa72qa8bgYn9V5Vu6eD6z2p6l6+dlQMEmSF3uBuiZ8
J9qgNiKwHUu1Y6YjXDBLDdnQ+gfjFc6BN0NecDArNIWtRmIDhtvWseGg59MIAO9tLHRYPweBGooR
KqtsvtfGTlSdbuAmlAOXlOBfGy4+hzJTAz1dyky1ajciH3EGooVU63PLT0zwG5nTPkaq5p5oWVn0
cefFIMti6gv9EHV3/rKwKMiwDSyar3QeFlngEloTxJaaAIMDef7S4Qde2JBnSX2MiCn9m37j+lJD
RIAwl8kiQfgZ/PYeXHEJBeB9TyiBrqCM0Cc1Q/bEcWOE9xVt0WguWuS1OKrvnTgDey2UWdjioKUI
5GyKsnCh0Q5W7AnVrANn7B/ePsXKBdf2fY+BNbX2zub/q1PYLmARYf3r/OKw1LeSKnAyrZr5eRl7
WPKXitbPXbOX+ELwT4Wy/EaJdJLGpm7UK6kaMShx25UxprLWc1vgXUAkDbpFXq5wjTV8UQDJAmcN
9kcxxXw9d1NZwcUKNDKIuKWWEvPjq3uhG+zbNS61owtg/cdwxtWvl7OqljRgVcyWwIKVVPYPl4X3
ckfGfgaQGyqOx5av0ER9jF9IemRrBOpeKIYBFHB/vux1xkfSRk2FUVnOt38KC8zPJIczWQdgfQtE
VO6sEDId7RJFz16k9XddYvC4GVR8pvCkdbyOIeDvFMgqFDzG7usozAQO9U3h0BlImoxQ/pQIm1W6
gNsxLNzOLEg2bMp/eJ6hyRTRHcmUaJjbyP723lZL486B+D76D9/sBiZmLqWkQBOOuBPu/mAhB2dY
nN1s+rwMpqaN7Q0SgDTz7WABvXsfgF/cf86WEfV28LGbwwA5gpZ/x/q16+7INPINqohjfLCjFhdI
BIOTO1lVa/7SVA43t03/FNZXsf5BqjMdPKbFklYmX0ksOQdPzyLmyE92eSigsWOGJPZchLCbdCVI
gNviT1jGCvoFdxVLu73BgvhXE/NLVW/KH/uSQl/W4SqHwwR4s90CDj4Top8mDzCenwyvAqUWCl1w
6t1gOwSC+irVSL7Xx+2gfJHxmSjXTtv4bEeqJx5efm5hthteiIJ4mpbwu4QjJRrWO4IlE2wI4IRU
0quDTKnlcGGTUvAOwsOh9br4laHpjMmv72uBVLgZ9ulOKlAmneZ8KWFFtzKeIYW6aEA/VQQO7WP5
hBAGSibFDjQAkLT1O+vn/Wq5hHDPn9wM6nB0LfIlmtN3rjzDTWe5fM8bfye1MmGOsnE56Fkhw2+r
7TneFFvmpS8ITaUZDD86em6gGG2yJUJc3jYhPn6AIavlXBhOO2c1WxoX4MYTmVePAFcXHHVuF/xo
0tnafgZyRwkW5KnGJ/ks6DkBPLux4VFOkErEKpDLOpMHxYBaQh4/qdFKigBtqLZypy19BtoRuysm
MgqjuXAhJvKOM7kN620IiuZJEd2li1WrfPtGurbIR0TC+9tYvAsyKbIMPKskJmD7O+cA2goUqpPL
l5URwkC6/74s7bwyREd/BRWDiWQetXP3hEa2FiUjKABFDozuIJUyyM1paPp6E1ackm6dqoHk51lk
2U3mm1LW27YNjhSJgq0M1rl+XhCKRTcvKr4NX4QMpUd281/HjoIORxWDU1R14QwAvOrV43wFgLKz
r5BHhhdo27RuEiNaJy1Ll1HCYxyaEcXy6gzO3b3wJkRSOWcNTDzMFZQ3QMGc2glrb67WpAqR8rSq
XNpvMf+SF3ARtbIf6Oi5yX1ZNz8fWRXa+Emv1+2BaU706xwEesRx9Lf//sLX9M8fePO71hn5E3PM
MKHIycQddmcf08dUzfln7o6nekSCWogkK93fVplNSXRZJJ9OwAbnAXta8us8MwGPb5jjkrYDdZ81
DUrqLe+rNVJNydnyoNbT62HK26by3qXfCmIGN/RIigwTuJG2HVMxAsdv5Wl1rXlp3qV9T4TQwYSv
IdYioimQ6tMaEgIviodbmDtcpn8kkujEGn4SG8R/Rpy9apMeqbyphALY6+c/2aJ7do3f044CK9dp
FZcnTATKbtyDyyCoeYsu5PWBADKQbaK9sL7B+1wUaHC8RanHKgFE+byUsM87TtWti/kEc6iaGDAt
3ii7gMT0Z5Xzpu6uLafQ4VWNETid0W5vXp0yBKXQdiX5gadIE4FwZHn9Fklp7RAUKKdcOg9EjtjN
9O41N1p5BDPkp7Hac+aVhSxDEGefzL9nmLJnPrWn+7XS0L0kZFOqxfroai7EaJ3qBJDmhMIp6anC
xLDqXQVrM1l7pufz8VGPZimkY3s87+5BEPfYVXfCIrr4xOv8t1Bl+HjSkaTze6MKgqKLYYPmjQyJ
63+r+8yd3eXhLYZXaQveTULGZU7B0Amjr5T5j14whPtFl9FD4/YnBMKGxrDPre0JoPzTtRjh8Adw
4w9m2GrSYg/GoyN9rC2gK2bem7IFhKUbGNXQt7+eI2rhaoGuMPkOn9b06NI3bZOSAiQ1/XIFq6DQ
3ezKf6/R1cDmqlZsF9y0CgI+AnVEHK1P+hBGuUunhNCBZ2OWkq4eS6Fl6105rouwLqezSKjcerpd
a4D0wqd0JfI9w0shFJkWQGoDr/BvrsMdvpQvFeTqxcFNFUBER1CYianUEWpPk7bNorGXmmaZWF4j
smtPaaQnB6/eZqN7KrUjp86608cN8+l71J5obaAd6VG2GunAfiwbP2M8Wfkrq+192r8X6dEuafCa
Y3DqJHv0iCRj6khO8UOfIBVuv9eOyDEaRhV9vrTyTwRYB7hiYM+CuOW9qbJbTP39pa3swKOEi8Uz
amMjwwGKjHTqRyZBOfuGebPD1vBK/6k6cKel4aMvUy+11jAfK5r/eh5FdfTRBxppz3BhKX/N07hT
QtLyxafwHqCp/zgzuxiF/SO2VNIR+WeTuTUGtn8qXle7k8U7zWATGH1wn/keGaKw+NIp87kOUXXs
dpKarRn5J7t6rpExzCtNR/j3a4Kyjn0jOI7iQAqwJgNyi7IJy/BOrZilMaHC4YcXVdzFuAu2aDxc
6tmTeNqKGISgRUyj19ECkqOEdag+Z8CNoA+/vHHIhluwlS8t7PvJonednqGbJ02pu904/fWkxDWH
BqyvlenyaZMDY5L0x6yxMvqD7VnRUC3uy4wBY1utxXu4/hrIsCUrtlsqQm5IiT5WwHJJRtMaM+J6
Cyf/rWwEVHoVjonAp44fpiTHjxx1tX1MRE9MwghmP48pqpqaWEMMt+RCOINI5qJgxFallCZ9ogaT
oX/TEsiZsvH6+HzyDYlG+t1rvgNywRuA3d3PVsZfl5+mNGQ5nZJVO4GnOcKuoiDId3S5EDuXDEi+
pM3yQW906V77blXDHbHEwLYPKzVT123A/SeNC4W8UXwVtg07Ie/nRDlqOo2z2T/r5iJRk2AxqlCf
JJ0FZ5oi9xUtErpirvpp54ZuGlzUwCwE9wepRtsbJqC/ehrJENzkXYww/0tbcj8szXd48hXdR7Hl
cOtSuX8X2wffsoWUw2hMMiY8VcO1q+nNub3kYZORW+S7BGFJXj5LOLq9J1oWSyMrsJUcCAtUZ+UW
EKRiNQenU88girBUGrSdTfxfmgZKPn3KwdUNtDcLhEL7vPIMDO4qN/0kD/8PQzvXkqAaZbQGoVhV
kqZaq2pU1bn3GBZk2yVvyMVk5qQ5aRACA1rMBsK9VwWjqTq5HQHX4Mgkh0SXFRx9x/oA1RfNpRyE
EfU0Fei1etQ7YohDPqNrCbhGMkYE9EfRq0NRP/yQ02Ly7v7ye4GYE66F+2n5O2GZY/1NNvmZTzti
tTflQ/FDndWDpIjWXxBopRqVZbGvRA6pJ4joId9R3WBo5RcV622z7yU74BLl1NG/EbVpGuoht9lk
qh53OK+J5oW1z+9RuUqAMe1JUJhh4g3OZcqk4aJhsJrlXp9bznOZLtgKYfHUpdoSSYhMDqGVY/Jm
KzegV9vd8poN0ziesY84XtbprUtyOe1RvbUclp1iam6LuevAfxRtBXNNs3aKuaajX3IlYtbG61nZ
pkxeLmvhIGWdZPcH0pgl9LTGa64cO7C5NXl2Qf8CK9WkoNR1XJuHYF8i1Nz7vyyylRVbk5+i2x0U
HAKLSn5C6RXtNXyTduoR0GNvI9z5M2Sftn/MNAOZuZPIFTkx9jotbEoiCBwELfuEJ01a4WoSzJX3
ZNIBHHTOO33eG8rFxNAUDrTDP4NRZT/nnDENTU5flBkY+Dpx2XjGgT+olK+Zwm8UhqIA9zHnR4LM
iz/5ODkCCwam96WpkAaUhKck1aGzeaFRZ+ETV9S9vGw4x+eLSgqQve0AVeyTZfwSukxOS2EbGrDD
WhEUPLUzBWU8fJaEifiWK98kUotO/tZfmXYqUslY6rBLvO36NE+nXixfJlxxJ0N40kde685ZsNE1
d1raeCW/0zD01XtX1VSBzOMDCr86+ty3qS0jbnZoqYInBasmRUdoyqxgBc6g1xtQEiXpd7Na/c6i
X0BS3uLJmAgjZ3givIu+6PRj/1VZ1yKKx2rg6qqGySIALtlbjHpQIBc+l5OPU1t5sCuQFKYecqAx
0nCaytADfqREqMqmWiJYIts3Q46pGoFKDI5iXd4hP+1Qnow+gxXAdvkmgVifmwDhcVsssMDLEmsr
ukJXEX0/OtF7gIyUuXcKLgjMQ5+1MSwJlro0+i2PaGnFNdxv0AVk2LjQGeaDQAH3xetg5Jd5vAoR
OLFLTYWeZlpbBsDDoE8qTnna9i0MSVVHU5iP+l/BPan3fx7pqiUFTQW/SR38x1m3TFoIDR0hGOhd
8pfkFxeKG0h1Wm0/k/s7o5FBijBinnyWIluDkEOj1EvEFSu+yscFKazB3LgCsQNc8D4v1ioM5oa5
Q4Xm0w4N4BZnioyP9sQVlKm9lFJniZjvvePq7kLJDpWKn6zxoc7ivUCTOvRVeow4PWYS1xlPJc8z
dwXXlVtmbt/HdnoHH0qDo8r6hOGRyPkq/2e97sVU1YVYWYbNvXN1aUTU8JQcDpOg5Cm12NbbOTi8
AG3ujsaiQ89NtcGDSnEDogMZIsHoRJ9g6RKe7pzXLL4RWUafEqvpFkRvQtyUWoNLBocRlWbIEADq
s+jX12EIxalSZpVKr8CtXl3yp3wk8fX9kWw3f/F3OS4ZXcGxCIBj33zDs4QhditO9Rv8TXABbZxS
qxzff6FEgnRarNPUsE+DVHkts+Qrz35qukKq5oRq8Oa2Q40xo/gKznz8woeEY/Twksd2C4UyN2/p
OPkkOcM4AjwZ2LCEeuKMWXOgTvqITolv12rfuT+0QHL78OBpZC0fHbv4Ds8MAKC1TnQq05AKfPqE
WjqjMpOdHPH+zQJ2cOsKqdzK+jBH8xlRMqIaLkuHzEaOLzdlzM4T7tMupl0S8qfLwAim/qf7vzEW
zeUG9x/PYUq5Jf8Z18OR534tGU3R402BxIuGMAC5Gr97p6wN6BUV0iEtoHUoHw6YDwLCxdiviyOS
k7PJlBsEN3q/TV7XHVTqheyi/7uUmeB+iizwqbmPxqAmsT3NmlaNCFvNK0Z+momC38vCUhIupImL
drjSLIWSbdV92GbZeaQbWWPMmpTnlhzN+OyIG9dsVxbVJHm33t6j5327gA4LiXQ0lUkgWKSDRo3J
7SNB6svmLGkBokhQllTYhI4psPspWJYX29Uh099MVD0u67BrYMorJ6jXzHwv0qsgR3OE7lL7UndO
+IDRN2AwN+LslPF4IxNjZjQu8+rZyBEhlo+SvY2McLRNuD2mlN+uOzHb4z5GqESrVSSOdurQ897a
G++e7fjS35bhNTMZIY1dzV6C2BVvssFe5jESR8jbrmkkrrFFqryF75QXiCinNHxijPjumIBmBtuY
6aD41XcBkMfZnXxcNXzboPDhLG/DQtk6jPGt5a0oRQgP8+k4fWjUtoEgA2vSclQ0BqWKvDeFIXlD
1ShPfVVUNjaptZbSK9gENvs/xNtiitB6lm1vyBMJZtUI79/p9UW684DiSEnJIV95hUjEjeCGU9+J
5dS5DMXLEIgUjmZ2uie5SwgOkoCi5VzGleyD3JLXzyHfakmt9Gg+9z5vp4TVwtuT11po9RQ72ulh
AOPXiPabWfCYphiPFU0iAMz5qolWOvOnhBchh/iCGbvVFsaWJDInuLsCKXUZ/Ts5Mp+68Sd5YId/
+Xz/o5t8VdjIdYgt/YlfIdAwzdlKXFI/Es+xU2AIQEHxcwuU1RVe1RD8yByN1j0UdpiyJxTTN9vx
atSUAjxGgTbfj/ZUdm3XLczVDyq8js2/ALBFs/Hrp+36PGbE3HjeFPTkoGEL0B4JXlpzpBz6XxWt
hDNMO1PyTEclYn010NsLpR7ir3l6qgPh4O4TAdPS/lqZ3bEmi7Yif3u+9ZcJorYob0iPzfZLGnfH
7I1A19a0vYaR2qdgByKupZi9PNTW8GfHcI4RH/Ne4ADWveTPuUuDjXIG9LnBuawjfjOCT5tWllCp
Yamw48XqzzElvpDLMEAx/JuTmkGMIGkeCn/k/vYnx5F2Eu6OBJufANoRQlObHkNy10dJHmxfMX9n
tQBIbsspntmMZok10pP8Oc4u0oT74xSVVYUm8GlxhatWC7i7t6lqwHQN4UYOl0c7Bv3nl2zsGrrq
EQTj1udAED6uGfIf0QeDLoCKUEuU5ThqZ7b1NMzbxZgWXiJLMfj3uBW+SnpqDcI+ctoBDU+EX17R
Z6ICkv/OhZ4vqgxsutMtReZPvbwxdQJyPBLWVleqJ+mxNxqKI+Ae0GhYv67F8NGTEwthAjV2Hbh0
5XhtplQXIfSHQfu5TcBxbDUCIE79gVCZRMONZOqTuJdcR8iilXll7hERWhWjV8yXDip+wZFUhoko
xo/rBy74Wc6ZveBE0i8fTOeWHrEhDBIuaqmIAHIxfwhUJIAms2/cfGtyH+nAm8iH2vR1Jrsj9BFo
TmdOE08KKz9P01yI2i6FJXs0V9J68kCaufio6uW3PhHImZptHD3Zo7eF+iP+VgKIizgod7otFegF
1xMBdQZiClNcePdXVac6VVeLbgtiGxCGeT4Y4TwY7lzuV9r/G3MPr5NXNCgZ7v929y2FaWssrkwR
74jWrQGLyc6JWggYr0LU+4mZJMEsJXEhL0ouWn2aj/JHLvUrbIbB5wVYIpvBNDcyhzc3juyIlXo3
bwprdxWuBi1n1zY6/CtuAyBWuMRYprQY6REDbkCAAfNMvOBsoLVrJgucPT8lJhW+zNlriT8oxsgc
JStFOGTKJ2ZhPOInCbTP5o4K5BkxZxPjlZucxA5vyJVyTrmymZfd697RU9AWJdaP0rTZa77aziE7
vPnfXfVeUE9314bLhX25eFt3Mse2sECVbZF+Lqx7bki0JY2HNV/JAR971pf3Lix1+tdV/umSVtbL
Y67vYhby9/GiBXWYPRtPpyOUlO14AUVv+TdSOplAK35oAmHtywe1lBLoolhs++Qp3elI17Jc2YcR
a90Q8ppOSoxL+Nn5hZv7Gm3DAmaMF1t0jhMIUI6Vqtr3qfhfKvLJPNuZwROtTFKYypmKcAelNbEt
upjakfCsseT50Jhn7vpuq/Xj2OfvEdL9f0k1dHeElfCP3vTsvfxXKCBWWVtnGMcC0lkp4Y+ovj2p
XkhbLrAkkaVnPgD8kfU/170tSI7HxoM/uYF1QrNpZxK3ZlOwWTo9nCgjo5Xh3Z26HuarSW5JA+yM
L7Gyj8tB5Kj8amb1fCV5g6iYTxRGAc1j/ubrwd3D/vJCtMiBzSy6Hc7dogegUvycx1UmnHMOyZ+Q
/zP5ZtdWwgTQ1swBtV1xQm2lICpmJX/aY69OvY0TY+gW0mFlI3F3OpsU6rpZQsYJdqcIUZXtBfQn
9yEf3t0V2xVN7TktjRcPuSyfRb4Bd2/r8ojDjMHnnPHzXHNI06rbIJfLPhniWyN65YddM5qNrawV
j5MY4YRtKCEGWsbW43O5VSnFmFmrrufM7pZ/TRbhPeojFsvhzfp477/gHDfpGtKZ+TZvNClXDzX6
rkaKXMRv9SUkvQW9rpkahmLQRHHVKZ8g1Dz8LNTMsW2nOn+mglSVZKWI+RTtpxihA7hIWZDwJt/M
AUAGYJqOU+I0mf6P9OFjsyg790DhKr0DULf/33FLPb8sRlp5kK0J8R8kNCNW1mU4EAy1tvlaY+Fc
6DRqdi/QWaMKY0idKfN6gosdABckha4G4oWxZoial0bqoCPfPEjH57XiAOfxmfcPrOzFgnqULVTk
hOTF2O2PDI3CDao0azLWR+zrEdeIaucWLVRgY8pcxI8959WZkkfUwKYPqWe1RG2dxyGjZ2DvHp7Y
ZWndsnLL+wlZbuXk1EW41w9v0YVMNKgljrkpEJZSqBGt+cLp/rx5Ug8/qnKfUMGe23sLcAWpSvtM
KPXZk0bR9qb/KaJPt2Q9FHsKMoV9cYupG24Er+fw10vf+0XuESDiV8EZVli6gN3klNlPXRiYxGLw
e3lfACy9P6ILsi2d4f/qtQVTiJmJIAVEYinEdRakVaBO1LKpnbypz6bKri0fHsc3y7Lgql4tcPNY
oPqLzhO3zXiWSzAhesLDx656F3k1Uhsijr/7XxpKB8QgFtd71naMdDqt4SqRvH/jsUOqRrhl+90H
AEuW/30RJpSgl5YUcTowKYsF24OP74NQ/YgUX44lVrz+IvZXI8jofBzLfvJUHG2jMvOgDvUPMKQa
LyWKJ2eC9sRKjiRx2k/hWcSvRGV20P83BUlk6NDzj08GVka29oU7qiAG50FFTm85TLVTlEhbmhG7
ZvzZLSpdVFRxOup2w7QmimIR38KFsFrjCL3syL7AP4HyZdhbtrGG15MiOC9dY0bYlmi1iIf70D64
KYGt3XwVGwLlNEGwNxOcyGDn3jAlIxCf5KgD94GJCd46Hoy9U68Fgi7iuzyO2krpwDjPJFrPVIsQ
1vXgWVhAnbpxLBux17Sk+QMzY86W0TaILDKASEmqjacASsO47skbDCqZpZQVj2wkcSYRJtJqnGod
DjH/FLhgc0V6uva1QPrdhbHc0J1aSCLkIApmOX/W6wZpTljfnSrA8tEuznVP6CW9jBa9jRPhBbuP
+EZSTZ9GXQ7e2zmMTrfxdZSjwTLiPreGwInYtdBM4AdmuFCjPktQCxWi99lVFIJdPkLENTJOXKQw
16gAUa6Ldfe/NYE7GO2goNnzcJhqqgdSD+p3I9XlHY0F6+JzECUnTmIZwyK+ahxc5UfpA8m+BfQq
8yyiPQnev87jsQHuAu4eQEwKq2rq6dlYKX/ogbx9D59TvP28kF3oxZncYc39gWWA1oz25x3su3gU
M3wqdTfCbYwiP7ZX10ZyI6MeNx7BEw+euqlsSSuM4tHqHykQfRCZ5+I7BKT7K1sm6G854n5RFqcg
I+aYu1nc9pCPUxW7Hbnkdyq9XNeXUl1NCWEekWURYaL1miF26Oo1fIiQMKs3p3qGI63gspqlEnD8
AIGnwkYLJ8YBHBGE74NlbmWJNoIHPqlhyU1YTu6NSMUPCatJCei5AU+13zAah9mbdE3Z/pSiWJ1w
/S2VOBGSz/V1mYnyiex7APOSMOGUwbN9GLOOvApDPdPqaHkOn9LEUH38Zwx0x12D2csniHQszK8C
pL3wWZA399+4pNVirVmdtr90Cits6ASr2nZI+F9ziXWEtF765l4Yl9dB689XJyebHcEPnXfEt4tF
ycyLEPi7ei5tIX3zZsI4Bq/uVi7XXjsammXNyTOwLbyDM2dUD9DhHI0af8EpKNEOSTYDXB+XUpVd
1psa868b0FO3u+oKw8Hz7oBghfL0PKUKucYTM/HhoWnNpGfLNcq4fS0H6+pzh/ucxHrzExns1lPf
lvxfuLSWgLQWT94fcqy/5GOX/3DrkAuTFggkJ69yy1hiCTZpoC2waYMNpq7dj9Ejcjn////X9EK2
/5UNSqo3k8/tJf/T0j/gKQKnM6pCyD80CLJzvKUxfO95sSQM9ENfYA+716aNALGHfTABl9F4JbCf
n0f4G+h9YbqX43aIOIztzSlU6X2pnjAFqxSzrIB0TT4BWa5RvoCA6F+c9lDIvYyxjW+YICpDVF6u
3CQxdvKSa/Qzcpt1qJ4IX4foGT6oXG4dxb4OVHDsKb5WW81+fFD5N+H4Xw1TymWNDIe6A3mANsgX
4vx6tu2pFrz/8bF0bPAaBrAfVza5V74eQc8nHhvw29wbWHy/GWET3G7LzyiIt8MXhObRDeJ7YTvV
A7ZPnOXQLc0iyx4LxDIUoVOuAvLdWbCM+h95OUShaz5VIXdOoLS0ZoCxwyw9yLHdHbtNOCyZGu9C
ULFPA6zDD21+MuXn2Hi0RpDghyOrN64/UDzh1Wj0gxS2eWQc2zFKXkvPKIGCDvj6TwGjs0qAtOMx
AgO96z55hBQwUPv9TsVThoAtU+jHDqm6vR584bVlw9lThl18Rr5Kd9sfzlm/5AtMFF6qMIkLTnfY
vBbMP/UrQNeDwYSex8hmvcaQgYmgSlDNGF8Jgmf4a5CDsaDkQN+dIMtDQ98GQxxF3FzuM673t2CL
jbFVAPnRK9H+9evzWn6UocqGHlykWyk2f1WuIHF6RyhMc2FX7Ya2ggjMpSffILgBFK/rvxFS40pm
wxix9GWfBc/+pKpBLUsJrHos+VPWLjIW6LziLl/aDGGC90cp9IlnAOiYk57gRtLazGR9z1AxjKx4
8gY/m8qGF6SnS85t4dQ0K/W4IlXjQiWADAhcmiJnGdU5lup2irmTiQ3KuZXidxbRalwSnKLvvzP1
xzpGmn0jq0rzwOLIt/YMe9SsvqzxFwaYGv+MeP+VccKvS7zuUzeBkpLNK3SHdq2YU1kWMq9DOBlm
Co3UoYgQwPXhRv4ZeXlRrMIjUVIv5suA6M0c5JAE5FbyEzF558r6iIi/unUs7KU3gvuqFInvAYHd
hRJUDmb1NtVW/qZcTalsT4JihmqJII0xrGQhE3NUcOs6UTNyta/uJNfBtsXaA7zs+o+HRMYuYvCX
UNGcLgqgdxxSa/s2D+H6keXVB+SnJF8si7hOSX3exFaE/GoSsUFgRfvifBawR6deuhdfxFPca1JT
GQ0RlGKdbBpwnzrehLJzS89yOh+XwOAi77nZhm7NnGh66INfWVUdJrS1+8KHQq6RcCq9OrtCsosX
MdKzWtUWUgrGBFtM/bDpKIaXx7nZIkzb+U8vO4DUNoWfMb9uXkaK8mSnOvqexCZP88gVo4+4wCX7
fsPO46mC4iKQF5u1Vnv7J2nRKq9yfw4WCfVgL2ps8SJMAAlOMMokEtfMwRLeTKgJGR3vYNX2KM7m
5Rikk0aM/oDQj4vnGWKaI/3pNhRkzd/56cwW1iVJFavFVBl+vggGgy5mT0KoNymP2biXIRmKvYhS
ZPs2Ijgz4GjR8L+rzOGKSb7cYCuAiR+t/Bchfx57tSUyuxaqJdcEKSrfG8Zc9ERk96HZeBCsfsh3
q/L8P+17S3oyvdq2H+U1p4Un8cZL35+qCCv91eOMDhzXcUDI/pCeXSnRBeDeyID5HSmil3GesA3A
d0N92aC0YIiq1PYQrrfCbxwW9ufQH7a9B5N+byuUVwEeJT+V7vkQ6bE5eWS+TPd05cKsek6kxG93
R8AakIPBN76Mb9mjPwfV/Q+C1Os9UiUmcNkVPEvvlesbrF4RVbQ/L0Uj4aao3BobxetD2ri1fPvB
C05j4DsBe6RNHPleXXndvqhPWuBxQMR0FN86NOzo0yPIEMBtYjf9kTmFnYb0xnLoAOVXqfRd7RPb
D1WLcqswoJht5JfwW6r7SQ4POez0yYx0kKkE36RiEa/gPBlAbbUpZnh81K2JtilXAhPbwYeg36rF
BIS0bOiOv0246kxTx4PdIBG9l5bONa3pPM6zkp07iQkYXyO03CXkg1RHCK0LJdt82TjigNJVIQQx
xq/hpnCZTHSCHUpMdH3m9U9MjM7uLkWNw1+umslD2+yScS+R62IRdqumrSBWfo1nQljcG6lbvRs/
WGsb3IqsGogvwcCmVr5i3eqk20aH7p3XzUDMhwGmuNYhpzy/nYIZ1xF9I9mLj2XQeyXoXuRHgD2h
2gmbItD0QASuAwh6fbg3VKLxdeRNDPRMMr70BTUxkirZKZBnaVIXa9moz5vvNKjY2/C8KZ97ji7M
XPqFv/HgFqtSnzvycTYnthvy14nIqy9lGa7u8A4dXutz0yZFuw1ZIk4y7nZuI5EiiRtCqY9ZQ5cl
Ird8efQqReD6iB2LuVOTXIDxw0XL06OdmSx9aCiRXe3ASkK5hBto0EUn8aSEmhYX4EG4ToAoIWYu
FYS7yGEV2tmSL5rHzvKyh0dw6YpBAhygd3l4BNmLZjKhLUGGpV77I86yv76+23qPiIlqTRxGPsUP
+K77uncTLM0KsH0Jni8HyXPNhxwW7rExGTIF8POPmGaAfgBKMWYueLQrRQtDpLmagqpc7jAALDnc
UcDULL9fze3D8S8lYXH3xRSSZ8le6gjZ1aPypGoVeiRRq+c9Ff0K3Tmrvkz1NwZtLts/AiN4F1en
VOH5Z8thzI96iOFfTTqSC34Thllf27dyLaew5T2vQp/hQA/iN+K18iYJ0dDNjp7sr9vT6N1kBpHv
HZP0ubzb2SJ0N+ruSMsFE9VhkuppvhYIlVRsjEMNw2DU9H3V8zWYjuVjoqQBg/AqiX7zrlLg0B2n
hyMtcJ8woo8Y/3shOMQOPuynt3wx8r3Z090Yic877uXzXNLrccUKalj68JSSg+S4Lrz2xU6mv0Ky
MxYQpJLevdrEpLB+qmScLrT0R+oQOCnQOPeuCbdtTW3VKwYZ2qCklh3Xayp4cq6cf5zEnea7mita
Mcsc1iefLIz6mfPa0QjL8V/FECQj1yircF1czx75Xs56QM0MqIYts2bpHnrwsWXblRwaE9tDoCsS
IBCDLvCPWftdXbC0fktkYnztPKaarBVkmiclEw1JVlA+gIsnIKko1RcC2f2YzJmQ3QhZMv62OJwv
nPAvJf22fpmO0EKFkDlWbu7AVZ1NnmPEaWlIQYDqaW2o4dznIVi7uetZvdIKeMUvvbS51x3DdV/Z
3bKaqjcTL0aXwik/MD6vLxMuRwhk8ClLei4ydlwI4UnOTxHRY+/qWIfgtrtyAw8q9lN5PCv2wEnd
fJbhhxKShkhMkx7kgSp1DQ5btz4mBeHpjU3+k4b+kGfbe2LO6LOHqwTMCW8ovJw6oVEnCORO5Sqb
FCL6G2ENTHeoU9h8usGgrqhUe4uWMwHrS8Fb3feXUF1Ag+/kb/qxgl0YPwW9MWlK1rvBa76Q3n76
xTfxe6gOVmjOzVd9WcPRotHASHj8XzGh6AXIGt6Ls3QO2tXz7924gJJWDCxACS/igbe4v9kqeTok
cBUwIfgTR8wwHwU5k3E63jC5jMlqzwm7DqrE85azGs3dQvwxhck+IrqbqVk0jqSuPk2rX0lZQV78
8NgkGsBBkMfIIbhyzNLw0KiX8FMwnMR9ne882LGoPyW/h/AUQXK9eywhxw9nvGxDqxFXfV9xB5WC
62zQK7kVrTFsy3SAd3y5jmVYU09irtWI7ML5tt8gc6/kFZu+qSCSmy7reZdgChkv5J1cKb5LjJX+
L4jqbNsRbb5wlUprnTVEMyu0C4u3zm713QLH+WbSgobdcYArslMQbQj5DIX5UdIbcWW8JJYDepN2
V0s407r0b2tAH8WJwmTKAoZo3RtIcE/nm/+KMr2gQNcfSY+rePrLpxEFnD48SWIc1ujPG6zi2kni
f2U2K0P+VfAaFqMdfrye+nMPS/uPlfZB2zVC18Aqv74iaBlfufxC+NPKgRy627t0z59zxzPlyzFc
Y/bsf+PnmN4YcnPJGdz/RYR+Qs7+hLq8SiPdnq3cEgKdcuoA0twB5JeOx0ZYRR0L3dHtGb1u+/3p
CUgPVIbbnPakeB4oAoc0K6bXPvONpD2qGsUuHe03OJFdMgCQMWkWx7A8ZZluitzpQvjkyvi8ZKjG
zJkYwsrHkiv1zDb7QQRrGj8D/LCQ5W9YS2r8f9eSPYm+GFRiMAzKHkTO3TmjUUYXqUtyknCVbuv9
f1Ul19Rc/Dky6yTjhbn14knVlyOtcSW3iGZ2IOagkORVIO9cNtvCGjn2IC9K5SS0s083mZsx74at
2QvtrGepzXqkkNdXilgoFrq4uqTlpGCrKHGPqC8lvPoxSzm9Vyf7svrjr5sKlzc3qNrqm04yTBBV
5QMNitgSa7FfQePXnpmQnuyS5UD+DIpvSJuHbswXkgi7u6zBApJv4G5od0P+BZHcMFEoen0fw0NR
MzP5TQ5ueRYhEfOAS87J2EcXtEhDWckWj61MF6WNwXQxlz7hXFDjlrbYbKxvnZnRyJ4Obini/Tk7
eRh5pZdN8ZKkcmfqOUYfKdCGf3hSGObs0CPWWe1dHBVrvTVIgXnIUq45T1byoNETWFGHibJZ43qR
5UiyEcOM8beZjJ1au9qjYXZgcewfVlORMlhq2FHco0aDppDke3RyWmYHUqxB9TzUupKmVX/mlPo1
pi9+E0DGaKT4QOgAWz7vUDJnxMWs8W14mzEyYNVt+piKPrvjPXVAKS40vwZH7+j5Gcz6J8l9ZlYe
GxyXA3D8xy8WAbUo9cNqDKi45JkG5bNI+1eddzprFQPcCimIrwbXki/OIVlQRhHa+h2XVq5cBoUU
6jGugjmhvRL1udeEXIdg3eYfnoziw0VrbmnGBSKURn3l8DJvuVETIXcBw42WN1z/D8i9Zi5DGTYL
RdHLPyyy2Y60tnkj7BQ5PLKo1Mq1IS2/QqObVk1E0pcwyh7hhzcN5sTTLWZQIG6JjLPJ6W4lyUSf
kSkLfWVED+92nNFoW+Va6xeAdOqC+ftg38ajYddxsXtv3xxIiJSlrCM1Y/qcsZHnkX3v8o4Vz7Pj
LBTD9paz0+jJZsdCNXu0TPC05ca0hMXJm9clx0BdEGEtnds3TZxixOW3xkMT68hJdSRe8ksqm4wb
OistBGp+EHJgdfhmFXoIaDTgtYQqBRFMp2F6Gz6zIKqPUE3/lWJKoCUjthdmY5dbQ5cx2b65+0EG
7tjTBUCDahLL3exnekTDkFcd0IU6sZNMo65pRAN7CNBSM1bqTsmCUcYJP8elSRrO1z2EU5ilIRwh
VmQ2KXwnvT8vDtTKlcU2tV4OeUXecFb+fxNODGh2Cdu+aVFtvkB4FUqFJFl7rBQwstYpDm1HFAn9
hbls4w8Fe4BpJ0H39rDOkbTn9pXiZ2cwdQYWz2WUc7itzSptiJtqgY10U6DzDa9ZsJCZTyQPbxTl
DM51l/B17HdZG2JorU37XaxiGYF8wh5nGKf+rPRYBgYiK1AOth5HoEnRxOfvABrt5PdBzA5RLMR9
3bdWiYggcabqVxP9a9BUTF8/gKILJws0KjhOWqVhBmRYFtGyBu88RQpHxNSIM6doxYL4oc4ftHeU
SRNmEinhxGPdGjZkhwQNwhdYWfGuf1Q5pWmpFcvDNcsOztGDn9xZXPvgoFFDLO4WJ/8HFLUnykFO
WbEyIJ2tHEp1draGqAQ4e2rr/UgizmUH8hFXALObeoVk6SCGqtq8TeVHlbdKZe9xXM0BBHVX127q
8CdU0/zcRvHuTGCWnkg8ocU0FzKtivPEv5Hhvuh/7a7s6ognezIwSLctIotvmsZLuKIiG77O7ook
hL09vYA5tR+9JKKkRiOguwB4iTp9T8d0agR+7+MHZTbnikzRHNxQmOicPdBrp9/uVdJ8dzEQ/qEv
ejI5+AjxDt27en+03k823FitY9y/1e5eLKGKEfKh28hdoWuFLNRp4x0+maL9iIOeXe6CeVm9YwqP
c9X4QeB7TQ1E2EalWICWSZD83Q6f8N5WGAy7wAldZTPZyCDcRndFBOYDJUKCbHJyLiAYtl6hW6WA
TmaWoFfv748nO8AkGcQm+9jFjKOrJG4Dc/3fzZcNhHrV4Hv84PwJeCeKuml0vcd+8Xkd2cr7xMdm
aTE+5OtRgtHqZcNpgr8RotXYWWlC6tRCIbUdOO+wrcnOgkxyBFiO4HSdWsTgNeZAwhwmFgY2uVJ8
rQd0dVIeIKJawEHyOE1tzTqsPhuTfsiHxVEaIAfFLIdABTAn/bgHGgUHrWouYT1rleCzohUKKEep
4WLvYYN4lFnyIkM6EpSVxewnOUaR34StcflKVdj5dy1Nb5CKBsKGLYM8gz/aohf2RArCsV2ALFZ+
iQrVRiuqC8PoYu/QfNQ5t6jTdolF9wcR5ovRzcNi34yGgOZtWWrrObv/gU3I6/1Z5jUBBBmOu17i
x2aJOe2rtyhlDX+SSRqhlsCBVwB9+dUFHZWlT5zbUXFKY1vbUAKyh4gWX+pzRRSPv6LQHNmCU1Qr
ORBDah1akD3XpX5QCJT453mI7x7L7gwmnwYJ8jIZTj5l0Zq9Sao34dZZc4fJzY9xt/buvXtNd2Ly
U7ERJyTO7FLgtOBSszGtFdUpvmdboxMHb7D7G5eSbvPdEdSF5XCqisf8yKQJNMpmfO+IPit++hGN
qB+0h8Y+kUQAZ4mIrhxI67f36BqwneDSvQ2D9MQiLJrLMTbogXzWOlnKTErupBhKE1Web2ONjssP
WQ9zSBs4ocdYIhh4YVcHv7zGsSUbhLbGJsv90gjAJpU+RLhJtv5WyKpoiQ3mP+D5u1U4NgKx1P3t
eb2nEjmvIOES9of79CJrhPWRWJKDRqVKQtiTDHw93WTCegv6pIuMTU6rO5A/AAR2VSXIH9bcugnP
KHx2MToJ1Ogp6Wtk9F0awo1KrDWALxFvF67IvD+EXhp3vBNzB1SN0o1L//TQyiO1d8xRJgtFJFz3
en/3At9UYxTZz1ET49bpWeuOnJDnIGGOX2DVEcsm0hlSFt98zYKUdFWZ7JmUlSO76SKOqR9Hjugi
c0oOrVphem4RbcU4MgL/WcxJJy/ttd1RlRudaIHVDe8mFEUR6LtW4e3g1ZADZ2sZf3PCyZAn/Lsv
NEKIRTKJDFzkT4wSfvnx7evgFA8/m+s7TLg0aYtD1Q+3zPLmSQsH8atTSMa82/031eZSWtAJgW7Q
LdhlFScSgB7CdTP+0kjmg+CMju7R4U7EGLDPCCfp2vUplSGorWcvCDGgiSSVMbiPyDafdTOyRYj+
6izNP+C7wGD2UK6PbPRSPc6cpSCkmR1Sa7GWvpmo/xmMnkV9neYe9dLdjZq+N5lA460CpkY8ctiD
Jbq0DAk1u6+Dlhh+Hp4AyKproFbEdiRLZ4wLHZEkXECcQZhSCWgQ7QyDUApkZOolTd/y3KHVobnL
OOWwt2N7xMFcvSmSGiye5egCJRq/Eauxioo+Lkf9K+uItgAdxgmm8WIx+a85XD50qvinpX5PeJFN
Pt5LsIz/FSDQUwtxAPbK3NR6it16QX8Q6kdW1YnMUl16eX8OSKAj0X1J+VXn/UhgVV6TCCJdVJJ9
6JpDQNhL1K+HBn0TnaAoQ1nyn1AUFpe93gYI/VdxHZUQcwfoE9NVuh38Li5DYuqtEhD0QfL4APrH
bqBPxqR7h4lbbpMZjl2iy3H6l2cCx19vfMF+8Urifw5qSZHsNOqt0AAsZUp89akBWtlI/hNuj5fu
Fv6s7aG0Vl4gTLKtlPIXi9PeWFaJ3nneuTRjoaPq081uJSC/aY1K1GMOLBYUV7owajFS/IIDQ1TU
CehXUHGGduV4+NTmVfffSeqz8WcnyWQS3SaEGkcpmZC7iAAhC/SEsC9+w5z4nfu0BxCfPb2VmOzw
6VBopZ/4STBBWLJpRbxRMxSpM9Aocg5rvWm+TaD7P8bhMLvR+aoKaeV8lGG7v1wVqSczdbgxV6Ep
/I3fwW1caBNltwW+9lt3TyH4NsWeS0bvr/IMcv17/EjjtzmEwGXlatRJKUlvTrq11hmLsaS1O1hF
bJb3y7SKLJaeYDczgKYywzMpuLzaal5OKUxKIrfjLHpcvzLB3ClOVuchgz33ZwYrxX4IbwSLKjKc
x1LKG20KhbEB7S3GeeylQWH7JpT2B0qItp2sLZecgIX2n54bOSPBcgGs2wt/HFlHBT0eJOArqpr1
fdHrcXAQ0j8/pcj8BtKOH6vNDL93C5EpvXRQ3TwR0zSXsV1YZXiClxZ71nbEjQePOReDJqiakNCt
6My7/poqiBJNBTt65VEyoqsB15NGxK0dIDJtCJ7PmgU2+63ss6SHjqx1/wvYdEUpZ/GVzOy9N2nf
2/UaX8un6h6B0Hrsn2zvXkbUW5rDckdOYZmrmcvKNEkTiYOMBUEvyCR+YC4VauJpVXI3DU9kpYYz
DkMpZduXAB+B0B9aVlD8oz/6sYOfwpReTbFL/YWWB+uifUS5rtH39A9eBEME/HFQxD3hpJUnptyd
xHGQKbDCKuRxs0OwdIfimuMvRF0Cd0UP9dY4/zit3DuJ/L80BHJ5QG2dZykw/X0Ayaiiu7NSGU8b
26+NEkEGgyVBp2qDcIdUSYUg/EEhQ8jvdKb8/L3+uF8g967Ro91a0QQGtP+oECCjUDJSrbVjmUFq
CJik6QhEYaPCu47iDpkMwn6HrSG6QHe2l6fRdtCi/YDAWD7L2xmR3Yal12Wi3yTnydI4e3zlwQDC
jjm4AWmRmHVxebdHVSyIomAyfoCrd/ths8ULIiZ42r5PDiX2zg+fsTkar4eHs0qMujovwOUMJxML
96+CAxaXdwWN/OB+1oiGH8dOUwbkA6/7SL95BxVY2ahdd/0+mTYqSGnrWtKpQ0oxXpnNxGX95Xat
KxcPuhLrj6t2x2DVFHieGuLZDlDmySB5d7T7/csIeTmqCLPeRcjsSgDMwCFAJyzoQjVoPIV1CxiM
DGG/En3+wqoy7qckMMp9Pch7OrJtJ1kmps0IE7c5uWUR4ZabCS3/wnOoc24NuQbv4bvO5XdH9sEx
lnAb70Kqq2P4A3MwoHD3orlBw+DJ/qU9HVUBhDpXIvMirXT6Z/5WTsxD9u7IrSQO4Xh9ifesJa1u
1fMprPPIzu3dW0py35dQ+7HPWJZfS/CUxyaJ/HMAiToMH2NYXsM6bgxSxHBdr6B4ZB4D4V9Wfn0o
rmq6ghnhvL/dW05YF2l/UKU99heKuy+mc7oVDNGGCKtWjJMjOlgmmYNQWrYRzxG8PMfLWvZKpGLD
4RCPb68ncthEKVMrkZJdChGj1XL5s0f1Alvoikv/7fHqR4ODVXvjkn4EYN7KMYlvk+RQqM9l0IM9
3UQkajUGxTgytmJeuQe9Lr21po6Xlpi7k3an/eu8e2IHocrPBF0ySCTEe5xmmc55iA8YW4YzFbiH
j1FYW+eFTdxSUqrXy9bKXoCSvi/lw/rOdXnpHGyEX5LBxqioOOB522d/mXHhtxNLyaLMOtTtdX14
I4aw7s+BdH6j3Mom3Ps9HQJyB4wHI9ttfrJw/zFDQPUPSrY3V0SJTbJKDBECayBrcpozNaFO4/EC
kZbvjjmq9j38QZ2jKj7OudQg6sQ8xDSsjx32FW+y+kmB1jv68yLkyFGzXeryXUugTM1BahQRb9Ih
8ec2DeOE1MLZf0Ca8xRR/e4KFQJL312AklpREscRp249ickiiaQ0T56gTD/tIdNqOkEJGxTZhPUp
NcBJXCxwevpSuT5eoeH1nCawkroP7FbhgAIx+19yicG23f3h/Sp1kX5G6zq9Ru2Tygz8nnhe+ucm
yHadI8bRZzvuixEgalsdf7rrwEA9dL2kvr6gVl9wxWwgAmuSNOr0MRftlLR2gl5YFjvfZrd3uGEx
/6FIhzh5zcX1ZJGTu/fEinpCqtej09V9enIAl4/qmH/ZAZcqQg872i115kSQg6YpGHH2MapDnW9g
wpJwTWPKu1+/KQa8RSxEAMmcQCh67fBD9ARwAj7BYhjhTydW98sVzwMV/VsGofBuENOjamIuSPBd
RfwhG1OETpXi95BBR75c9CryaEUBRka86RVIARNAaRIa1KMKp9F1btsUrRiCZwVPsKwDLjwmo/GN
96pz0zqRCZSc51aF4+xFdN7wlNZQ9aDNylFVWntICsydt6rqp27i6MR7kxcSMBrwQdjwwjP8Bks+
B+zqO1Rn4Vvl0Y6cnc7nIRHBZz9e52kcW0bvmp+GN8fBHoRyQyZTyisiRsAKW54epdMgFDrkstbU
4UyCUui8/6dBuj+jtsajnPLbKbBe7NqC88dwTCOewYDZmYz0eg32F5qOYGbGB0MJ06dNmWt/6jDB
djOiekKB2EiCOsVAcv+w+PurIPClc0uFdFvsvwLkHvlDYK8CuOHhpZFmnnn/hmyzoF2cprX1G/9/
0uiC+KKrcLDV8KPLUNmyvImmKwSLTiwYtunO8kxhqpfb00UTr/q3ElhC1UzlVw4EFptsxaSIxIO1
1Y3zMG2x0r5Z9P+QeoWFtxpSVtQ9penFDKl8R84R6PvChV00914hZsIgObci3FhOV0XfrQ1jqFfv
ILNk4nXifNyOO2xOkyJGK61M7QPqDMlQ9362ENsxDOWXWCL6CYBs3EWQmRSQoJ/twX9dci1LMsFR
BQ2fLshc+Hh7Cp7NdxdEaVTy77D6TdxbMqHav5et9v2WaQ85BIy7mP6WDlR5RXJc8549No4YPbHa
KROa+O9tPVlRp4gXOk/s4fBF8A3rQgywrq3QljUHG3ADFfp7NfZoAU5ufZ7LLLfY98ZrfeMggXpa
0dBTHG/pcd8IGK+Qmx3U3FN5GJwhcRv4OSuB2v3MjxhAc+4OX1rwvMPpNquaZoeh64p6ZUYEHIt/
KN8I+4xGzuAMzOu7YCWcsohMoN7vmA/LPWtaQd/ea9hrdfNBVYoSg+Wa/uOGLY4nAQbJO197xGos
ihopIZ+LTDlvVIfM+td5INcH3tQKHpWl1BGJFoo+JDQo+P0I2tltYeuZPGYJkxpz6DXq3j3oKSDG
k2jmhRSLUQyAl6GY4Gp19SZTs5vpnbt+OcxUah5vn7AcDtwSrC33UB3x/YHj9diD04qBtkMgaJR/
OB+B2p9mAUroWI62Vku0pepZdHpz78iWokKAuf6UKGUneXsrjCsbqdgMTFtccnkkbdxiFp9vHv8G
+0KVp35xgwHjRCUOue8TvNRTDIPVPKxYjDA8KGbsp+T8FOFQKprj5xWL3OvQO5RQOglDj3lnMbVH
jCxSc6gMsQN16CdsbX7qVCNuq8G4oNVk+9dYOfMr0K28OeVHABbuc3OVTNW7zPm7MQ0iJdaDD/fE
+VCKMCWQlh2cbLdGHYAyvqu1kAaxRd0A7oK+d64VW04PyklyGbRuyYeys8suTmcGeDVhvkboWzmh
IgbAzxKhP4RoB5uJ2FInXQyl/imGzvnQMe/adSiV+5lV/l/Xh4vHZTChbM9ZBHC640H5cz+OEMkj
9hJ+Fn1BmftFQSvV2G6E6Lc6Tm4fSxevJaNZp42oED5H5rRpqfa2yzt7ThguB63jZ8bYImuK7qWv
+SJbbpD1mZqoezAG0Bg0XTDDgKL5LhVCPZDCbdnQWwKgNYu5MVN4S6G2BRhQ4WMVpeSbYPAK92yn
oGStHT3R/EQAZQ26iDODe+TPCFvEA1i3Y2tv9EPQ/93z08uzPht18NjiqlgN6FCi61m9J8KX1ypu
DwoIYM4cVbT3AU4xmoB6Zj1yUJLLbiPTLHo1JkJASsqgioIIhRj6Cg4TvNHv4QrW7FhDIV+ku8rM
IXOxRjbTDQqcsxShv/zZE6eHW3mqjYz/ES1EeG3O9CJhHaN7sbLYHXa1+/yBuVtflT4dWjYxAvjR
wzalYulSARvqD13gqx1x43QOH0DEln8kgPts3OyBQ0xAE5KCeI2EHVjoWqvQWCBNSfIVGNXreclQ
unw+xsjLJ2WJ4FJWq0ltqQ6VSVS1JQX14e6CC55JnekWfUcJ62zjV8Z/83FDmE8M5QvgNshWSQE1
0PnTUVY3qGTkPcwD2DmOM00oLGGA6b/Wlwj3YU5c9AgsCiUn1h3dXJH6soOQUvSyGXoMxUqzJnLK
Oef2wst4HI6iOY7WCcFjES7caMszj+wSCgvgX/IIHQVidd+fMQE1ZJZGg1cnGzs3fhwwXiFazNbS
MA89PS3Kex5RiTQJKomvsfPiSSZhoAmZHcSFvTOmQFaH5SP02qQk6mrSARNPg5UoHMCQe2taNMsr
0KkcQwDK6J06P1Q7nxpMau1+l3ajTByQHJvyzbqris6nOrmKqNvIgRzy5xl3R76hTT8PUFKAPpns
3o51Wufv1qBOTgAFZhmaMh3tbavEaFH7SfKTqwBFz4l5ROpXWQnAfFaPJxxBSlfs3ifhMFh7W0Mu
X7UAcWAMm/hUS1fhgGMdUgekOj0/ddCTCfv//oT1daJOtaiVxMn7J71Q4wik4sG9+R72x0nA6V5E
Xml8b/q1QLj9M8LZqRBgMSYs5RYOZV9SyE/E3oWtkiY/GGaVWs+k2xKLxmZ/9Lyanw5iD2YZ8vlL
ZUaUpMbr1PAHAYpQkPnGLiyr2UbvefJHK4wFSfLYeCgERQ6h0UUNJ2uEaLFSWl81aEfEZ8D6fArY
rttAYgaBRLuctMSWZbNNx79wECo16vJl63AWPbCZ0GNs3tBgOSfmPc2/32GvFOarLNHqS+yVWcdO
wJLSfiHMSQ+nySz7Maoi3IGr9Ro0DT4mQMXQhGuVhGaVjQjHbGsLNCPDnrW/uzsbtGDoJ87w1/Ka
j6FjDRuv9h1N5krqHazTiYocuw8cgBQWuiBCZnKFrqF56UWD1ayi3I7v5WkEwAkAv62Q+O2NTlvU
Yo8pdXrsqLGEcgy/SITYyeZAI7IxND/n378Ch0LFzgGw/qQoLzTG50Usvn22W5V30xoGUSGCw9fQ
bRhB3SbhdJHvaVcMyv/8h9UvlsAckO60boCgnHzx+mmX6jjUNHfhTH7ckXUOZ/JIe6H2a90ge9Xy
cPZKWehhdqsei4cEhNZ8QifBvbG5b6EInsKOsb5j7aO/pXzwurSyOnZTvd/j9QzATzxlSVKqcZRJ
wJuYND/vcRkZC3c6ugiMCVM6ZYT4tuEDbDVqMxnblz2WClbTxyqnNWbd1azQ7HZ5J1V09HAOeqIi
I6iMVglOggNtYYAiyYZs0sLZO2HNJmXsbr+i/8RHvTmIfTSgCB3u+fzzbTwbD3jrSdWMqAsbM0Ts
5G8qh6wGaCWxZ/8ZtfvbndLSJ0GbevM92HpSdJSkin5/3wMoHRUdOCHTsWkQBP+nnUaRDPxKP0+k
7hq9+yU5KypGKNvox01QkiI9tLTtQrjfdwlQwQGB4gN00M31wVGMV9Cz+s1MM9kL+YRCFiomBPy3
8Wz5RULPqnQ12KsrkMa9m7DhrGiNe3JpLu6d52ByMgHt26IFMgvsfwLbeBku9pZ0FLix/rqxakOM
RWS+9o8+9l/2XjBw3mxPcv56UOphRUZHrWkCpk5QRYemrwj5mhsYvtaDnbG3PKdzuYLm+0ehM2Lm
JytBV51w7yIWitsIpz5xYeO3aVE7ymLfULd4nnXY0/ThFy0QHMMxdbbnj5pZu9wP6P8G5f0RkVpi
IonLnXe1pYhtD/rA6Anohj5TVxNgm2DlORc6nmghui2UP+6IDugEAmYwsssvrlWGDzMtWzJiS0HF
4NuFAEWNdCit0Rh333Tqp/bgWujf2Pwsp8VNwnzXPDvt+N4Fx0eE+btpRVYx6s2inTApSCLKSz2E
89o29pF+abIHZbjBR9XRSduriC/mt1sl7qF/lsWliWhKAThCkx6MDVqtTijqLv12EIRLeH5EfU+N
M6ug5KYc34+n+guzlRLHYZ1HWMx4MCzg5LPsIRGrd4xBkSMofDroifwBSG9P4xZ04eH27ZEqaSrh
g5WiLK/Q1L2f3z4S+mELz4oPjwDNb38oGWWudTF6lehmfVxSUUhwZU64CXtbWBjmqW0f+zicdeM1
GD+9dZu/fhB6BnK5Fd44vxB+rrYMaazHIHyW1xrKmDYrDIjbAZgTrpMYzphioYIPb9re+eBTSgUn
7QGKM/ghuVaFJFZu2G1Mz+pj2QN5ZyPXsxzSSmMzDSAlu5PdP2rMWUPNYoHb57DqNHFNP8/2yoFj
6+z2qUu/htoHRt13GiqUeU94niwkoB7WMzbHMTDo/miit/bBPohx7KNKXBOr86qVsvoeakOW2oY3
CsUP4Kz84bExAV15q5vVUGWLVdGxXR/y14EtXCDcUrP8wxfSElIt/HqzQzorEU3/TMDKjcIdSzyq
Ji8D9ErnJIui1ZQSr57EF/m2hZDKYoZFLnGlp0vqYANsfQyrLyOcerQ4Tf4plCdEgeiVSmf1BX8b
cuWkW7Z59HmeYZvKVfrNEEGIew1wrFVL2D0MokPsVw3bnGsZqgS38YtprdKoAoXyKMKCF+iGRs32
w4yyglTL1UH5V7NeStrhv4qnEmsqXj+RRq7Q3lQifXFMHHlSW2IuPtt/g0rwtc5GUXkLT+gJ692z
roBsuoohnEm9KiQgUXJjX/88kBq32KkUHTq/d8rGjHwO5EWcZUawF87lFioaHFWpb6OhTSmyicSu
MlmF1lf8v4OD0oRjAxub+kww4gMQ0SsMCB4jKLKgFdOaV1QQR5FH3gwdu2QH0WTsFfjgkNWuUObi
law3y5pda+aL36X1h7HSsRD4I6DBHT6ywwxjYn1kU9pQo+e0Dy9lyhubmTO/Jk+se+V6c8G0VOy9
vfmkll4PeikqsW/mmL12wZSXRs4E0A5W1k0kbXdAjJqKH1dnkFO9V0UrXT6f9v8RjgqU/Bq+2WLy
UwF84vT+X1rZ2nOrGc2hPvurpJy280cU0KYVUgNAO/OR7h3sdJt3gavklUyCG0j+6e5jcrFXmPoM
Dr1OequG+4n0fZdwxx9XAxEX2myO+ciiSoTiyln7vyfqn/HYmdt1f4meY6xxt8zzPz3KAYO65uCU
bMPVOFKorusMwhe3ytdoQmsDj1gtM3c5JAZPlasc3FfwGuyjNvpYrBRhZ7XRl2hVAIpP2bj0oW1m
wxspuqHTTB5xVYnI9hYXydTlYfo8YEB1jVw6hPZuQUXM0owHIEaZyYIsi+nmf98VfE+Dm+SExlCO
iJSOkZVvQIYvZeWp+vcCv/1EbU0movX/cwQeDLtopm5tulRbvf5J1/ErmeMXEv0pC/cgnw3sx74T
IxpOi/OA/F8u9DevHppFRYXKkWK24wdfu5j9Vs9yN4WeNkkJV7etP0AM+xc/n7NmPGFPuivDZIDW
KBC7aOXeClu8M3j3lRfD7bbeYFZDD9HXbwVRpVENAgTfFtxvqonX12pHAWynTzZGyNEt/F/Lea1h
KaiD8fFHEb+cz81Kd17L3qBwY4XPoGMHJTf77zew8hMpHmcmeSL+eUULJdEEypV3Vw87+obkZJx2
97W+4TwJuWUCFJ1YmYsRY2OEeluPnwW2ws0dnoHOpX9uV0oDVWmHGdS4E1oM37vS/j0yIcKCfIHJ
lOV9I5l02eRuW0MQCrY3x9P5O1rLuE9cEySmfjZgSSiecP323dNBFGnT3xKpKgsN9o8mRrlBFWeC
VlTxjkp3Ap1EKb8Kktw8YmVfhKIwGY1R9Op1EIodABGCB1JbXmN+6sqTkDwEAeSsooQ86QgXUEPF
xVkiZTDCEpd+gf3A3tKApyARI/RDtB1Fv4Oo8ILrSAaulSpftBnySkSWsu9+w56yWDiVDXTQD964
loS70Cse5MYHQRgGIsIsvBejJgCTjxpxAKgxOKungkKicZxc5RSVdaLl19zyVYXBTX8LQPI1ii9d
T+eac56m5bAHmv02txL8zIYm/2bpZ035JiQYEKUl81qTpSryxnwvWeClDA/mLRmnMY/DP5K3f7vK
BId3OJA+OTTm1cJeR7b/VxJErfpA8h2viPcn3FJ6wOLsvwFnNbgF9NlzHvB8jeSLmpJ+NzWaINP1
enBR2yB8Rr9+++RjEwGz3XlDstOvBinK4gw0zj0fZvbOe7gZm6x7ZbhDw89MXt+K8fVIxK4dxlVG
/Kr/skywE9KqkuJMz11G01RV/TFDa6j1bndvZX/sq32rBZ8VKa0lRBn0w0cFkKkuoD4UVdK3l3Ko
5QUhICxkcN1WSurtO/yneuCXJ9KmS+NIM7Td49FX5OUTGnsVJSpstVgrpx7OOYkInPHgF2w1YbUK
RG0d0omC4WU8aM4Vjohkp3slj2qUwq0Dab14XtAUXjAIiPMjf79tJVw7w+X4ewD/tirWW7wwB1dy
onrc12OyhOux7GADUumlUaRFBcVoX1GWEYrOMULbFgRS7I22YmlLhKOeSbWJSP8VmssV/6qFnA5u
F2D0lspVSI+ZL2v2NgPXCZqjIffXYRwOA3IMZbwfdUs0YAiEsOanW/RAN988Lcf5cM9ZpsASlFtO
U27/CWU3aKxQRyoPJXjrPqKfSq4rWZa4f5nWNxhcQJqzH1YO26+MAw9gIHHbq2yiZoWp3U/kET7h
JuZokqM6hBNgBsrmub8347zH55MLSU4AuMI51Tl/Rn6T65OUa+OINxeTGmEZvfR7oDS0byibqr33
xnYWkiwA+aJnO4BNsPiwFPLxJ2xCpi2/ozxvORx3MY1QW+wVxrGfHeZ4jxmo6VW80i+TobqJ4cvY
vMs1p6uSQEdFelEfL6k/oHrINFhvQD5BvJz2s6OcTKOOrob66FDlAamKwyot+h3DAFtUWVkqST6R
OHl8pfhacfCHQsOh0RjBzDz6s04KRiBfwcGxZnU3tB7yIjmJk2Q79qXjr7LwiPk38gjUVHYUdIKo
p6keiuGBaxV5zGvjwiypN0vrUU8Reuo4DunyY2W2+yd7E2+SXkX+o/5yHCCOVXwK9th1HCPioT3J
Xuovxw1fQHuGDWme60i5ICZxoZRl1bp4ZlhFT5KzC0+vdhDjPbyoWpVqhuv6UyPpS+IbZIyVibs+
SAskM4ibeY83Nes2LSj3jyWjZZnDPOz+yeNSwQ8jHPgihDfgr3PAvkKcowvmFNtw8JZaVf4A7Ofr
ZfWZSaj0NKwfZDKvbAMsJ/e3YnDIwd4ryHhoh7/f5lnVA1Cbitokr4+rNvBmC59t9hKIy/3HDz0i
XPTL2FVwER5KuuFDRMStZgI6RnG1Gw2uay+pAg4L/80uEJbLkx9b7ySJeFHGsZ6IjUnqyhDWGDoW
iGdZ8zMzlCry1W+6jhYGuXfDDNIor7K7JbUKyE8koF4SI5uszAo5tX2+OaT9VX00q7WtyjhAUPg9
rjE53a6aV9a5tJ59O7LKYm3/pX+aSRujD6CO71mvc0SsLnnxq1/gZtqNDWidHFabNA6CS8FDSyb6
5WhB5D3c3Yssz4UF17p1sv921lmbwO6gfXMtnMLXIRjToAS/iWT0HthXfx7t4jg+zNlLW/pkba+n
ClisSitTfjjGC0IVKEv50pMV88A8Xyq05mUFKvPGS7c2BJ0WKvjLzNBA18Pf2y4D52pXGTo1RsGt
bOY4lReRnkBxkp1AvgOLzJG1sX52JF+CvnuJ2DquA/7qyqdWqZYzD37OKx16/0pMJ4TvA+cZ20C5
9n50GkKBmjOEvt+Y86DXoEehtdIgJYMYhmgGVCmj157O89YRd9ddi/RXUy8MY9LzHm0z/hS3mmo1
6vGkpotE8T+RlMEG0uw81ml/8cx0gS9txvRNp8/YLnFrAludXh2DhQv1oe9lv8EJTj28l3WEN2b9
XycNFHPO12o1qhMmcef8xJy92W8B9DNlyzE0PGUncS9vXVqBaw+01UhvZ0uZNFlymbXLqnAB/bs4
bkvklITIAJ1FrOzoe0uDojjyF3AugKrW/5G9oNQlZUEAYTFx2mUEtaVtSYJTb1jL3RpPuphB3sCI
E5t40ZeTTkmdjPsdNjMPETt0sUz/R5mVWER6aU0dQiCh8ijnCCq4jbmkswCUuQ3cTy02+Gmid6Mc
GiBkGj4oU0mEeNx4w9BFkCHjJ/SsY9X9XjVkpfyvbHYGKRFtK63YhqCIB0887VQI/wYaWJMToghU
zI2fl4mqaI4xrMleWtaXQQ5h1AbVP39moKbFndClCSZQCZWU0cZq7t0o/hArGbDfSs9G9YQ/rBXT
ly7mFe41Au3fPqPGQrSkqSe972eyJ7C1E4GQanyYXnMXG+VRJ0ZU2yd0YDR4b+OA2LUQFxhA5WQ+
6Ud4YK22ShlDVJu1TEWgqEYEHh5300Kd93GmWh4HUNGP0pafGAiDBlKzsZKNysRF6NoikYY3+19L
VOXk8nKV5MOjbXJA44zlafQxlfdqgMF4f+YNXRaY+9tTJrl5EB0agOOrNYlylYl0TPJs1VKV3eDX
nORznH6miETgNRllZjEH0wmSwupBNad+jWArUs4J5i/IeBNOFUIdmYIwxrdnpJhfQnQOglWSsGAQ
sbgzMqVaqf/8RCw+MUKElerNcTpnVdW7AD3fnjvqJQV/UX7/jNqGedRtnrE5R+MeLDDPgJ0DN2LZ
dQLH2Be4Wl4OR+4q+tXnUbgoekO6imXs+sFBFhVO8EcKE+m45IAYWZg9PiPqWcM2aG6n9EZGPRkc
oKyHp46frDK+e9L1UGIdwLDcGisjHZv02hbAjsZKtGO+3jAhJsj4jS4Com8R9Bf0Edijqwy+hYhw
yHEVeXFwXd7riOjj9k2UgkgA40y0h78AVv1c4XCUt6IyhIyjbwdAIBb+h/HOs7PudG7Zg9bGD8eI
DBoyAHKQ+FZVSKNP0PjmuR73S79i/f98d2GZN4B32Tw4lL/QzclICpfORLxeRzxx1nzEL3ctOKnh
Y9y4Txzp90/o5HnphJ4K9iRIcHDy6CAFQ8ZGGFPgiqvExpzHuntRePczUVckhMOPFlnJe9C1MXyW
vYlssAKNTKYC+zvqis15EODR2Ayn/vavBGDjmKoqRm5+z9wA1gzVfEOHxfDSso9zRhiidD9FwFnh
HioTT0y+Bi7NMwzQRa7qPYu+pk4CcpB3nxEd0bpFPwn3N6+HoLMVcjM/BQwt7N/u4rcARnWC+3C2
dNSmDzoK8N1HDNv3sxr920E1N4UwIa6KRtU+F1OCFyNlMzn3C/EaybOeEmQX+VlFPsY0ydfb1uzP
kUmE3yRqPm2pF3B5nb8BUhq/Wo0kPqr22ZaEDE2bfVUuXq1ved/aPj+IIO4Q3O0BoSDoK7l5BLfZ
17dNFr3CI4LLMedSTPmI+XQu6Ondj4fqEIvrZoUftE6bHW65It5MIeIX5OR6YjgIKuGnJtsJYaoE
xkT0ub+XIvV88gWM/KKo/9dMw8McTpiYgRP5QSzAThE93cHStxDADHxHwAQn57VjdEmuFUeQ/Mop
BNu/1JSreetwo5nWV0C7VOgKR0eYHbJwSdIXSkNteKeWEIiyXnz2LXj4DoFlhvEOEJFwgeR673TP
aNpZq+YJzW1uI7xHrUpDF/FYhSOR1MNp80H/Fl6QjHZ+CY0wKb/OWW4Ly1wRB7ATQfL66KUgBjc8
0wqE2FIMVbUdHNUNg3/6TXgbJIpuCOkUeivrjGiO2VVIQ//81myHqnEX474ytykANyQak++7UdY+
OazAxK2wFpEx1zLG0wPuJK2VyIUtLFi2xjYqUKkMxUhKvl0boeOn6rOWnAr6qRQNCok2GXMf/UWR
oM6PvfY6RT/27LrdyPguiQd/7uwWyJGqrMpbx8xreogxwoVuyuWoh6uhTliLXazT/WyTMJe5i3Gw
4ZW61sZb0N1kUBAsHo0ZY5tXvbH0VkXZHZ6jyU7ASyGQYO6RfoJ206sYRclivaVFYulxG/GdbYcq
kxLwtSvx8/ph2wG9dlyAOt05BbKM3qJbUMB8X4GcQDE6TcCrplh+pkmnBOkSF7kekqRtHf1YsgaL
Cc1NpaTgdO31cosiPcLvOxFpJYUYMUSCstRbE4iR4W0QHf/WnIqMPH1GoOMBu5nEJJsUGoVAGWy9
eCSJzs7kFZlPt1V5oqHLAxFVaZFYXWw8NB5lkpLr6uZnCpIyOpbmMKgp5un/caikWWMbxhAMbDcE
E5pidlKy1x+FVmXK7b3YyiHRbppr6CZ6svKMtZnQO9smKPcHHtT83KRtqOcEG2dPBB6Gn9dEH+Ed
VbSYYXkaaw24VgIXG6Jq4vXrQ0gQR5AKrxSahWjSqwg/06iYyGb24IAOYsOcJ6wOGMFca6ZTS8r+
ChPpsiDgttQTjTaDfAXj/Lb0bpDc57IQjr8l/UvmmKWaVe5kt1sfYGWbsp2HKBu52Vz1TgToukb+
DfW3YpzT2srigQ6Nnrjq8laHsmwY7f9a+adE0M3ukNVIn89rjr12WjC4ggiXXNKj2Rivnql1T184
xyuV2vFuYYVmhpk75LLTswLXr5G2vVH9Ldkn7nP49XaUZVpF6v7yGGeWusbUawsQN9wGG1AwrFoo
Al3wV9JRq/xn2qPe+U2Wuukpk9Fbgj9A66V873m+o1OsuM/XztuUirB6gbPQdMz8ZmBwjqdP78VK
ayUmjU9f3wqSTMdac6BvRe0OI5zMvXStmJMKyc8kdtqndZ09YYbfnUEl1155L6WN2x04RLDnKM4y
0ZwrE824xKYwPkMDR/o9ewI/WuGILnQLVDVapn+T1HDNwn87q9IZueWJoVB9BqIMBAXRkSR1QYjD
5aXTOny5RKtu1Ppc73ppJDiB9R0M9kPmsC2FVyjrz9U11WE/hxKUQUB4Oa77F1bYoEIlJYNjtFm8
4zI5uv3+xSaPswoppz99n1BmFJmg1Uzs280tzGiwMKYCbhQo3UswFphfsPflkSL67KRtlnKOVS+8
dwQT0MGWXiI7R7CfNvP1klivubvu6XpzbMnrdnRuvdYjnXX4Z52Ccm7JYs2o6eAyC12M2a0uMMfP
o2Dwif6Q/vTh8MKMQrNVUsmjG1c+f6D/LUImn1LkfEpFlFiuHbtQdx81HyzKMwX3EtqNcDHFxYBf
zHk/hW6t0stUbcwCOIuBwDA7YLCkJkopw1OrhqoeHVHtupTL6C5YNbvk0x494+COaH9fbHUaQTsm
CS6D9HvrxHaF92zD6H2hODroshZe6iDM6/wFCD/EsYbkf7rDdIryOb7qrWV78ZJwLSjFQL8P5Ebs
KywtTzXu7mwr70v3pjR2sKN9HGuxPS8uS4S/1L19grP43sL11RHxy/fprvQ1CIDI28553i38az4p
uz+nD75sz989TOhoL0lNj1rI7iZf4AFCH1OLSFy4dw/Gjx4x76k7qoSn1ZTH9z7mmbEddjDI20N2
lHzndNJ33M0J/mkiDtl4spTUoUEY2fw7WjEG9KDcUD5YP78PP7H/YEwC5TJYEMK8TNbwXpQjr/qq
pxZfbeHBEpmW42OEXrrreKWwN0qecRerAdAFN4zbmzO40r5cTm/2/EZxQhfKErAXblCe5qIoLjWM
b7tLwZRX4srTpNh1Ddqs6Yh/DtJokW5lfW9FD5xYqYnKiUl3uAxb5503DtDtsjWk28mmrxP+bsQM
uw92AZZXaS7TDGR1aoM+XAjS2bIqMB+KkSMysU8kcwsTpI8qM/YD2RgJMnhvYoqNnxirlhTxY1et
ULfkLKbroRk7EELk2crF+m8PjfX/S49I4YcS25GU1W/skIBnhnM3z8mfrGXpAe6L03qtsUzKwOnT
CeMZprMJd0T3Aut9mAJ+qtolykE9fwT1IunQVDj4QXsoheh6pHDqwdhJByOgKK3IyKH9mbcesc2L
Pyx+v+kCVcqLBZoGcDCbt/296x9W0HkTnyWn49neZCUK4nSoTpvrGZ3yn4AfyVznALeTxJpP+3NV
1rbM9zcWcUitrRRpi4tSedE7P7mTMJiClWllBGuO5xi/wL5ML72BjpUHMYNf0g3Xc5UL7AlEY2Bv
t2oNJgJYgtA3uzq7e06QKxhzr3Cp/ERCzm6YAPt5wRDK3g6FMyKD6GyW2WW6Ojx8FlZtXRRLX2k9
ZQuJHM2DtCsRI8P7x9wRAmcORI+PU+tlPwgxsereRdziQGroRSmDKgnzowUICQKfqWoen6xIKwlO
JZKI2gYJAyYEjrKknjHbPFWC0MjWemQeB4sMk70SmfIEVPs2z5Y2yuljSI5kvnAI6+2BtEBwVcxm
YdxzIHWfHqMkUT2Ys7gEiRziUUB8WejZfuL0uKDXYts4Juf1VdVOLQXBB3+XH2PWmDf9V+sMxexn
SnQ25SCGlsnhgskKzPgkY3ZoWMqgobnPCvZY26cs/YpyRMZLecDdzV/kC+Oi3iYLo+DPByg8rQzm
Hsr+X99Fa++3A4f2/+KZwWIjdFkSR4CYLlMzeOw0aKCMHu0gTWxFRw9c45fu6Ylb8BxC9DSb+s0m
67Js5PM16+Ue77HkQ9myek6TBCg6wZR3LD5AjsCJcw4OYssLh+WXxRO5oaiJdgQQeF/O65ErAIWO
1pTYYHl3xioieeSeKp+Hny2PksoxF3UlYnfo7C6Hc4tbMY4Z0hF0Cle5TMzCS8rphrgo45Ou4kKO
EethKz1pKW4t0QG8FAwS4g2iIOkdzH0viUS0r6OjfZ8rSvUj+QSV1DJt5lJgQelT/ZXyzBPxUJN7
u3pjCr9aU/D41NeMI9ADM5kP0PAnvpbPs5/S96uCK7wKxW7eJcuFDjqM40YjjC8V
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
