`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/03/21 19:03:55
// Design Name: 
// Module Name: lab3_4_shifter
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


module lab3_4_shifter(q, clk, rst_n);

output [7:0] q;
input clk;
input rst_n;

reg [7:0] q;

always@(posedge clk or negedge rst_n)
    if(~rst_n)
        begin
            q <= 8'b10010110;
        end
     else
        begin
            q[0] <= q[1];
            q[1] <= q[2];
            q[2] <= q[3];
            q[3] <= q[4];
            q[4] <= q[5];
            q[5] <= q[6];
            q[6] <= q[7];
            q[7] <= q[0];
        end
endmodule
