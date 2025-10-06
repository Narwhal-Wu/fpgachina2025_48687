// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri Oct  3 18:05:45 2025
// Host        : LAPTOP-FB6BI1PT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               d:/inbed/workshop1/AHB_arbit/AHB_arbit/AHB_arbit.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [4:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [4:0]addra;
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
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "32" *) 
  (* C_WRITE_DEPTH_B = "32" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "kintex7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 19520)
`pragma protect data_block
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
CvejCtUECjtcqB9A49+eUHFbNM3XyRsThhY=
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
