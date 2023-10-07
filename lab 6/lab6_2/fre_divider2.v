`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/17/2021 19:02:52
// Design Name: 
// Module Name: fre_divider2
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


module fre_divider2(clk, rst_n, clk_out2);
    
input clk;
input rst_n;
output clk_out2;

reg clk_out2;
reg [22:0] counter;

always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n) begin
            counter <= 23'd0;
            clk_out2 <= 1'b0;
        end
        else begin 
            counter <= counter + 23'd1;
            if(counter == 23'd5000000 - 23'd1) begin
                clk_out2 <= ~clk_out2;
                counter <= 23'd0;
            end
        end
    end
    
endmodule
