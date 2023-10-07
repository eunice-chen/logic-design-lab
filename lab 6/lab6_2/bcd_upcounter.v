`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/17 17:18:38
// Design Name: 
// Module Name: bcd_upcounter
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


module bcd_upcounter(enable, limit, clk, rst_n, out, carry);
    input enable, clk, rst_n;
    input [3:0] limit;
    output reg [3:0] out;
    output reg carry;
    reg [3:0] out_tmp;
    
always@*
    if (enable)
    begin
        if (out < limit)
        begin
            out_tmp = out + 1'b1;
            carry = 0;
        end 
        else
        begin
            out_tmp = 4'd0;
            carry = 1;
        end
    end
    else
    begin
        out_tmp = out;
        carry = 0;
    end
 
always@(posedge clk or negedge rst_n)
    if (~rst_n) out <= 4'd0;
    else out <= out_tmp;

endmodule