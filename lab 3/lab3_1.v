`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2021 01:53:40 PM
// Design Name: 
// Module Name: lab3_1
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


module lab3_1(clk_out, clk, rst_n);

output clk_out;
input clk;
input rst_n;

reg clk_out;
reg [25:0] cnt;
reg [26:0] cnt_tmp;

always@* cnt_tmp = {clk_out, cnt} + 1'b1;

always@(posedge clk or negedge rst_n)
    if(~rst_n) 
        {clk_out, cnt} <= 27'd0;
    else
        {clk_out, cnt} <= cnt_tmp;
endmodule
