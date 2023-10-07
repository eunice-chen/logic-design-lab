`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/04/17 15:43:07
// Design Name: 
// Module Name: fre_divider1
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


module fre_divider1(clk, rst_n, clk_out1);
input clk;
input rst_n;
output clk_out1;

reg clk_out1;
reg [25:0] counter;

always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n) begin
            counter <= 26'd0;
            clk_out1 <= 1'b0;
        end
        else begin 
            counter <= counter + 26'd1;
            if(counter == 26'd50000000 - 26'd1) begin
                clk_out1 <= ~clk_out1;
                counter <= 26'd0;
            end
        end
    end
    
endmodule