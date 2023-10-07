`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2021 09:28:19 PM
// Design Name: 
// Module Name: lab9_1
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


module lab9_1(clk, rst_n, digit, audio_mclk, audio_lrck, audio_sck, audio_sdin);
input clk;
input rst_n;
output audio_mclk, audio_lrck, audio_sck, audio_sdin;
output [3:0] digit;

wire clk_1sec;
wire [3:0] digit;
wire [21:0] note;
wire [15:0] audio_left_in, audio_right_in;

fre_divider f1(.clk(clk), .rst_n(rst_n), .max(26'd50000000), .clk_out(clk_1sec));

note_gen n1(.clk(clk_1sec), .rst_n(rst_n), .digit(digit), .output_note(note));

speaker_control s1(.clk(clk), .rst_n(rst_n), .audio_in_left(audio_left_in), .audio_in_right(audio_right_in), .audio_mclk(audio_mclk), .audio_lrck(audio_lrck), .audio_sck(audio_sck), .audio_sdin(audio_sdin));

buzzer_control b1(.clk(clk), .rst_n(rst_n), .note_div(note), .audio_left(audio_left_in), .audio_right(audio_right_in));
    
endmodule
