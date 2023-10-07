`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2021 03:28:14 PM
// Design Name: 
// Module Name: lab1_2
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


module lab1_2(c0, c1, c2, c3, a0, a1, b0, b1);
output c0, c1, c2, c3;
input a0, a1, b0, b1;

assign c0 = a0&b0;
assign c1 = (a0&b1) ^ (a1&b0);
assign c2 = ((a1&b1) ^ ((a0&b1) & (a1&b0)));
assign c3 = ((a1&b1) & ((a0&b1) & (a1&b0)));

endmodule
