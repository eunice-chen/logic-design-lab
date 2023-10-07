`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2021 10:52:26 PM
// Design Name: 
// Module Name: test_lab2_1
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


module test_lab2_1;

wire W, X, Y, Z;
reg A, B, C, D;

lab2_1 U2(.w(W), .x(X), .y(Y), .z(Z), .a(A), .b(B), .c(C), .d(D));

initial
begin
A=0;B=0;C=0;D=0;
#10 A=0;B=0;C=0;D=1;
#10 A=0;B=0;C=1;D=0;
#10 A=0;B=0;C=1;D=1;
#10 A=0;B=1;C=0;D=0;
#10 A=0;B=1;C=0;D=1;
#10 A=0;B=1;C=1;D=0;
#10 A=0;B=1;C=1;D=1;
#10 A=1;B=0;C=0;D=0;
#10 A=1;B=0;C=0;D=1;
end

endmodule
