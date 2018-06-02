`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2017 11:24:07 AM
// Design Name: 
// Module Name: bitmapmem
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


module bitmapmem #(
    parameter Nloc = 1024,                      // Number of memory locations
    parameter Dbits = 12,                      // Number of bits in data
    parameter initfile = "mem_data.mem"       // Name of file with initial values
)(
//input wire clock,
//input wire wr,                            // WriteEnable:  if wr==1, data is written into mem
input wire [$clog2(Nloc)+1: 0] addr,     // Address for specifying memory location
output logic [Dbits-1 : 0] cValue           // Data read from memory (asynchronously, i.e., continuously)
);

logic [Dbits-1 : 0] mem [Nloc-1 : 0];     // The actual storage where data resides
initial $readmemh(initfile, mem, 0, Nloc-1); // Initialize memory contents from a file

assign cValue = mem[addr[$clog2(Nloc)+1:0]];                  // Memory read: read continuously, no clock involved

endmodule
