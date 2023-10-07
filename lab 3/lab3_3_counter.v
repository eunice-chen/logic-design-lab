`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/21 18:40:03
// Design Name: 
// Module Name: lab3_3_counter
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


module lab3_3_counter(q, clk, rst_n);

output [3:0] q;
input clk;
input rst_n;

reg [3:0] q;

always@(posedge clk or negedge rst_n)
    if(~rst_n) q<= 4'd0;
    else q <= q+1;

endmodule
