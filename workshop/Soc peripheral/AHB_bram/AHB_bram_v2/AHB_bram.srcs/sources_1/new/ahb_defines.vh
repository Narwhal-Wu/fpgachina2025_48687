`define HBURST_SINGLE  3'b000  // Single transfer
`define HBURST_INCR    3'b001  // Incrementing burst
`define HBURST_WRAP4   3'b010  // 4-beat wrapping burst
`define HBURST_INCR4   3'b011  // 4-beat incrementing burst
`define HBURST_WRAP8   3'b100  // 8-beat wrapping burst
`define HBURST_INCR8   3'b101  // 8-beat incrementing burst
`define HBURST_WRAP16  3'b110  // 16-beat wrapping burst
`define HBURST_INCR16  3'b111  // 16-beat incrementing burst

`define HBURST_HTRANS_IDLE    2'b00  // No data transfer required
`define HBURST_HTRANS_BUSY    2'b01  // Master busy, no data transfer
`define HBURST_HTRANS_NONSEQ  2'b10  // First transfer of a burst or single transfer
`define HBURST_HTRANS_SEQ     2'b11  // Remaining transfers in a burst