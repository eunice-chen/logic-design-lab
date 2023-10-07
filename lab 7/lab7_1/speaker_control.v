`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 03:09:46 PM
// Design Name: 
// Module Name: speaker_control
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


module speaker_control(clk, rst_n, audio_in_left, audio_in_right, audio_mclk, audio_lrck, audio_sck, audio_sdin);
input clk, rst_n;
input [15:0] audio_in_left, audio_in_right;  
output audio_mclk, audio_lrck, audio_sck, audio_sdin;
wire [4:0] count;        
reg [15:0] audio_left, audio_right;
reg audio_sdin, audio; 

fre_divider fq1 (.clk(clk), .rst_n(rst_n), .max(26'd2), .clk_out(audio_mclk));
fre_divider fq2(.clk(clk), .rst_n(rst_n), .max(26'd256), .clk_out(audio_lrck));
fre_divider fq3(.clk(clk), .rst_n(rst_n), .max(26'd8), .clk_out(audio_sck));
fre_divider fq4(.clk(clk), .rst_n(rst_n), .max(26'd512), .enable(count)); 

always@(posedge audio_lrck or negedge rst_n)
        if (~rst_n)
        begin
            audio_left <= 16'd0;
          audio_right <= 16'd0;
        end
        else
        begin
            audio_left <= audio_in_left;
            audio_right <= audio_in_right;
        end
     
     always@(posedge audio_sck or negedge rst_n)
        if (~rst_n)                            // clean output data
            audio_sdin <= 1'b0;
        else 
            audio_sdin <= audio;
     
    always@*
        case(count)
            5'b00000: audio = audio_left[15];
            5'b00001: audio = audio_left[14];
            5'b00010: audio = audio_left[13];
            5'b00011: audio = audio_left[12];
            5'b00100: audio = audio_left[11];
            5'b00101: audio = audio_left[10];
            5'b00110: audio = audio_left[9];
            5'b00111: audio = audio_left[8];
            5'b01000: audio = audio_left[7];
            5'b01001: audio = audio_left[6];
            5'b01010: audio = audio_left[5];
            5'b01011: audio = audio_left[4];
            5'b01100: audio = audio_left[3];
            5'b01101: audio = audio_left[2];
            5'b01110: audio = audio_left[1];
            5'b01111: audio = audio_left[0];
            5'b10000: audio = audio_right[15];
            5'b10001: audio = audio_right[14];
            5'b10010: audio = audio_right[13];
            5'b10011: audio = audio_right[12];
            5'b10100: audio = audio_right[11];
            5'b10101: audio = audio_right[10];
            5'b10110: audio = audio_right[9];
            5'b10111: audio = audio_right[8];
            5'b11000: audio = audio_right[7];
            5'b11001: audio = audio_right[6];
            5'b11010: audio = audio_right[5];
            5'b11011: audio = audio_right[4];
            5'b11100: audio = audio_right[3];
            5'b11101: audio = audio_right[2];
            5'b11110: audio = audio_right[1];
            5'b11111: audio = audio_right[0];
        default: audio = 1'b0;
         endcase 

endmodule
