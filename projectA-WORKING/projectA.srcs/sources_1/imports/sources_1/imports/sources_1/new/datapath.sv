`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2017 09:55:12 PM
// Design Name: 
// Module Name: datapath
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


module datapath #(
   parameter Dbits = 32,                      // Number of bits in data
   parameter Nloc = 64                      // Number of memory locations
)(

   input wire clk,
   input wire reset,
   output logic [31:0] pc = 32'h00400000,
   input wire [31:0] instr,
   input wire [1:0] pcsel,
   input wire [1:0] wasel,
   input wire sext,
   input wire bsel,
   input wire [1:0] wdsel,
   input wire [4:0] alufn,
   input wire werf,
   input wire [1:0] asel,
   input wire Z,
   output wire [31:0] mem_addr,
   output wire [31:0] mem_writedata,
   input wire [31:0] mem_readdata  
    );
    
    wire [31:0] alu_result, ReadData1, ReadData2, signImm, BT;
    wire [31:0] pcPlus4 = pc + 4;
    
    wire [4:0] reg_writeaddr = wasel == 2 ? 31 : wasel == 1 ? instr[20:16] : instr[15:11];
    wire [31:0] reg_writedata = wdsel == 2 ? mem_readdata : wdsel == 1 ? alu_result : pcPlus4;
    wire [31:0] aluA = asel == 2 ? 16 : asel == 1 ? instr[10:6] : ReadData1;
    wire [31:0] aluB = bsel == 1 ? signImm : ReadData2;
    
    assign BT = (pcPlus4) + {signImm[29:0],2'b00};
    
    assign mem_writedata = ReadData2;
    assign mem_addr = alu_result;
    assign signImm = sext == 1 ? {instr[15],instr[15],instr[15],instr[15],instr[15],instr[15],instr[15],instr[15],instr[15],instr[15],instr[15],instr[15],instr[15],instr[15],instr[15],instr[15],instr[15:0]} : instr[15:0];
    
    always_ff @(posedge clk)
        pc <= pcsel == 0 ? pcPlus4 : pcsel == 1 ? BT : pcsel == 2 ? {pc[31:28],instr[25:0],2'b00} : ReadData1;
        //pc <= pcPlus4;
    
    
    
    register_file #(Dbits, 32) a(clk, werf, instr[25:21], instr[20:16], reg_writeaddr, reg_writedata, ReadData1, ReadData2);
    ALU #(32) b(aluA, aluB, alu_result, alufn, Z);
    
endmodule
