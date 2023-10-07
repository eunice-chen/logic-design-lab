`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2021 10:14:20 PM
// Design Name: 
// Module Name: fre_divider
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

module fre_divider (clk, rst_n, max, clk_out, enable);
input clk, rst_n;
input [25:0] max;
output reg clk_out;
output reg [4:0] enable;
reg [3:0] count1;
reg [16:0] count2;

always@(posedge clk or negedge rst_n)
if (~rst_n)
begin
    {count2, enable, count1} = 26'b0;
    clk_out = 1'b0;
end
else 
begin
    {count2, enable, count1} = {count2, enable, count1} + 26'b1;
    if ({count2, enable, count1} == max)
    begin
        {count2, enable, count1} = 26'b0;
        clk_out = ~clk_out;
    end
end

endmodule
