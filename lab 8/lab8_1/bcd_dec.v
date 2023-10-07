`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2021 11:05:20 PM
// Design Name: 
// Module Name: bcd_dec
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
`define digit_0 4'b0000
`define digit_1 4'b0001
`define digit_2 4'b0010
`define digit_3 4'b0011
`define digit_4 4'b0100
`define digit_5 4'b0101
`define digit_6 4'b0110
`define digit_7 4'b0111
`define digit_8 4'b1000
`define digit_9 4'b1001
`define Enter 4'b1010
`define A 4'b1011
`define S 4'b1100
`define M 4'b1101

module bcd_dec(in_dec, out_dec);
input [8:0] in_dec;
output [3:0] out_dec;
reg [3:0] out_dec;

always @*
begin
    out_dec = 0;
    case(in_dec)
        9'h070: out_dec = `digit_0;
        9'h069: out_dec = `digit_1; 
        9'h072: out_dec = `digit_2; 
        9'h07A: out_dec = `digit_3; 
        9'h06B: out_dec = `digit_4; 
        9'h073: out_dec = `digit_5; 
        9'h074: out_dec = `digit_6; 
        9'h06C: out_dec = `digit_7; 
        9'h075: out_dec = `digit_8; 
        9'h07D: out_dec = `digit_9; 
        9'h05A: out_dec = `Enter;
        9'h01C: out_dec = `A; 
        9'h01B: out_dec = `S; 
        9'h03A: out_dec = `M; 
    endcase
end 
  
endmodule
