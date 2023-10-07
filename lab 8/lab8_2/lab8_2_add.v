`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2021 08:02:17 PM
// Design Name: 
// Module Name: lab8_2_add
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


module lab8_2_add(clk, rst_n, a0, a1, dig_1, dig_2, ssd_enable);
input clk;
input rst_n;
input [3:0] a0, a1;
output [3:0] dig_1, dig_2;
output [1:0] ssd_enable;

reg clk_out;
reg [11:0] clk_temp1;
reg [11:0] clk_temp2; 
reg [4:0] f_out;
reg [1:0] ssd_enable;
reg [4:0] f_temp;
reg [3:0] dig_1, dig_2;
reg [4:0] out_digit;

always@(posedge clk or negedge rst_n)
if (rst_n == 0)
begin
    {clk_temp2, ssd_enable, clk_temp1} = 26'd0;
    clk_out = 0;
end
else 
begin
    {clk_temp2, ssd_enable, clk_temp1} = {clk_temp2, ssd_enable, clk_temp1} + 26'd1;
    if ({clk_temp2, ssd_enable, clk_temp1} == 26'd5000000)
    begin
        clk_out = clk_out^1;
        {clk_temp2, ssd_enable, clk_temp1} = 26'b0;
    end
end

always @* f_temp = a0 + a1;

always @ (posedge clk_out or negedge rst_n)
if (~rst_n)
    f_out <= 0;
else 
    f_out <= f_temp;



always @*
if (f_out > 5'd9)
begin
    out_digit = f_out - 5'd10;
    dig_1[0] = out_digit[0];
    dig_1[1] = out_digit[1];
    dig_1[2] = out_digit[2];
    dig_1[3] = out_digit[3];
    dig_2 = 4'd1;
end
else
begin
    dig_1[0] = f_out[0];
    dig_1[1] = f_out[1];
    dig_1[2] = f_out[2];
    dig_1[3] = f_out[3];
    dig_2 = 4'd0;
end
  
endmodule