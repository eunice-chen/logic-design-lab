`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2021 03:51:11 PM
// Design Name: 
// Module Name: test_prelab3_1
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


module test_prelab3_1;

reg clk;
reg rst_n;
wire [3:0] q;

prelab3_1 U0(.q(q), .clk(clk), .rst_n(rst_n));

initial begin
clk = 1; rst_n = 0; #100;
clk = 1; rst_n = 1; #100;
end

always #10 clk=~clk;

endmodule
