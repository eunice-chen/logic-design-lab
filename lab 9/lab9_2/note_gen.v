`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2021 01:26:07 PM
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

module note_gen(digit_in, note_in);
input [511:0] digit_in;
output reg [21:0] note_in;

always @*
if (digit_in[9'h012])
begin
    if (digit_in[9'h021]) note_in = `Higher_Do;
    else if (digit_in[9'h023]) note_in = `Higher_Re;
    else if (digit_in[9'h024]) note_in = `Higher_Mi;
    else if (digit_in[9'h02B]) note_in = `Higher_Fa;
    else if (digit_in[9'h034]) note_in = `Higher_So;
    else if (digit_in[9'h01C]) note_in = `Higher_La;
    else if (digit_in[9'h032]) note_in = `Higher_Si; 
    else note_in = 0;
end
else
begin
    if (digit_in[9'h021]) note_in = `Mid_Do;
    else if (digit_in[9'h023]) note_in = `Mid_Re;
    else if (digit_in[9'h024]) note_in = `Mid_Mi;
    else if (digit_in[9'h02B]) note_in = `Mid_Fa;
    else if (digit_in[9'h034]) note_in = `Mid_So;
    else if (digit_in[9'h01C]) note_in = `Mid_La;
    else if (digit_in[9'h032]) note_in = `Mid_Si; 
    else note_in = 0;
end     

endmodule
