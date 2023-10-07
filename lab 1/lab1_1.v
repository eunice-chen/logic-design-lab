`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 04:15:38 PM
// Design Name: 
// Module Name: lab1_1
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


module lab1_1(w, x, y, z, a, b, c, d);

output w, x, y, z;
input a, b, c, d;

assign z = ~d;
assign y = (c&d)|(~(c|d));
assign x = ((~b&(c|d))|(b&(~(c|d))));
assign w = (a | (b&(c|d)));

endmodule
