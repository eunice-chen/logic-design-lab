`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2021 03:27:07 PM
// Design Name: 
// Module Name: prelab3_1
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


module prelab3_1(q, clk, rst_n);
    output [3:0] q;
    input clk;
    input rst_n;
    
    reg  [3:0] q;
    
    always@(posedge clk or negedge rst_n)
    if(~rst_n) q<= 4'd0;
    else q <= q+1;
    
endmodule
