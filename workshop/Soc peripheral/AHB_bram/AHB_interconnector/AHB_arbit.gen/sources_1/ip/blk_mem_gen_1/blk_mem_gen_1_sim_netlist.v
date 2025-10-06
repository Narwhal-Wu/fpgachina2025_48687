// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Oct  3 18:06:36 2025
// Host        : LAPTOP-FB6BI1PT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/inbed/workshop1/AHB_arbit/AHB_arbit/AHB_arbit.gen/sources_1/ip/blk_mem_gen_1/blk_mem_gen_1_sim_netlist.v
// Design      : blk_mem_gen_1
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [4:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [4:0]addra;
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
  wire [4:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [4:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "5" *) 
  (* C_ADDRB_WIDTH = "5" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "9" *) 
  (* C_COMMON_CLK = "0" *) 
  (* C_COUNT_18K_BRAM = "1" *) 
  (* C_COUNT_36K_BRAM = "0" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.375199 mW" *) 
  (* C_FAMILY = "kintex7" *) 
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
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "3" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "32" *) 
  (* C_READ_DEPTH_B = "32" *) 
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
  (* C_WRITE_DEPTH_A = "32" *) 
  (* C_WRITE_DEPTH_B = "32" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_1_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0}),
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
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[4:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[4:0]),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 18976)
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
