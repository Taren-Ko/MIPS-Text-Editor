`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
//
// Montek Singh
// 10/2/2015 
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`default_nettype none
`include "display640x480.sv"

module vgadisplaydriver #(
    parameter initfile = "mem_data.mem"
)(
    input wire clock,
    input wire [3:0] charcode,
    output wire [31:0] smem_addr,
    output wire [3:0] red, green, blue,
    output wire hsync, vsync
    );

   wire [`xbits-1:0] x;
   wire [`ybits-1:0] y;
   wire activevideo;
   wire [11:0] bmem_addr; //needed for our 32 different bitmaps to create alphabet
   wire [11:0] bmem_color; //satisfies all possible color value combinations
   
   wire [`ybits-5:0] y_over_16 = y[`ybits-1:4];
 

   vgatimer myvgatimer(clock, hsync, vsync, activevideo, x, y);
   
   bitmapmem #(1024,12,initfile) bmapMem(bmem_addr,bmem_color);
   
   //assign smem_addr = y[`ybits-1:4]<<5 + y[`ybits-1:4]<<3 + x[`xbits-1:4];
   assign smem_addr = x[`xbits-1:4] + {y_over_16, 5'b0} + {y_over_16, 3'b0};
   //assign smem_addr = y*40 + x;
   
   assign bmem_addr = {charcode,y[3:0],x[3:0]};
   
   assign red[3:0]   = (activevideo == 1) ? bmem_color[11:8] : 4'b0;
   assign green[3:0] = (activevideo == 1) ? bmem_color[7:4] : 4'b0;
   assign blue[3:0]  = (activevideo == 1) ? bmem_color[3:0] : 4'b0;

endmodule
