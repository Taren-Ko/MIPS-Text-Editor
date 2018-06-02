`timescale 1ns / 1ps
`default_nettype none
`include "display640x480.sv"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/15/2017 11:21:11 AM
// Design Name: 
// Module Name: vgatimer
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


module vgatimer(
    input wire clock,
    output wire hsync, vsync, activevideo,
    output wire [`xbits-1:0] x,
    output wire [`ybits-1:0] y
    );
    
    logic [1:0] clk_count=0;
    always_ff @(posedge clock)
        clk_count <= clk_count + 2'b 01;
       logic Every2ndTick, Every4thTick;
       assign Every2ndTick = (clk_count[0] == 1'b 1);
       assign Every4thTick = (clk_count[1:0] == 2'b 11);
       
       xycounter #(`WholeLine, `WholeFrame) xy(clock, Every4thTick, x, y);
       
       assign hsync = (x>=`hSyncStart & x<=`hSyncEnd) ? 0 : (x>`hSyncEnd | x<`hSyncStart) ? 1: 1;
       assign vsync = (y>=`vSyncStart & y<=`vSyncEnd) ? 0 : (y>`vSyncEnd | y<`vSyncStart) ? 1: 1;
       assign activevideo = (x<`hVisible & y<`vVisible) ? 1: 0;
endmodule
