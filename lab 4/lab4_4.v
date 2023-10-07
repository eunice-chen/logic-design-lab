`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2021 03:09:27 AM
// Design Name: 
// Module Name: lab4_4
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


module lab4_4(ssd_ctl, seg, clk, rst_n);

output [3:0] ssd_ctl;
output [7:0] seg;  
input clk;
input rst_n;

wire clk_d;
wire [3:0] ssd_in;
wire [3:0] cnt_out1;
wire [3:0] cnt_out2;
wire ssd_ctl_en;

lab4_4_display U0(.seg(seg), .i(ssd_in));
lab4_4_counter U1(.clk(clk_d), .rst_n(rst_n), .q(cnt_out1), .q1(cnt_out2));
lab4_4_frediv_1 U2(.clk(clk), .rst_n(rst_n), .clk_out1(clk_d));
lab4_4_frediv_2 U3(.clk(clk), .rst_n(rst_n), .clk_out2(ssd_ctl_en));
lab4_4_scan_ctl U4(.ssd_ctl(ssd_ctl), .ssd_in(ssd_in), .in0(cnt_out1), .in1(cnt_out2), .in2(4'b0000), .in3(4'b0000), .ssd_ctl_en(ssd_ctl_en));


//assign ssd_ctl = 4'b1100;

endmodule
