`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2021 12:23:36 AM
// Design Name: 
// Module Name: lab8_3_sub
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


module lab8_3_sub(sub1, sub2, sub3, sub4, sub_out);
    input [3:0] sub1, sub2, sub3, sub4;
    output [13:0] sub_out;
    reg [13:0] sub_out;
    reg [13:0] temper_out;
    reg [3:0] temper_sub1, temper_sub2;
    
    always@* sub_out = (sub1 * 4'd10 + sub2) - (sub3 * 4'd10 + sub4);
endmodule
