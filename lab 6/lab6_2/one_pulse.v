`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/17 21:28:40
// Design Name: 
// Module Name: one_pulse
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


module one_pulse(clk, rst_n, in_trig, one_pulse);
    input clk, rst_n, in_trig;
    output reg one_pulse;
    reg in_trig_delay;
    wire one_pulse_next;
    
    always@(posedge clk or negedge rst_n)
    if (~rst_n)
        in_trig_delay <= 1'b0;
    else
        in_trig_delay <= in_trig;
    
    assign one_pulse_next = in_trig & (~in_trig_delay);
    
    always@(posedge clk or negedge rst_n)
        if (~rst_n)
            one_pulse <= 1'b1;
        else
            one_pulse <= one_pulse_next;
               
endmodule
