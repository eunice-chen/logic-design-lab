`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2021 05:46:07 PM
// Design Name: 
// Module Name: test_prelab3_2
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


module test_prelab3_2;

reg clk;
reg rst_n;
wire [7:0] q;

prelab3_2 U0(.q(q), .clk(clk), .rst_n(rst_n));

initial begin
clk = 1; rst_n = 0; #10;
clk = 1; rst_n = 1; #10;
end

always #10 clk=~clk;

endmodule
