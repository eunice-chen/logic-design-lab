`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2021 10:26:08 AM
// Design Name: 
// Module Name: lab8_4_content
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


module lab8_4_content(clk, rst_n, key_in, digit_in, digit_last, result, curr_state);
    input clk;
    input rst_n;
    input key_in;
    input [8:0] digit_last;
    input [511:0] digit_in;
    output [6:0] result;
    output curr_state;
    reg [6:0] result;
    reg curr_state;
    reg [6:0] ASC_code;
    reg next_state;
    reg [6:0] temper_result;
    
always@(posedge clk or negedge rst_n)
        if (~rst_n)
        begin
            curr_state <= 0;
            result <= 0;
        end
        else
        begin
            curr_state <= next_state;
            if (next_state)
                if (temper_result < 7'd32 || digit_in[9'h012])
                    result <= temper_result;
                else
                    result <= temper_result - 7'd32;
            else
                if (digit_in[9'h012])
                    result <= temper_result - 7'd32;
                else
                    result <= temper_result;
        end

    
    always@*
    begin
        next_state = 0;
        temper_result = 0;
        case (curr_state)
            1'b0:
                if (key_in)
                begin
                    if (digit_in[9'h058])
                    begin
                        next_state = 1'b1;
                        temper_result = 7'd0;
                    end
                    else
                    begin
                        next_state = 1'b0;
                        temper_result = ASC_code;
                    end
                end
                
                else
                begin
                    next_state = 1'b0;
                    temper_result = ASC_code;
                end
                
            1'b1:
                if (key_in)
                begin
                    if (digit_in[9'h058])
                    begin
                        next_state = 1'b0;
                        temper_result = 7'd0;
                    end
                    else
                    begin
                        next_state = 1'b1;
                        temper_result = ASC_code;
                    end
                end
                
                else
                begin
                    next_state = 1'b1;
                    temper_result = ASC_code;
                end
        endcase
    end
    
    always@*
    begin
        ASC_code = 0;
        case (digit_last)
            9'h01C: ASC_code = 7'd97;
            9'h032: ASC_code = 7'd98;
            9'h021: ASC_code = 7'd99;
            9'h023: ASC_code = 7'd100;
            9'h024: ASC_code = 7'd101;
            9'h02B: ASC_code = 7'd102;
            9'h034: ASC_code = 7'd103;
            9'h033: ASC_code = 7'd104;
            9'h043: ASC_code = 7'd105;
            9'h03B: ASC_code = 7'd106;
            9'h042: ASC_code = 7'd107;
            9'h04B: ASC_code = 7'd108;
            9'h03A: ASC_code = 7'd109;
            9'h031: ASC_code = 7'd110;
            9'h044: ASC_code = 7'd111;
            9'h04D: ASC_code = 7'd112;
            9'h015: ASC_code = 7'd113;
            9'h02D: ASC_code = 7'd114;
            9'h01B: ASC_code = 7'd115;
            9'h02C: ASC_code = 7'd116;
            9'h03C: ASC_code = 7'd117;
            9'h02A: ASC_code = 7'd118;
            9'h01D: ASC_code = 7'd119;
            9'h022: ASC_code = 7'd110;
            9'h035: ASC_code = 7'd111;
            9'h01A: ASC_code = 7'd112;
        endcase
    end   
    
endmodule
