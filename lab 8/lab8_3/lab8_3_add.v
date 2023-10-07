`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2021 12:27:37 AM
// Design Name: 
// Module Name: lab8_3_add
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


module lab8_3_add(add1, add2, add3, add4, add_out);
    input [3:0] add1, add2, add3, add4;
    output [13:0] add_out;
    reg [13:0] add_out;
    
    always@* add_out = (add1 * 4'd10 + add2) + (add3 * 4'd10 + add4);
    
endmodule
