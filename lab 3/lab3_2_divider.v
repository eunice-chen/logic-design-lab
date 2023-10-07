`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/21/2021 02:34:14 AM
// Design Name: 
// Module Name: lab3_2_divider
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


module lab3_2_divider(clk, rst_n, clk_out);

input clk;
input rst_n;
output clk_out;

reg clk_out;
reg [25:0] counter;

always@(posedge clk or negedge rst_n)
   begin
        if(~rst_n) 
            counter <= 26'd1;
        else 
            counter <= counter + 26'd1;
    end
    
    always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n) 
            clk_out <= 1'b0;
        else 
           clk_out <= (counter == 26'd50000000 - 26'd1)?~clk_out:clk_out;
    end
endmodule
