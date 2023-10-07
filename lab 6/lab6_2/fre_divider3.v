`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2021 19:02:52
// Design Name: 
// Module Name: fre_divider3
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


module fre_divider3(clk, rst_n, clk_out3);
    
input clk;
input rst_n;
output clk_out3;

reg clk_out3;
reg [19:0] counter;

always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n) begin
            counter <= 20'd0;
            clk_out3 <= 1'b0;
        end
        else begin 
            counter <= counter + 20'd1;
            if(counter == 20'd500000 - 20'd1) begin
                clk_out3 <= ~clk_out3;
                counter <= 20'd0;
            end
        end
    end
    
    
endmodule
