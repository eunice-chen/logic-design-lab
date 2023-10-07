`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2021 09:56:32 PM
// Design Name: 
// Module Name: clk_divider_26
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


module clk_divider_26(clk, clk_div_26);
    
input clk;
output clk_div_26;

reg clk_div_26;
reg [25:0] counter;

always@(posedge clk)
begin
            counter <= counter + 26'd1;
            if(counter == 26'd25000000 - 26'd1) begin
                clk_div_26 <= ~clk_div_26;
                counter <= 26'd0;
            end
end
endmodule
