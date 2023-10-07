`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 03:09:24 PM
// Design Name: 
// Module Name: lab7_1_test
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


module lab7_1_test;

reg clk, rst_n;
reg [15:0] left, right;
wire mclk, lrck, sck, sdin;


speaker_control u0(.clk(clk), .rst_n(rst_n), .audio_in_left(left), .audio_in_right(right), .audio_mclk(mclk), .audio_lrck(lrck), .audio_sck(sck), .audio_sdin(sdin));

always #1 clk = ~clk;       //  let period be 2

initial
begin
    rst_n = 0;
    clk = 0;
    left = 16'b1100_1001_1010_1000;
    right = 16'b0011_0110_0101_0111;
    #2 rst_n = 1;          //  finish reseting after a period of clk
end
    
endmodule
