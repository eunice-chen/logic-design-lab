`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/18/2021 10:27:43 PM
// Design Name: 
// Module Name: note_gen
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

`define Mid_Do 26'd191571
`define Mid_Re 26'd170648
`define Mid_Mi 26'd151515
`define Mid_Fa 26'd143266
`define Mid_So 26'd127511
`define Mid_La 26'd113636
`define Mid_Si 26'd101215
`define Higher_Do 26'd95420
`define Higher_Re 26'd85034
`define Higher_Mi 26'd75758
`define Higher_Fa 26'd71633
`define Higher_So 26'd63776
`define Higher_La 26'd56818
`define Higher_Si 26'd50678


module note_gen(clk, rst_n, output_note, digit);

input clk;
input rst_n;
output [25:0] output_note;
output [3:0] digit;
reg [3:0] digit;
reg [25:0] output_note;
reg [3:0] digit_temp;

always @*
if (digit < 4'd13)
    digit_temp = digit + 1'b1;
else 
    digit_temp = 4'd0;

always @(posedge clk or negedge rst_n)
if (~rst_n)
    digit <= 4'd0;
else 
    digit <= digit_temp;

always @*
begin
    output_note = 0;
    case (digit)
        4'b0000: output_note = `Mid_Do;
        4'b0001: output_note = `Mid_Re;
        4'b0010: output_note = `Mid_Mi;
        4'b0011: output_note = `Mid_Fa;
        4'b0100: output_note = `Mid_So;
        4'b0101: output_note = `Mid_La;
        4'b0110: output_note = `Mid_Si;
        4'b0111: output_note = `Higher_Do;
        4'b1000: output_note = `Higher_Re;
        4'b1001: output_note = `Higher_Mi;
        4'b1010: output_note = `Higher_Fa;
        4'b1011: output_note = `Higher_So;
        4'b1100: output_note = `Higher_La;
        4'b1101: output_note = `Higher_Si;
    endcase
end
    
endmodule
