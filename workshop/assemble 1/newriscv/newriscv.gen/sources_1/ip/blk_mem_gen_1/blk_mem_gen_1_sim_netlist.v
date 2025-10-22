// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Mon Oct 20 02:15:59 2025
// Host        : lsh running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim -rename_top blk_mem_gen_1 -prefix
//               blk_mem_gen_1_ blk_mem_gen_1_sim_netlist.v
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27120)
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
