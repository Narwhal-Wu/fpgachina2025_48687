// =============================================================================
// AHB BRAM contoller
// quasi supports AHB-Lite can  byte /half word/word read and write 
// can handle continuous read and write use a register to store the address and data
// do not support burst and lock transfer
// =============================================================================
// the BRAM should have one latency cycle
// the BRAM is single port, have 32bit data width
// the address aligned handled outside this module
// =============================================================================
// 2025.10.03 edition v2:
// -fix the bug of the HRESP signal
// -simplify the code
// -add more notation
// -HRESP not tested no further test conducted
// =============================================================================
// 2025.10.02 edition v1�?
// -only for forsee the wave
// -the additional notation and the simplify of the code haven't done
// -the HRESP considers HSIZE, HBURST, and bram_2BUSY
// =============================================================================
`timescale 1ns/1ps
`include "ahb_defines.vh"
module AHB_irom_controller #(
    parameter integer DATA_WIDTH = 32,
    parameter integer ADDR_WIDTH = 32
    )(

    //=====AHB-Lite slave interface=========================================================================
    //global signals
    // Clock and reset signals
    input  wire HCLK,        // AHB system clock input
    input  wire HRESETn,     // AHB system reset input, active low

    // Slave select signal
    input  wire HSELx,       // Slave select signal, asserted when this slave is selected

    // Address and control signals
    input wire     [ADDR_WIDTH-1:0] HADDR,      // Address bus, specifies the address for the current transfer
    input wire                      HWRITE,     // Transfer direction; 1 = write, 0 = read
    input wire     [2:0]            HSIZE,      //simplified here// Transfer size; indicates the size of the transfer (byte0, halfword1, word2 etc.)
    input wire     [2:0]            HBURST,     //not use now// Burst type; indicates if the transfer is single, incrementing, or wrapping burst
    input wire     [3:0]            HPROT,      //not use now// Protection control signals; provides information about the bus access type
    input wire     [1:0]            HTRANS,     // Transfer type; indicates the type of the current transfer (IDLE0, BUSY1, NONSEQ2, SEQ3)
    input wire                      HMASTLOCK,  //not use now// Locked transfer signal; indicates if the current transfer is part of a locked sequence
    input wire                      HREADY,     // Transfer ready input; indicates if the previous transfer has finished 1

    // Write data bus
    input wire     [DATA_WIDTH-1:0] HWDATA,     // Write data bus; carries data from master to slave during write operations

    // Transfer response signals
    output wire    HREADYOUT,                   // Transfer ready output; indicates if the slave is ready to complete the transfer
    output wire    HRESP,                       // Transfer response; indicates the status of the transfer (OKAY0, ERROR1)

    // Read data bus
    output reg     [DATA_WIDTH-1:0] HRDATA,     // Read data bus; carries data from slave to master during read operations
    //=====AHB-Lite slave interface=========================================================================

    //=====single port ram BRAM interface=========================================================================
    output reg  [ADDR_WIDTH-1:0]       bram_addra,   // BRAM address port (write/read address)
    input  wire [DATA_WIDTH-1:0]       bram_douta,   // BRAM data output port (read data)
    output reg                         bram_ena     // BRAM enable signal
    //=====single port ram BRAM interface=========================================================================
);

//from vivado AXI 
// Example-specific design signals
// local parameter for addressing 32 bit / 64 bit C_S_AXI_DATA_WIDTH
// ADDR_LSB is used for addressing 32/64 bit registers/memories
// ADDR_LSB = 2 for 32 bits (n downto 2)
// ADDR_LSB = 3 for 64 bits (n downto 3)  
localparam integer ADDR_LSB = (DATA_WIDTH/32) + 1; // 2 for 32 bits

localparam  bus_FREE = 2'b00,
            bus_WRITE = 2'b01,
            bus_READ = 2'b10,
            bus_IDLE = 2'b11;

//the generation of HRESP signal
// the HRESP will be high when the HSIZE > 2 or HBURST != 3'b000
// or the bram_2BUSY is 2'b10 which means there are too much task the bram have not done
// the HRESP will be high to indicate the error
//=====the RESP and HREADYOUT=========================================================================
reg HRESP_reg;
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        HRESP_reg <= 1'b0;
    end else if (HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HREADY &&
                (HWRITE || (HSIZE > 3'd2) || (HBURST != 3'b000) ||
                (HSIZE == 3'd1 && HADDR[0] != 1'd0) || (HSIZE == 3'd2 && HADDR[1:0] != 2'd0))) begin
        HRESP_reg <= 1'b1;
    end else begin
        HRESP_reg <= 1'b0;
    end
