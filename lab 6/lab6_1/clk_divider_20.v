`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2021 09:57:05 PM
// Design Name: 
// Module Name: clk_divider_20
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


module clk_divider_20(clk, clk_div_20);
    
input clk;
output clk_div_20;

reg clk_div_20;
reg [19:0] counter;

always@(posedge clk)
begin
            counter <= counter + 20'd1;
            if(counter == 20'd500000 - 20'd1) begin
                clk_div_20 <= ~clk_div_20;
                counter <= 20'd0;
            end
end
endmodule