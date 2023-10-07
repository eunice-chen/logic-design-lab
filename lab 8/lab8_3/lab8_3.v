`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2021 12:08:55 AM
// Design Name: 
// Module Name: lab8_3
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


module lab8_3(clk, rst_n, PS2_CLK, PS2_DATA, ssd_ctl, segs, curr_state);
    input clk;
    input rst_n;
    inout PS2_CLK, PS2_DATA;
    output [2:0] curr_state;
    output [3:0] ssd_ctl;
    output [7:0] segs;
    
    
    wire key_valid;
    wire [511:0] key_down;
    wire [8:0] last_change;
    
    wire add_enable, sub_enable, multiply, entered;
    wire[1:0] ssd_enable;
    wire [3:0] out_val1, out_val2, out_val3, out_val4;
    wire [3:0] digit4, digit3, digit2, digit1;
    wire [3:0] ssd_in;
    wire [8:0] in_val1, in_val2, in_val3, in_val4;
    wire [13:0] add_ans, sub_ans, mul_ans;
    reg[15:0] ssd_ctl_counter;
    
    
    
    always@(posedge clk)
    begin
        ssd_ctl_counter <= ssd_ctl_counter + 16'd1;
    end
        
    assign ssd_enable = ssd_ctl_counter[15:14];

    KeyboardDecoder u1(.key_down(key_down), .last_change(last_change), .key_valid(key_valid), .PS2_DATA(PS2_DATA), .PS2_CLK(PS2_CLK),.rst(~rst_n),	.clk(clk));

    lab8_3_fsm fsm1(.clk(clk), .rst_n(rst_n), .digit_in(key_down), .digit_last(last_change), .key_in(key_valid), 
    .val_1(in_val1), .val_2(in_val2), .val_3(in_val3), .val_4(in_val4),.add_enable(add_enable), 
    .sub_enable(sub_enable), .mul_enable(multiply), .result_enable(entered), .curr_state(curr_state));

    bcd_dec d1 (.in_dec(in_val1), .out_dec(out_val1));
    bcd_dec d2 (.in_dec(in_val2), .out_dec(out_val2));
    bcd_dec d3 (.in_dec(in_val3), .out_dec(out_val3));
    bcd_dec d4 (.in_dec(in_val4), .out_dec(out_val4));
    
    lab8_3_add a1(.add1(out_val1), .add2(out_val2), .add3(out_val3), .add4(out_val4), .add_out(add_ans));
    lab8_3_sub s1(.sub1(out_val1), .sub2(out_val2), .sub3(out_val3), .sub4(out_val4), .sub_out(sub_ans));   
    lab8_3_mul m1(.mul1(out_val1), .mul2(out_val2), .mul3(out_val3), .mul4(out_val4), .mul_out(mul_ans));

    bcd_ctl bcd_ctl(.sum_enable(add_enable), .minus_enable(sub_enable), .multiply(multiply), 
    .add_trig(add_ans), .sub_trig(sub_ans), .mul_trig(mul_ans), 
    .output4(digit4), .output3(digit3), .output2(digit2), .output1(digit1));

    scan_ctl s2(.result(entered), .ssd_ctl_en(ssd_enable), .ssd_in(ssd_in), .ssd_ctl(ssd_ctl), 
    .curr_digit3(digit4), .curr_digit2(digit3), .curr_digit1(digit2), .curr_digit0(digit1),
    .in4(out_val1), .in3(out_val2), .in2(out_val3), .in1(out_val4));

    display u9(.segs(segs), .bin(ssd_in));

endmodule
