`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2021 10:22:11 PM
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

reg clk_out_tmp;
reg [16:0] q_tmp2;
reg [3:0] q_tmp1;
reg [25:0] t;

always @* 
begin
if (t == max)
    begin
        clk_out_tmp = ~clk_out;
        {q_tmp2, enable, q_tmp1} = 26'b1;
    end
    else
    begin
        clk_out_tmp = clk_out;
        {q_tmp2, enable, q_tmp1} = t + 26'b1;       
    end
end

always @(posedge clk or negedge rst_n)
if (~rst_n)
begin
    clk_out <= 0;
    t <= 26'b0;
end
else
begin
    clk_out <= clk_out_tmp;
    t <= {q_tmp2, enable, q_tmp1};
end
endmodule