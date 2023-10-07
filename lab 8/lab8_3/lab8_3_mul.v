`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2021 12:27:23 AM
// Design Name: 
// Module Name: lab8_3_mul
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


module lab8_3_mul(mul1, mul2, mul3, mul4, mul_out);
    input [3:0] mul1, mul2, mul3, mul4;
    output [13:0] mul_out;
    reg [13:0] mul_out;
    
    always@* mul_out = ((mul1*10) + mul2)*((mul3*10) + mul4);
    
endmodule
