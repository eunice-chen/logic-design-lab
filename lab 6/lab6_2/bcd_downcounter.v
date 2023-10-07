`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/17 17:18:38
// Design Name: 
// Module Name: bcd_downcounter
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


module bcd_downcounter(decrease, limit, in_val, clk, rst_n, out_val, borrow);
    input decrease, clk, rst_n;
    input [3:0] limit;
    input [3:0] in_val;
    output reg [3:0] out_val;
    output reg borrow;
    reg [3:0] out_val_tmp;
    
always@*
    if (out_val == 4'd0 && decrease)
    begin
        out_val_tmp = limit;
        borrow = 1;
    end
    else if (decrease)
    begin
        out_val_tmp = out_val - 1'b1;
        borrow = 0;
    end
    else
    begin
        out_val_tmp = out_val;
        borrow = 0;
    end
 
always@(posedge clk or negedge rst_n )
    if (~rst_n) out_val <= in_val;
    else out_val <= out_val_tmp;

endmodule