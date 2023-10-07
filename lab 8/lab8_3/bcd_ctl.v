`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2021 12:57:31 AM
// Design Name: 
// Module Name: bcd_ctl
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


module bcd_ctl(sum_enable, minus_enable, multiply, output1, output2, output3, output4,add_trig, sub_trig, mul_trig);
input sum_enable, minus_enable, multiply;
input [13:0] add_trig;
input [13:0] sub_trig;
input [13:0] mul_trig;
output [3:0] output1, output2, output3, output4;

wire [3:0] add1, add2, add3, add4;
wire [3:0] sub1, sub2, sub3, sub4;
wire [3:0] mul1, mul2, mul3, mul4;
reg [3:0] output1, output2, output3, output4;

always @*
if (minus_enable)
begin
    output1 = sub1;
    output2 = sub2;
    output3 = sub3;
    output4 = sub4;
end
else if (sum_enable)
begin
    output1 = add1;
    output2 = add2;
    output3 = add3;
    output4 = add4;
end
else if (multiply)
begin
    output1 = mul1;
    output2 = mul2;
    output3 = mul3;
    output4 = mul4;
end
else
begin
    output1 = 4'd0;
    output2 = 4'd0;
    output3 = 4'd0;
    output4 = 4'd0;
end
     
    assign sub1 = (sub_trig - (sub_trig % 10'd1000)) / 10'd1000;
    assign sub2 = ((sub_trig - (sub_trig % 10'd100)) / 7'd100) - (output1 * 4'd10);
    assign sub3 = ((sub_trig % 7'd100) - (sub_trig % 4'd10)) / 4'd10; 
    assign sub4 = sub_trig % 4'd10; 
 
    assign add1 = (add_trig - (add_trig % 10'd1000)) / 10'd1000;
    assign add2 = ((add_trig - (add_trig % 10'd100)) / 7'd100) - (output1 * 4'd10);
    assign add3 = ((add_trig % 7'd100) - (add_trig % 4'd10)) / 4'd10; 
    assign add4 = add_trig % 4'd10;
    
    assign mul1 = (mul_trig - (mul_trig % 10'd1000)) / 10'd1000;
    assign mul2 = ((mul_trig - (mul_trig % 10'd100)) / 7'd100) - (output1 * 4'd10);
    assign mul3 = ((mul_trig % 7'd100) - (mul_trig % 4'd10)) / 4'd10;
    assign mul4 = mul_trig % 4'd10;
    
endmodule
