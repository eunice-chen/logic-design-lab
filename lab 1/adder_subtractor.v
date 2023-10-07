`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 02:54:13 PM
// Design Name: 
// Module Name: adder_subtractor
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


module adder_subtractor(input [2:0] a, 
    input [2:0] b,
    input m,
    output [2:0] s,
    output v);
    
    wire c1, c2, c3;
    wire b0, b1, b2;
    
    xor(b0, b[0], m);
    xor(b1, b[1], m);
    xor(b2, b[2], m);
    xor(v, c2, c3);
    
    full_adder fa0(s[0], c1, a[0], b0, m);
    full_adder fa1(s[1], c2, a[1], b1, c1);
    full_adder fa2(s[2], c3, a[2], b2, c2);
    
endmodule


module full_adder(s, cout, a, b, cin);
output s, cout;
input a, b, cin;

wire out1, out2, out3;

xor(out1, a, b);
and(out2, a, b);
and(out3, out1, cin);
xor(s, cin, out1);
or(cout, out3, out2);

endmodule