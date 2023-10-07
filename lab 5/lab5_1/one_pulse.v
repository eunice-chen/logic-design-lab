`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/08/2021 10:52:52 PM
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


module one_pulse(pb_debounced, clk, pb_one_pulse);
    input pb_debounced;
    input clk;
    output pb_one_pulse;
    
    reg pb_one_pulse;
    reg pb_debounced_delay;
    
    always@(posedge clk)
    begin
        if(pb_debounced == 1'b1 & pb_debounced_delay == 1'b0)
            pb_one_pulse <= 1'b1;        
        else
            pb_one_pulse <= 1'b0;

        pb_debounced_delay <= pb_debounced;
    end
endmodule
