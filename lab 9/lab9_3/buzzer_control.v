`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/05/2021 10:22:11 PM
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


module buzzer_control(clk, rst_n, note_left, note_right, audio_left, audio_right);
input clk;
input rst_n;
input [21:0] note_left;
input [21:0] note_right;
output [15:0] audio_left;
output [15:0] audio_right;

reg [15:0] audio_left, audio_right;
reg b_clk_left, next_left, b_clk_right, next_right;
reg [21:0] count_left, counter_left, count_right, counter_right;

 always @*
    if (count_left == note_left) 
    begin
      counter_left = 22'd0;
      next_left   = ~b_clk_left;
    end 
    else 
    begin
      counter_left = count_left + 1'b1;
      next_left = b_clk_left;
    end

  always @(posedge clk or negedge rst_n)
    if (~rst_n) begin
      count_left <= 22'd0;
      b_clk_left   <= 1'b0;
    end else begin
      count_left <= counter_left;
      b_clk_left   <= next_left;
    end

 always @*
    if (count_right == note_right) 
    begin
      counter_right = 22'd0;
      next_right   = ~b_clk_right;
    end 
    else 
    begin
      counter_right = count_right + 1'b1;
      next_right = b_clk_right;
    end

  always @(posedge clk or negedge rst_n)
    if (~rst_n) begin
      count_right <= 22'd0;
      b_clk_right   <= 1'b0;
    end else begin
      count_right <= counter_right;
      b_clk_right   <= next_right;
    end



always @*
if (b_clk_left)
    audio_left = 16'h5FFF;
else
    audio_left = 16'hB000;

always @*
if (b_clk_right)
    audio_right = 16'h5FFF;
else
    audio_right = 16'hB000;

endmodule
