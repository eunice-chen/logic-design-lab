`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/10/2021 12:17:20 AM
// Design Name: 
// Module Name: clk_divider_16
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


module clk_divider_16(clk, clk_div_16);
    
input clk;
output clk_div_16;

reg clk_div_16;
reg [19:0] counter;

always@(posedge clk)
begin
            counter <= counter + 20'd1;
            if(counter == 26'd500000 - 20'd1) begin
                clk_div_16 <= ~clk_div_16;
                counter <= 20'd0;
            end
end
endmodule
