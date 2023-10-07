`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2021 11:52:20 PM
// Design Name: 
// Module Name: lab4_3
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


module lab4_3(ssd_ctl, seg, clk, rst_n);
    
output [3:0] ssd_ctl;
output [7:0] seg;  
input clk;
input rst_n;

wire clk_d;
wire [3:0] bin;

lab4_3_display U0(.seg(seg), .i(bin));
lab4_3_bcd U1(.clk(clk_d), .rst_n(rst_n), .q(bin));
lab4_3_frediv_1 U2(.clk(clk), .rst_n(rst_n), .clk_out1(clk_d));

assign ssd_ctl = 4'b1110;
    
endmodule
