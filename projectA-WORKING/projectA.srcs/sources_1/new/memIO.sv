`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/12/2017 12:19:25 PM
// Design Name: 
// Module Name: memIO
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


module memIO#(
   parameter dmem_init="wherever_data_is.mem",		// correct filename inherited from parent/tester
   parameter smem_init="wherever_data_is.mem" 	// text file to initialize screen memory
)(
    input wire clk,
    input wire [31:0] mem_writedata, mem_addr,
    input wire mem_wr,
    input wire [31:0] smem_addr, //needed for 1200 locations
    output wire [3:0] charcode, //satisfies all possible charcode combinations
    output wire [31:0] mem_readdata
    );
    
    wire smem_wr, dmem_wr;
    wire [31:0] dmem_read;
    wire [3:0] smem_read;
    
    
    assign smem_wr = mem_addr[17:16] == 2'b10 ? mem_wr : 0;
    assign dmem_wr = mem_addr[17:16] == 2'b01 ? mem_wr : 0;
    
    assign mem_readdata = mem_addr[17:16] == 2'b01 ? dmem_read : mem_addr[17:16] == 2'b10 ? {28'b0,smem_read} : 0;
    
    
    dmem #(.Nloc(64), .Dbits(32), .initfile(dmem_init)) dmemory(clk, dmem_wr, mem_addr[15:0], mem_writedata, dmem_read);
    screenmem #(.Nloc(1200),.Dbits(4),.initfile(smem_init)) smemory(clk,smem_wr,smem_addr[12:0],mem_addr[15:0],mem_writedata,charcode, smem_read);
    
endmodule
