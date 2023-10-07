`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2021 10:51:54 PM
// Design Name: 
// Module Name: clk_divider_27
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


module clk_divider_27(clk, clk_div_27);
    
input clk;
output clk_div_27;

reg clk_div_27;
reg [25:0] counter;

always@(posedge clk)
begin
            counter <= counter + 26'd1;
            if(counter == 26'd50000000 - 26'd1) begin
                clk_div_27 <= ~clk_div_27;
                counter <= 26'd0;
            end
end
endmodule