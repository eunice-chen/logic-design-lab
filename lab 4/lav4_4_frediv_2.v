`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2021 02:57:24 AM
// Design Name: 
// Module Name: lav4_4_frediv_2
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


module lab4_4_frediv_2(clk, rst_n, clk_out2);

input clk;
input rst_n;
output clk_out2;

reg [15:0] counter;
reg clk_out2;

always@(posedge clk or negedge rst_n)
    if(~rst_n) begin
        counter <= 15'd0;
        clk_out2 <= 1'b0;
    end
    else begin 
            {clk_out2, counter} <= {clk_out2, counter} + 1'b1;
    end

endmodule
