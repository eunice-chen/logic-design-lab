`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/21 19:08:03
// Design Name: 
// Module Name: lab3_4
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


module lab3_4(q, clk, rst_n);

output [7:0] q;
input clk;
input rst_n;

wire clk_d;
wire [7:0] q;

lab3_4_shifter U0(.q(q), .clk(clk_d), .rst_n(rst_n));
lab3_2_divider U1(.clk_out(clk_d), .clk(clk), .rst_n(rst_n));

endmodule
