`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2021 08:05:27 PM
// Design Name: 
// Module Name: lab8_2_fms
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


module lab8_2_fsm(clk, rst_n, key_in, digit_in, digit_last, curr_state, digit1, digit2);
input clk;
input rst_n;
input key_in;
input [511:0] digit_in;
input [8:0] digit_last;
output [1:0] curr_state;
output [8:0] digit1, digit2;
reg [8:0] digit1;
reg [8:0] digit2;
reg [1:0] curr_state;
reg [1:0] next_state;
reg [8:0] temp1;
reg [8:0] temp2;

always @ (posedge clk or negedge rst_n)
if (~rst_n)
begin
    digit2 <= 9'h070;
    digit1 <= 9'h070;
    curr_state <= 2'b00;
end
else
begin
    digit2 <= temp2;
    digit1 <= temp1;
    curr_state <= next_state;
end

always @*
begin
    next_state = 0;
    case (curr_state)
        2'b10: 
        begin 
            if (~key_in) 
            begin 
                next_state = 2'b10;
                temp1 = 9'h070; 
                temp2 = 9'h070; 
            end
            else
            begin 
                next_state = 2'b00; 
                temp1 = digit_last;
                temp2 = digit2; 
            end
        end 
        2'b01: 
        begin 
            if (~key_in) 
            begin 
                next_state = 2'b01;
                temp1 = digit1; 
                temp2 = digit2; 
            end
            else
            begin 
                if (digit_in[9'h05A])
                begin 
                    next_state = 2'b10;
                    temp1 = digit1;
                    temp2 = digit2;
                end
                else 
                begin 
                    next_state = 2'b01;
                    temp1 = digit1; 
                    temp2 = digit_last; 
                end
            end
        end
        2'b00: 
        begin 
            if (key_in)
            begin
                if (digit_in[9'h01C])
                begin 
                    next_state = 2'b01;
                    temp1 = digit1;
                    temp2 = digit2;
                end
                else 
                begin 
                    next_state = 2'b00; 
                    temp1 = digit_last;
                    temp2 = digit2; 
                end
            end
            else         
            begin 
                next_state = 2'b00; 
                temp1 = digit1;
                temp2 = digit2; 
            end
        end          
    endcase
end
    
endmodule
