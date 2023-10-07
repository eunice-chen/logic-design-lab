`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2021 10:22:11 PM
// Design Name: 
// Module Name: display
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

`define Do 8'b01100011
`define Re 8'b10000101
`define Mi 8'b01100001
`define Fa 8'b01110001
`define So 8'b01000001
`define La 8'b00010001
`define Si 8'b11000001

module display(enable, digit_in, segs);
input enable;
input [511:0] digit_in;
output reg [7:0] segs;

always @* 
begin
    if(~enable)
    begin
        if (digit_in[9'h032]) segs = `Si;
        else if (digit_in[9'h021]) segs = `Do;
        else if (digit_in[9'h023]) segs = `Re;
        else if (digit_in[9'h024]) segs = `Mi;
        else if (digit_in[9'h02B]) segs = `Fa;
        else if (digit_in[9'h034]) segs = `So;
        else if (digit_in[9'h01C]) segs = `La;       
        else segs = 8'b11111101;
    end
    else
        segs = 8'b11111101;
end    
endmodule
