`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 02:44:29 PM
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


module buzzer_control(clk, rst_n, do, re, mi, high_vol, low_vol, audio_left, audio_right);

    input clk, rst_n, do, re, mi;       
    input [15:0] high_vol, low_vol;
    output reg [15:0] audio_left, audio_right; 
    reg  [25:0] key; 
    wire f_out; 
    
    fre_divider fq1(.clk(clk), .rst_n(rst_n), .max(key), .clk_out(f_out));
    
    always@*
        case({do, re, mi})
            3'b001:
                key = 26'd151685;
            3'b010:
                key = 26'd170648; 
            3'b100:
                key = 26'd191571;          
            default:
                key = 26'd0;      
        endcase
    
    
    always@*
    begin
        if({do,re,mi} == 3'b0)
        begin
            audio_right = 16'd0;
            audio_left = 16'd0;
        end
        else if (f_out)
        begin
            audio_right = high_vol;
            audio_left = high_vol;      
        end            
        else
        begin
            audio_right = low_vol; 
            audio_left = low_vol;               
        end
    end

endmodule
