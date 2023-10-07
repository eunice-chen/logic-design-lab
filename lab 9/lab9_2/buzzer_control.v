`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/19/2021 01:00:47 PM
// Design Name: 
// Module Name: buzzer_control
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

module buzzer_control(clk, rst_n, note_div, audio_left, audio_right);
input clk;
input rst_n;
input [21:0] note_div;
output [15:0] audio_left;
output [15:0] audio_right;
reg b_clock;
reg [21:0] count; 
reg [21:0] counter;
reg next_b_clock;
reg [15:0] audio_left, audio_right;

 always @*
    if (count == note_div) 
    begin
      counter = 22'd0;
      next_b_clock   = ~b_clock;
    end 
    else 
    begin
      counter = count + 1'b1;
      next_b_clock = b_clock;
    end

  always @(posedge clk or negedge rst_n)
    if (~rst_n) begin
      count <= 22'd0;
      b_clock   <= 1'b0;
    end else begin
      count <= counter;
      b_clock   <= next_b_clock;
    end

always @*
if (b_clock)
begin
    audio_left = 16'h5FFF;
    audio_right = 16'h5FFF;
end
else
begin
    audio_left = 16'hB000;
    audio_right = 16'hB000;
end
    
endmodule
