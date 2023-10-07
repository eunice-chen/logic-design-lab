`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2021 12:58:03 PM
// Design Name: 
// Module Name: lab9_2
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


module lab9_2(clk, rst_n, PS2_DATA, PS2_CLK, audio_sdin, audio_mclk, audio_lrck, audio_sck, ssd_ctl, segs, shift);
input clk;
input rst_n;
inout PS2_DATA, PS2_CLK;
output audio_sdin, audio_mclk, audio_lrck, audio_sck, shift;
output [3:0] ssd_ctl;
output [7:0] segs;

wire key_valid;
wire [8:0] last_change;
wire [511:0] key_down;
wire [21:0] note;
wire [15:0] audio_left_in, audio_right_in;
	
assign shift = key_down[9'h012];
	
KeyboardDecoder KeyboardDecoder(.clk(clk), .rst(~rst_n), .key_down(key_down), .last_change(last_change), .key_valid(key_valid),
.PS2_DATA(PS2_DATA), .PS2_CLK(PS2_CLK));

note_gen n1(.digit_in(key_down), .note_in(note));

speaker_control s1(.clk(clk), .rst_n(rst_n), .audio_in_left(audio_left_in), .audio_in_right(audio_right_in), .audio_mclk(audio_mclk), .audio_lrck(audio_lrck), .audio_sck(audio_sck), .audio_sdin(audio_sdin));

buzzer_control b1(.clk(clk), .rst_n(rst_n), .note_div(note), .audio_left(audio_left_in), .audio_right(audio_right_in));

display d1(.digit_in(key_down), .segs(segs));

assign ssd_ctl = 4'b0111;	

endmodule
