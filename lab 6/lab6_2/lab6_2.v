`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/17 22:31:54
// Design Name: 
// Module Name: lab6_2
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

module lab6_2(clk, set_min, set_sec, start, resume, timer_ctl, ssd_ctl, seg, led);
    input clk; // 100MHz clock
    input set_min, set_sec; //push button for minutes and second
    input start; // push button for start/stop
    input resume;  // push button for resume/pause
    input timer_ctl;  //switch for setting
    output [3:0] ssd_ctl;
    output [7:0] seg;
    output reg [15:0] led;
    
    //scan_ctl
    reg[15:0] scan_ctl_counter;
    wire[1:0] scan_ctl;
    
    //debounce & one_pulse
    wire min_debounced, sec_debounced, start_debounced, resume_debounced;
    wire start_one_pulse, resume_one_pulse, start_enable, resume_enable, min_one_pulse, sec_one_pulse;
    
    //clk_divider
    wire clk_div_27;
    wire clk_div_23;
    wire clk_div_20;
    wire clk_div_26;
    
    //counter
    wire [3:0] q4, q3, q2, q1;
    wire [3:0] digit4, digit3, digit2, digit1, ssd_in;
    wire count_up, count1, count2, count3, count4; //upcounter
    wire carry1, carry2, carry3, carry4; //upcounter
    wire borrow1, borrow2, borrow3, borrow4; //downcounter
    wire count_down, dw_enable; //downcounter
    wire down1, down2, down3, down4;
    
    //rst
    wire rst, rst_enable, rst_down;    
    
    always@*
        if ({digit4,digit3,digit2,digit1} == 16'b0000000000000000)
            led = 16'b1111111111111111;
        else
            led = 16'b0000000000000000;
       
       
    //frequency divider
    fre_divider1 clk_div_f1(.clk(clk), .rst_n(rst), .clk_out1(clk_div_27));
    fre_divider2 clk_div_f10(.clk(clk), .rst_n(rst), .clk_out2(clk_div_23));
    fre_divider3 clk_div_f100(.clk(clk), .rst_n(rst), .clk_out3(clk_div_20));
    fre_divider4 clk_div_f2(.clk(clk), .rst_n(rst), .clk_out4(clk_div_26));
   
   
    //reset
    three_pulse threepulse_rst(.in_trig(resume), .clk(clk_div_26), .three_pulse(rst));


    //debounce
    debounce start_d(.clk(clk_div_20), .rst_n(rst), .pb_in(start), .pb_debounced(start_debounced));
    debounce resume_d(.clk(clk_div_20), .rst_n(rst), .pb_in(resume), .pb_debounced(resume_debounced));
    debounce min_d(.clk(clk_div_20), .rst_n(rst), .pb_in(set_min), .pb_debounced(min_debounced));
    debounce sec_d(.clk(clk_div_20), .rst_n(rst), .pb_in(set_sec), .pb_debounced(sec_debounced));    
    
    
    //one_pulse
    one_pulse start_pulse(.clk(clk_div_23), .rst_n(rst), .in_trig(start_debounced), .one_pulse(start_one_pulse));
    one_pulse resume_pulse(.clk(clk_div_23), .rst_n(rst), .in_trig(resume_debounced), .one_pulse(resume_one_pulse));
    one_pulse min(.clk(clk_div_23), .rst_n(rst), .in_trig(min_debounced), .one_pulse(min_one_pulse));
    one_pulse sec(.clk(clk_div_23), .rst_n(rst), .in_trig(sec_debounced), .one_pulse(sec_one_pulse));
    
    
    //push button
    fsm_start st_start(.in_pulse(start_one_pulse), .rst_n(rst), .clk(clk_div_23), .curr_state(start_enable), .out_rst(rst_enable));
    fsm_resume st_resume(.clk(clk_div_23), .rst_n(rst), .pulse(resume_one_pulse), .state(resume_enable));
    
    
    //set timer using upcounter
    bcd_upcounter up4(.clk(clk_div_23), .rst_n(rst), .limit(4'd5), .enable(count4), .out(q4), .carry(carry4));
    bcd_upcounter up3(.clk(clk_div_23), .rst_n(rst), .limit(4'd9), .enable(count3), .out(q3), .carry(carry3));
    bcd_upcounter up2(.clk(clk_div_23), .rst_n(rst), .limit(4'd5), .enable(count2), .out(q2), .carry(carry2));
    bcd_upcounter up1(.clk(clk_div_23), .rst_n(rst), .limit(4'd9), .enable(count1), .out(q1), .carry(carry1));
    
    assign count_up = (~((q4 == 4'd5) & (q3 == 4'd9) & (q2 == 4'd5) & (q1 == 4'd9) )) & timer_ctl;
    assign count4 = carry3 & count_up & min_one_pulse;
    assign count3 = (carry2 & carry1 & count_up) | (min_one_pulse & timer_ctl); 
    assign count2 = carry1 & sec_one_pulse & count_up;
    assign count1 = count_up & sec_one_pulse;
    
    
    //downcounter
    bcd_downcounter d4(.clk(clk_div_27), .rst_n(rst_down), .limit(4'd5), .decrease(down4), .in_val(q4), .out_val(digit4), .borrow(borrow4));
    bcd_downcounter d3(.clk(clk_div_27), .rst_n(rst_down), .limit(4'd9), .decrease(down3), .in_val(q3), .out_val(digit3), .borrow(borrow3));
    bcd_downcounter d2(.clk(clk_div_27), .rst_n(rst_down), .limit(4'd5), .decrease(down2), .in_val(q2), .out_val(digit2), .borrow(borrow2));
    bcd_downcounter d1(.clk(clk_div_27), .rst_n(rst_down), .limit(4'd9), .decrease(down1), .in_val(q1), .out_val(digit1), .borrow(borrow1));
    
    assign count_down = ~((digit4 == 4'd0) & (digit3 == 4'd0) & (digit2 == 4'd0) & (digit1 == 4'd0));
    assign rst_down = rst & rst_enable & (~timer_ctl);
    assign dw_enable = start_enable & resume_enable;
    assign down4 = borrow1 & borrow2 & borrow3 & dw_enable;  
    assign down3 = borrow1 & borrow2 & dw_enable;
    assign down2 = borrow1 & dw_enable;
    assign down1 = count_down & dw_enable;


    //bcd to ssd
    assign scan_ctl = scan_ctl_counter[15:14];
    always@(posedge clk)
    begin
        scan_ctl_counter <= scan_ctl_counter + 16'd1;
    end
           
    scan_ctl bcd_to_ssd(.ssd_ctl_en(scan_ctl), .ssd_in(ssd_in), .ssd_ctl(ssd_ctl), .in3(digit4), .in2(digit3), .in1(digit2), .in0(digit1));
 
    
    //ssd display    
    display ssd_display(.segs(seg), .bin(ssd_in));

        
endmodule
