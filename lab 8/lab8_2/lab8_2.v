`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2021 07:42:23 PM
// Design Name: 
// Module Name: lab9_2
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


module lab8_2(clk, rst_n, PS2_CLK, PS2_DATA, curr_state, ssd_ctl, segs);
input clk;
input rst_n;
inout PS2_DATA, PS2_CLK;
output [3:0] ssd_ctl;
output [7:0] segs;
output [1:0] curr_state;

wire [3:0] dig_1, dig_2;
wire [3:0] a0;
wire [3:0] a1;
wire [1:0] ssd_enable;

wire key_valid;
wire [511:0] key_down;
wire [8:0] last_change;

wire [8:0] digit1;
wire [8:0] digit2;

wire [3:0] bin;

lab8_2_add add(.clk(clk), .rst_n(rst_n), .a0(a0), .a1(a1), .dig_1(dig_1), .dig_2(dig_2), .ssd_enable(ssd_enable));

lab8_2_fsm fsm1(.clk(clk), .rst_n(rst_n), .key_in(key_valid), .digit_in(key_down), .digit_last(last_change), .curr_state(curr_state), .digit1(digit1), .digit2(digit2));

KeyboardDecoder KeyboardDecoder(.clk(clk), .rst(~rst_n), .key_valid(key_valid), .key_down(key_down), .last_change(last_change), .PS2_CLK(PS2_CLK), .PS2_DATA(PS2_DATA));
            
bcd_dec d1(.in_dec(digit1), .out_dec(a0));
bcd_dec d2(.in_dec(digit2), .out_dec(a1));                

scan_ctl scan_ctl(.ssd_ctl_en(ssd_enable), .in_ssd(bin), .ssd_ctl(ssd_ctl),.in4(dig_1),.in3(dig_2), .in2(a1), .in1(a0));

display display(.bin(bin), .segs(segs));
    
endmodule
