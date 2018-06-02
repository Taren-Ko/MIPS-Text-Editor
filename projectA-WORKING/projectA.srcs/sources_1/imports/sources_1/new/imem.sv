`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2017 10:03:26 PM
// Design Name: 
// Module Name: imem
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


module imem #(
   parameter Nloc = 64,                      // Number of memory locations
   parameter Dbits = 32,                      // Number of bits in data
   parameter initfile = "mem_data.mem"       // Name of file with initial values
)(
   input wire [Dbits-1:0] pc,          // Data read from memory (asynchronously, i.e., continuously)
   output wire [Dbits-1:0] instr
   );

   logic [Dbits-1 : 0] mem [Nloc-1 : 0];     // The actual storage where data resides
   initial $readmemh(initfile, mem, 0, Nloc-1); // Initialize memory contents from a file

   assign instr = mem[pc[$clog2(Nloc)+1:2]];                  // Memory read: read continuously, no clock involved

endmodule