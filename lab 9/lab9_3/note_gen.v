`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2021 10:22:11 PM
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

module note_gen(enable, digit_in, note_in_left, note_in_right);
input enable;
input [511:0] digit_in;
output [21:0] note_in_left;
output [21:0] note_in_right;

reg [21:0] note_in_left;
reg [21:0] note_in_right;

always @*
begin
    if (enable)
    begin
        if (digit_in[9'h012])
        begin
            if (digit_in[9'h021]) begin note_in_left = `Higher_Do; note_in_right = `Higher_Mi; end
            else if (digit_in[9'h023]) begin note_in_left = `Higher_Re; note_in_right = `Higher_Fa; end
            else if (digit_in[9'h024]) begin note_in_left = `Higher_Mi; note_in_right = `Higher_So; end
            else if (digit_in[9'h02B]) begin note_in_left = `Higher_Fa; note_in_right = `Higher_La; end
            else if (digit_in[9'h034]) begin note_in_left = `Higher_So; note_in_right = `Higher_Si; end
            else if (digit_in[9'h01C]) begin note_in_left = `Higher_La; note_in_right = `Higher_Do; end
            else if (digit_in[9'h032]) begin note_in_left = `Higher_Si; note_in_right = `Higher_Re;  end
            else begin note_in_left = 0; note_in_right = 26'd0; end
        end
        else
        begin
            if (digit_in[9'h021]) begin note_in_left = `Mid_Do; note_in_right = `Mid_Mi; end
            else if (digit_in[9'h023]) begin note_in_left = `Mid_Re; note_in_right = `Mid_Fa; end
            else if (digit_in[9'h024]) begin note_in_left = `Mid_Mi; note_in_right = `Mid_So; end
            else if (digit_in[9'h02B]) begin note_in_left = `Mid_Fa; note_in_right = `Mid_La; end
            else if (digit_in[9'h034]) begin note_in_left = `Mid_So; note_in_right = `Mid_Si; end
            else if (digit_in[9'h01C]) begin note_in_left = `Mid_La; note_in_right = `Mid_Do; end
            else if (digit_in[9'h032]) begin note_in_left = `Mid_Si; note_in_right = `Mid_Re;  end
            else begin note_in_left = 0; note_in_right = 26'd0; end
        end 
    end
    else if (digit_in[9'h012])
    begin
        if (digit_in[9'h021]) begin note_in_left = `Higher_Do; note_in_right = `Higher_Do; end
        else if (digit_in[9'h023]) begin note_in_left = `Higher_Re; note_in_right = `Higher_Re; end
        else if (digit_in[9'h024]) begin note_in_left = `Higher_Mi; note_in_right = `Higher_Mi; end
        else if (digit_in[9'h02B]) begin note_in_left = `Higher_Fa; note_in_right = `Higher_Fa; end
        else if (digit_in[9'h034]) begin note_in_left = `Higher_So; note_in_right = `Higher_So; end
        else if (digit_in[9'h01C]) begin note_in_left = `Higher_La; note_in_right = `Higher_La; end
        else if (digit_in[9'h032]) begin note_in_left = `Higher_Si; note_in_right = `Higher_Si; end
        else begin note_in_left = 0; note_in_right = 26'd0; end
    end
    else
    begin
        if (digit_in[9'h021]) begin note_in_left = `Mid_Do; note_in_right = `Mid_Do; end
        else if (digit_in[9'h023]) begin note_in_left = `Mid_Re; note_in_right = `Mid_Re; end
        else if (digit_in[9'h024]) begin note_in_left = `Mid_Mi; note_in_right = `Mid_Mi; end
        else if (digit_in[9'h02B]) begin note_in_left = `Mid_Fa; note_in_right = `Mid_Fa; end
        else if (digit_in[9'h034]) begin note_in_left = `Mid_So; note_in_right = `Mid_So; end
        else if (digit_in[9'h01C]) begin note_in_left = `Mid_La; note_in_right = `Mid_La; end
        else if (digit_in[9'h032]) begin note_in_left = `Mid_Si; note_in_right = `Mid_Si;  end
        else begin note_in_left = 0; note_in_right = 26'd0; end
    end 
end

endmodule