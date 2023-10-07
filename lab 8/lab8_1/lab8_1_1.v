`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2021 10:54:10 PM
// Design Name: 
// Module Name: lab8_1_1
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


module lab8_1(clk, rst_n, PS2_CLK, PS2_DATA, ssd_ctl, segs);
    input clk;
    input rst_n;
    inout PS2_CLK, PS2_DATA;
    output[7:0] segs;
    output [3:0] ssd_ctl;
   
    wire key_in; 
    wire [8:0] last_pressed;
    wire [511:0] digit_in;
    wire [3:0] bin;
    
    assign ssd_ctl = 4'b0111;
    
    KeyboardDecoder KeyboardDecoder(.clk(clk), .rst(~rst_n), .key_down(digit_in),.last_change(last_pressed),.key_valid(key_in),.PS2_DATA(PS2_DATA),.PS2_CLK(PS2_CLK));
                     
    bcd_dec d1(.in_dec(last_pressed), .out_dec(bin));
    
    display display(.segs(segs), .bin(bin));
 
endmodule
