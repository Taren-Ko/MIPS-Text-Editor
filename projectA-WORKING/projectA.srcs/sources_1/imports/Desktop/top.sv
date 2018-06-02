//////////////////////////////////////////////////////////////////////////////////
//
// Montek Singh
// 11/10/2016 
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns / 1ps
`default_nettype none

module top #(
    parameter smem_init="smem_screentest.mem", 	// text file to initialize screen memory
    parameter bmem_init="bmem_screentest.mem", 	// text file to initialize bitmap memory
    parameter imem_init="imem_screentest_nopause.mem",		// correct filename inherited from parent/tester
    parameter dmem_init="dmem_screentest.mem"        // correct filename inherited from parent/tester
)(
    input wire clock, reset,
    output wire [3:0] red, green, blue,
    output wire hsync, vsync
);

   wire clk100, clk50, clk25, clk12;
   wire [31:0] instr, mem_readdata, mem_writedata, mem_addr;
   wire mem_wr;
   wire [31:0] pc;

   wire [31:0] smem_addr; //needed for 1200 locations
   wire [3:0] charcode; //satisfies all possible charcode combinations
  
   
   // Uncomment *only* one of the following two lines:
   //    when synthesizing, use the first line
   //    when simulating, get rid of the clock divider, and use the second line
   //
   clockdivider_Nexys4 clkdv(clock, clk100, clk50, clk25, clk12);
   //assign clk100=clk; assign clk50=clk; assign clk25=clk; assign clk12=clk;

   mips mips(clk12, reset, pc, instr, mem_wr, mem_addr, mem_writedata, mem_readdata);
   imem #(.Nloc(128), .Dbits(32), .initfile(imem_init)) imem(pc[31:0], instr);
   memIO #(.dmem_init(dmem_init), .smem_init(smem_init)) memIO(clk12, mem_writedata, mem_addr, mem_wr, smem_addr, charcode, mem_readdata);
   vgadisplaydriver #(bmem_init) display(clock,charcode,smem_addr,red,green,blue,hsync,vsync);
   //screenmem #(1200,32,smem_init) smemory(clk12 ,1'b0,smem_addr,0,charcode);

endmodule
