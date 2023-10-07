`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/16/2021 09:46:57 PM
// Design Name: 
// Module Name: three_pulse
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

module three_pulse(
    clk,  
    in_trig, 
    three_pulse  
);

// Declare I/Os
input clk;  // clock input
input in_trig; // input trigger
output reg three_pulse; // output one pulse 

// Declare internal nodes
reg in_trig_delay,in_trig_delay_2,out_pulse_next;

// Buffer input 
always @(posedge clk)
  begin
    in_trig_delay <= in_trig;
    in_trig_delay_2 <= in_trig_delay;
  end

// Pulse generation
always@ *
    if( (in_trig == 1'b1) & (in_trig_delay == 1'b1) & (in_trig_delay_2 == 1'b1)) out_pulse_next = 1;
    else out_pulse_next = 0;

always @(posedge clk)
    three_pulse <= out_pulse_next;

endmodule
