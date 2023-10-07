`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 02:43:25 PM
// Design Name: 
// Module Name: lab7_2
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


module lab7_2(clk, rst_n, up_vol, down_vol, do, re, mi, ssd_ctl, seg, audio_mclk, audio_lrck, audio_sck, audio_sdin);
    
    input clk;
    input rst_n;
    input up_vol;
    input down_vol;
    input do, re, mi;
    output [3:0] ssd_ctl;
    output [7:0] seg;
    output audio_mclk, audio_lrck, audio_sck, audio_sdin;
    
    wire f10, f100;
    wire ssd_enable;
    wire decrease, increase;
    wire [3:0] digit1, digit0, ssd_in;
    wire [15:0] high_vol, low_vol;
    wire [4:0] enable, ssd_ctl_enable;
    wire [15:0] audio_left, audio_right;

    buzzer_control b1(.clk(clk), .rst_n(rst_n), .do(do), .re(re), .mi(mi), .high_vol(high_vol), .low_vol(low_vol), .audio_left(audio_left), .audio_right(audio_right));
    speaker_control s1(.clk(clk), .rst_n(rst_n), .audio_in_left(audio_left), .audio_in_right(audio_right), .audio_mclk(audio_mclk), .audio_lrck(audio_lrck), .audio_sck(audio_sck), .audio_sdin(audio_sdin));

    assign ssd_enable = ssd_ctl_enable[4];
    
    fre_divider fd1(.clk(clk), .rst_n(rst_n), .max(23'd5000000), .clk_out(f10), .enable(enable));
    fre_divider fd2(.clk(clk), .rst_n(rst_n), .max(20'd500000), .clk_out(f100));
    fre_divider fd3(.clk(enable), .rst_n(rst_n), .enable(ssd_ctl_enable));
    
    one_pulse up_pulse(.clk(f100), .rst_n(rst_n), .in_trig(up_vol), .one_pulse(increase));
    one_pulse down_pulse(.clk(f100), .rst_n(rst_n), .in_trig(down_vol), .one_pulse(decrease));

    vol_gen vg1(.clk(f100), .rst_n(rst_n), .high(increase), .low(decrease), .digit1(digit1), .digit0(digit0), .high_vol(high_vol), .low_vol(low_vol));
    
    scan_ctl ss1(.ssd_ctl_en(ssd_enable), .ssd_in(ssd_in), .ssd_ctl(ssd_ctl), .in1(digit1), .in0(digit0));
    
    display d1(.segs(seg), .bin(ssd_in));
    
endmodule
