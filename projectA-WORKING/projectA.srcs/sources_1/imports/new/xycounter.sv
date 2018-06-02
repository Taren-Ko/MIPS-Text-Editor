`timescale 1ns / 1ps
`default_nettype none
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/07/2017 02:57:19 PM
// Design Name: 
// Module Name: xycounter
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


module xycounter #(parameter width=2, height=2) (
    input wire clock,
    input wire enable,
    output logic [$clog2(width)-1:0] x=0,
    output logic [$clog2(height)-1:0] y=0
    );
    
    always_ff @(posedge clock) begin
        if(enable)
            begin
            if(x>width-2)
                x <= 0;
            if(y>height-2 & x>width-2)
                y <=0;
            else
            if(~(y>height-2) & x>width-2)
                y <= (y+1);
            else
            if(x<width-1)
                x <= x+1;   
            end             
    end
endmodule