end

assign HRESP = HRESP_reg;
               
assign HREADYOUT = 1'b1; // always ready
//=====the RESP and HREADYOUT=========================================================================


//=====the read write signal processing=========================================================================
// read_pending delay register because the conteol signal comes one cycle earlier than the data
// indicate the read operation
reg read_pending;
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        read_pending <= 1'b0;
    end else begin
        read_pending <= HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && !HWRITE;
    end
end

reg [2:0] hsize_r;
// hsize_r used to latch the HSIZE in control phase
// if there is a read the hsize_r will be used to decide how many bytes to read
always @(posedge HCLK or negedge HRESETn) begin
    if (!HRESETn) begin
        hsize_r <= 3'b000;
    end else if (HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ)) begin
        hsize_r <= HSIZE;
    end else begin
        hsize_r <= hsize_r;
    end
end


always @(*) begin
    if (HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HREADY && !HWRITE) begin
        bram_addra = {2'b00,HADDR[DATA_WIDTH-3:0]}; // mapping the address to bram address space
    end else begin
        bram_addra = {ADDR_WIDTH{1'b0}};
    end
end

// bram_ena control
// in read operation it is valid immediately
// in write operation it will be valid in the next cycle
// in the case of write followed by read the address and data will be stored in a register
// and send to the bram when the state is free again
always @(*) begin
    if (HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HREADY && !HWRITE) begin
        bram_ena = 1'b1; // read operation, valid immediately
    end else begin
        bram_ena = 1'b0;
    end
end



reg [1:0] offset;
reg [ADDR_WIDTH-1:0] bram_addra_d1;
always @(posedge HCLK or negedge HRESETn ) begin
    if(!HRESETn) begin
        offset <= 2'b0;
        // bram_addra_d1 <= {ADDR_WIDTH{1'b0}};
    end else begin
        offset <= bram_addra[ADDR_LSB-1:0];
        // bram_addra_d1 <= bram_addra;
    end
end

always @(*) begin
    HRDATA = {DATA_WIDTH{1'b0}}; // default assignment to avoid latch
    if (!HRESETn) begin
        HRDATA = {DATA_WIDTH{1'b0}};
    end else if (read_pending) begin
    // if(register_active && (bram_addra_d1[ADDR_WIDTH-1:ADDR_LSB] == addr_reg[ADDR_WIDTH-1:ADDR_LSB])) begin
    //         // according bram_wea_reg combine data_reg and bram_douta read write circle
    //         // if there is a not done write due to read after write and the address is the same
    //         // then the read data should be combine of the write data and the bram_dout
    //         case (hsize_r)
    //             3'b000: begin
    //                 HRDATA = {24'b0, (bram_wea_reg[offset] ? data_reg[8*offset +: 8] : bram_douta[8*offset +: 8])};
    //             end
    //             3'b001: begin
    //                 if (offset < (DATA_WIDTH/8 - 1)) begin
    //                     HRDATA = {16'b0,
    //                         (bram_wea_reg[offset+1]   ? data_reg[8*(offset+1) +: 8] : bram_douta[8*(offset+1) +: 8]),
    //                         (bram_wea_reg[offset]     ? data_reg[8*offset +: 8]     : bram_douta[8*offset +: 8])};
    //                 end else begin
    //                     HRDATA = {DATA_WIDTH{1'b0}}; // out of range, return zero
    //                 end
    //             end
    //             3'b010: begin
    //                 HRDATA = {
    //                     (bram_wea_reg[3]   ? data_reg[24 +: 8] : bram_douta[24 +: 8]),
    //                     (bram_wea_reg[2]   ? data_reg[16 +: 8] : bram_douta[16 +: 8]),
    //                     (bram_wea_reg[1]   ? data_reg[8 +: 8]  : bram_douta[8 +: 8]),
    //                     (bram_wea_reg[0]   ? data_reg[0 +: 8]  : bram_douta[0 +: 8])};
    //             end
    //             default: HRDATA = {DATA_WIDTH{1'b0}};
    //         endcase
    //     end else begin
        case (hsize_r)
            3'b000: HRDATA = {24'b0, bram_douta[8*offset +: 8]};
            3'b001: HRDATA = {16'b0, bram_douta[8*offset +: 16]};
            3'b010: HRDATA = bram_douta;
            default: HRDATA = {DATA_WIDTH{1'b0}};
        endcase
        // end
    end
    // else begin
    //     HRDATA = {DATA_WIDTH{1'b0}};
    // end
end

//=====the read write signal processing=========================================================================

//=====the handle of read after write busy=========================================================================
// reg [1:0] bus_state_d1;
// reg [1:0] bus_state;
// // bus_state_d1: Registered version of bus_state to track previous state.
// // bus_state: Current state of the bus (FREE, WRITE, READ).
// // the bus state used to determine whether there is a write followed by a read
// // which will cause the bram can not handle in time
// // the bram will first read and wait time to write
// // so a register is used to store the address and data for write operation
// always @(posedge HCLK or negedge HRESETn) begin
//     if (!HRESETn) begin
//         bus_state_d1 <= bus_IDLE;
//     end else begin
//         bus_state_d1 <= bus_state;
//     end
// end

// always @(*) begin
//     bus_state = bus_FREE; // default assignment to avoid latch inference
//     if(!HRESETn) begin
//         bus_state = bus_IDLE;
//     end
//     else if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && HWRITE) begin
//        bus_state = bus_WRITE;
//     end
//     else if(HREADY && HSELx && (HTRANS == `HBURST_HTRANS_NONSEQ) && !HWRITE) begin
//         bus_state = bus_READ;
//     end
//     else begin
//         bus_state = bus_FREE;
//     end
// end

// reg [1:0] bram_state;

// the bram_state used to determine the bram state
// not used now to simplify the code
// but it can help to understand the working flow
// always @(*) begin
//     if(bus_state_d1 == bus_WRITE && bus_state == bus_READ) begin
//         bram_state = bram_BUSY;
//     end else if((bus_state == bus_FREE) ||(bus_state_d1 == bus_READ && bus_state == bus_WRITE)) begin
//         bram_state = bram_FREE;
//     end else if((bus_state_d1 == bus_READ && bus_state == bus_READ) || (bus_state_d1 == bus_WRITE && bus_state == bus_WRITE) 
//               ||(bus_state_d1 == bus_FREE && bus_state == bus_WRITE) || (bus_state_d1 == bus_FREE && bus_state == bus_READ)) begin
//         bram_state = bram_WORK;
//     end else begin
//         bram_state = bram_IDLE;
//     end
// end

// reg register_active;
// // reg register_active_d1;

// // always @(posedge HCLK or negedge HRESETn) begin
// //     if(!HRESETn) begin
// //         register_active_d1 <= 1'b0;
// //     end else begin
// //         register_active_d1 <= register_active;
// //     end
// // end

// // when there is a write followed by a read
// // the address and data will be stored in a register
// // register_active: Indicates if the address/data register is active (holding data for write operation).
// always @(posedge HCLK or negedge HRESETn) begin
//     if (!HRESETn) begin
//         register_active <= 1'b0;
//     end else if (bus_state_d1 == bus_WRITE && bus_state == bus_READ) begin
//         register_active <= 1'b1;
//     end else if (((bus_state == bus_FREE) || (bus_state_d1 == bus_READ && bus_state == bus_WRITE))) begin
//         register_active <= 1'b0;
//     end else begin
//         register_active <= register_active;
//     end
// end

// reg [ADDR_WIDTH-1:0] addr_reg;
// reg [DATA_WIDTH-1:0] data_reg;
// reg [(DATA_WIDTH/8)-1:0] bram_wea_reg;
    
// store the write address, data and wea when there is a write followed by a read
// that is to handle the busy state
// the data will be written to bram when the state is free again
// always @(posedge HCLK or negedge HRESETn) begin
//     if (!HRESETn) begin
//         addr_reg <= {ADDR_WIDTH{1'b0}};
//         data_reg <= {DATA_WIDTH{1'b0}};
//         bram_wea_reg <= {(DATA_WIDTH/8){1'b0}};
//     end else if (bus_state_d1 == bus_WRITE && bus_state == bus_READ) begin
//         addr_reg <= addr_r;
//         data_reg <= HWDATA;
//         bram_wea_reg <= bram_wea_busy;
//     end else if (((bus_state == bus_FREE) ||(bus_state_d1 == bus_READ && bus_state == bus_WRITE))) begin
//         addr_reg <= {ADDR_WIDTH{1'b0}};
//         data_reg <= {DATA_WIDTH{1'b0}};
//         bram_wea_reg <= {(DATA_WIDTH/8){1'b0}};
//     end else begin
//         addr_reg <= addr_reg;
//         data_reg <= data_reg;
//         bram_wea_reg <= bram_wea_reg;
//     end
// end
//=====the handle of read after write busy=========================================================================


endmodule