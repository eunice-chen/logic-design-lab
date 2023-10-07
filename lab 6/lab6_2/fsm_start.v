`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/17 19:41:12
// Design Name: 
// Module Name: fsm_start
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

module fsm_start(in_pulse, rst_n, clk, curr_state, out_rst);
input in_pulse, rst_n, clk;
output reg curr_state, out_rst;
reg next_state;
reg out_tmp;

always@*
case (curr_state)
    1'b1: 
    begin
        if (in_pulse == 1'b1)
        begin
            next_state = 0;
            out_tmp = 1;
        end
        else
        begin
            next_state = 1;
            out_tmp = 1;
        end
    end
    1'b0:
    begin
        if (in_pulse == 1'b1)
        begin
            next_state = 1;
            out_tmp = 0;
        end
        else
        begin
            next_state = 0;
            out_tmp = 1;
        end
    end
    default:
    begin
        next_state = 0;
        out_tmp = 0;
    end   
endcase

always@(posedge clk or negedge rst_n)
    if (~rst_n)
    begin
        curr_state <= 1;
        out_rst <= 1;
    end
    else
    begin
        curr_state <= next_state;
        out_rst <= out_tmp;
    end
endmodule
