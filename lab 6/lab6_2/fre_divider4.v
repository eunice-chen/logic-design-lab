`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/18/2021 01:35:13
// Design Name: 
// Module Name: fre_divider4
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


module fre_divider4(clk, rst_n, clk_out4);
    
input clk;
input rst_n;
output clk_out4;

reg clk_out4;
reg [25:0] counter;

always@(posedge clk or negedge rst_n)
    begin
        if(~rst_n) begin
            counter <= 26'd0;
            clk_out4 <= 1'b0;
        end
        else begin 
            counter <= counter + 26'd1;
            if(counter == 26'd25000000 - 26'd1) begin
                clk_out4 <= ~clk_out4;
                counter <= 26'd0;
            end
        end
    end
    
    
endmodule
