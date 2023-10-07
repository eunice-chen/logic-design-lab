`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2021 10:25:05 AM
// Design Name: 
// Module Name: lab8_4_1
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


module lab8_4(clk, rst_n, PS2_CLK, PS2_DATA, curr_state, led);
    input clk;
    input rst_n;
    inout PS2_CLK, PS2_DATA;
    output [6:0] led;
    output curr_state;
    
    wire key_valid;
    wire [8:0] last_change;
    wire [511:0] key_down;
    
    KeyboardDecoder KeyboardDecoder(.key_down(key_down), .last_change(last_change), .key_valid(key_valid),
                              .PS2_DATA(PS2_DATA), .PS2_CLK(PS2_CLK), .rst(~rst_n), .clk(clk));
    
    lab8_4_content content(.clk(clk), .rst_n(rst_n), .key_in(key_valid), .digit_in(key_down), 
    .digit_last(last_change), .result(led), .curr_state(curr_state));
    
endmodule
