// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Sat Oct 25 21:15:34 2025
// Host        : LAPTOP-N8FCCN37 running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim {d:/M/nk/verilog/openRV/myq/LibreCore/workshop/assemble
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
