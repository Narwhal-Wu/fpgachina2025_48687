// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Thu Oct  2 14:13:02 2025
// Host        : LAPTOP-FB6BI1PT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/inbed/workshop1/AHB_bram/AHB_bram/AHB_bram.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "blk_mem_gen_0,blk_mem_gen_v8_4_7,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "blk_mem_gen_v8_4_7,Vivado 2023.2" *) 
(* NotValidForBitStream *)
module blk_mem_gen_0
   (clka,
    ena,
    wea,
    addra,
    dina,
    douta);
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME BRAM_PORTA, MEM_SIZE 8192, MEM_WIDTH 32, MEM_ECC NONE, MASTER_TYPE OTHER, READ_LATENCY 1" *) input clka;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA EN" *) input ena;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA WE" *) input [3:0]wea;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [3:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [3:0]addra;
  wire clka;
  wire [31:0]dina;
  wire [31:0]douta;
  wire ena;
  wire [3:0]wea;
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
  wire [3:0]NLW_U0_rdaddrecc_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_bid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_bresp_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rdaddrecc_UNCONNECTED;
  wire [31:0]NLW_U0_s_axi_rdata_UNCONNECTED;
  wire [3:0]NLW_U0_s_axi_rid_UNCONNECTED;
  wire [1:0]NLW_U0_s_axi_rresp_UNCONNECTED;

  (* C_ADDRA_WIDTH = "4" *) 
  (* C_ADDRB_WIDTH = "4" *) 
  (* C_ALGORITHM = "1" *) 
  (* C_AXI_ID_WIDTH = "4" *) 
  (* C_AXI_SLAVE_TYPE = "0" *) 
  (* C_AXI_TYPE = "1" *) 
  (* C_BYTE_SIZE = "8" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     3.53845 mW" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
  (* C_MUX_PIPELINE_STAGES = "0" *) 
  (* C_PRIM_TYPE = "1" *) 
  (* C_READ_DEPTH_A = "16" *) 
  (* C_READ_DEPTH_B = "16" *) 
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
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "16" *) 
  (* C_WRITE_DEPTH_B = "16" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0}),
        .clka(clka),
        .clkb(1'b0),
        .dbiterr(NLW_U0_dbiterr_UNCONNECTED),
        .deepsleep(1'b0),
        .dina(dina),
        .dinb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
        .douta(douta),
        .doutb(NLW_U0_doutb_UNCONNECTED[31:0]),
        .eccpipece(1'b0),
        .ena(ena),
        .enb(1'b0),
        .injectdbiterr(1'b0),
        .injectsbiterr(1'b0),
        .rdaddrecc(NLW_U0_rdaddrecc_UNCONNECTED[3:0]),
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
        .s_axi_rdaddrecc(NLW_U0_s_axi_rdaddrecc_UNCONNECTED[3:0]),
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
        .s_axi_wstrb({1'b0,1'b0,1'b0,1'b0}),
        .s_axi_wvalid(1'b0),
        .sbiterr(NLW_U0_sbiterr_UNCONNECTED),
        .shutdown(1'b0),
        .sleep(1'b0),
        .wea(wea),
        .web({1'b0,1'b0,1'b0,1'b0}));
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19456)
`pragma protect data_block
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
3/9cSiJ54waAUImi9vUXSWULsw==
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
