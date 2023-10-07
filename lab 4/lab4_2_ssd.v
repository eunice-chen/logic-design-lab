`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2021 04:01:36 PM
// Design Name: 
// Module Name: lab4_2_ssd
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


module lab4_2_ssd(segs, ssd_ctl, clk, rst_n);

output [3:0] ssd_ctl;
output [7:0] segs;
input clk;
input rst_n;

wire clk_d;
wire [3:0] bin;

lab4_2_frediv_1 U1(.clk(clk), .rst_n(rst_n), .clk_out1(clk_d));
lab4_2_counter U3(.clk(clk_d), .rst_n(rst_n), .q(bin));
lab4_2_display U0(.seg(segs), .i(bin));

assign ssd_ctl = 4'b0000;

endmodule
