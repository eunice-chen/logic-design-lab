`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 05:01:29 PM
// Design Name: 
// Module Name: lab1_bonus
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


module comparator(o0, o1, o2, a0, a1, a2, b0, b1, b2);
    input a0;
    input a1;
    input a2;
    input b0;
    input b1;
    input b2;
    output reg o0;
    output reg o1;
    output reg o2;
    
    reg [2:0] A, B, out;
    always @ *
     begin
        A[0] = a0;
        B[0] = b0;
        A[1] = a1;
        B[1] = b1;
        A[2] = a2;
        B[2] = b2;
        out = (A>B) ? B:A;
        o0 = out[0];
        o1 = out[1];
        o2 = out[2];
     end
         
endmodule
