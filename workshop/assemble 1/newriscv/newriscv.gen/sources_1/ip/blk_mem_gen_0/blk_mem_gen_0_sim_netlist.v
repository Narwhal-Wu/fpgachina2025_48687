// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Nov  1 16:41:57 2025
// Host        : LAPTOP-FB6BI1PT running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/inbed/LibreCore/workshop/assemble
//               1/newriscv/newriscv.gen/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_sim_netlist.v}
// Design      : blk_mem_gen_0
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7a100tcsg324-1
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
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA ADDR" *) input [9:0]addra;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DIN" *) input [31:0]dina;
  (* x_interface_info = "xilinx.com:interface:bram:1.0 BRAM_PORTA DOUT" *) output [31:0]douta;

  wire [9:0]addra;
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
  (* C_BYTE_SIZE = "8" *) 
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
  (* C_EST_POWER_SUMMARY = "Estimated Power for IP     :     2.96495 mW" *) 
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
  (* C_INIT_FILE = "blk_mem_gen_0.mem" *) 
  (* C_INIT_FILE_NAME = "no_coe_file_loaded" *) 
  (* C_INTERFACE_TYPE = "0" *) 
  (* C_LOAD_INIT_FILE = "0" *) 
  (* C_MEM_TYPE = "0" *) 
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
  (* C_USE_BYTE_WEA = "1" *) 
  (* C_USE_BYTE_WEB = "1" *) 
  (* C_USE_DEFAULT_DATA = "0" *) 
  (* C_USE_ECC = "0" *) 
  (* C_USE_SOFTECC = "0" *) 
  (* C_USE_URAM = "0" *) 
  (* C_WEA_WIDTH = "4" *) 
  (* C_WEB_WIDTH = "4" *) 
  (* C_WRITE_DEPTH_A = "1024" *) 
  (* C_WRITE_DEPTH_B = "1024" *) 
  (* C_WRITE_MODE_A = "WRITE_FIRST" *) 
  (* C_WRITE_MODE_B = "WRITE_FIRST" *) 
  (* C_WRITE_WIDTH_A = "32" *) 
  (* C_WRITE_WIDTH_B = "32" *) 
  (* C_XDEVICEFAMILY = "artix7" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  (* is_du_within_envelope = "true" *) 
  blk_mem_gen_0_blk_mem_gen_v8_4_7 U0
       (.addra(addra),
        .addrb({1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0,1'b0}),
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
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 27920)
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
