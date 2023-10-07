`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/21 18:43:50
// Design Name: 
// Module Name: lab3_3
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


module lab3_3(q, clk, rst_n);

output [3:0] q;
input clk;
input rst_n;

wire clk_d;
wire [3:0] q;

lab3_3_counter U0(.q(q), .clk(clk_d), .rst_n(rst_n));
lab3_2_divider U1(.clk_out(clk_d), .clk(clk), .rst_n(rst_n));

endmodule
