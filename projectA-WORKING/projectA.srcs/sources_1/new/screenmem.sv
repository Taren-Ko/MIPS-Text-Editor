`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/11/2017 10:56:14 PM
// Design Name: 
// Module Name: screenmem
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module screenmem #(
    parameter Nloc = 1200,                      // Number of memory locations
    parameter Dbits = 32,                      // Number of bits in data
    parameter initfile = "mem_data.mem"       // Name of file with initial values
)(
input wire clock,
input wire wr,                            // WriteEnable:  if wr==1, data is written into mem
input wire [$clog2(Nloc)+1: 0] vgaAddr,     // Address for specifying memory location
input wire [$clog2(Nloc)+1: 0] mipAddr,
                                          //   num of bits in addr is ceiling(log2(number of locations))
input wire [Dbits-1 : 0] din,             // Data for writing into memory (if wr==1)
output logic [Dbits-1 : 0] cCode,           // Data read from memory (asynchronously, i.e., continuously)
output logic [Dbits-1 : 0] readData
);

logic [Dbits-1 : 0] mem [Nloc-1 : 0];     // The actual storage where data resides
initial $readmemh(initfile, mem, 0, Nloc-1); // Initialize memory contents from a file

always_ff @(posedge clock)                // Memory write: only when wr==1, and only at posedge clock
   if(wr)
      mem[mipAddr[$clog2(Nloc)+1:2]] <= din;

assign cCode = mem[vgaAddr];                  // Memory read: read continuously, no clock involved
assign readData = mem[mipAddr[$clog2(Nloc)+1:2]];

endmodule
