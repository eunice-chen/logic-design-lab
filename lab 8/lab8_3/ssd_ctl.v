`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2021 12:12:07 AM
// Design Name: 
// Module Name: ssd_ctl
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


module scan_ctl(result, ssd_ctl_en, in4,  in3, in2,  in1, curr_digit3, curr_digit2, curr_digit1, curr_digit0, ssd_ctl, ssd_in);
    input result;
    input [1:0] ssd_ctl_en;
    input [3:0] in4, in3, in2, in1;
    input [3:0] curr_digit3, curr_digit2, curr_digit1, curr_digit0;
    output [3:0] ssd_ctl;
    output [3:0] ssd_in;
    reg [3:0] digit3, digit2, digit1, digit0;
    reg [3:0] ssd_in;
    reg [3:0] ssd_ctl;
            
    always@*
    if (result)
    begin
        digit3 = curr_digit3;
        digit2 = curr_digit2;
        digit1 = curr_digit1;
        digit0 = curr_digit0;
    end
    else
    begin
        digit3 = in1;
        digit2 = in2;
        digit1 = in3;
        digit0 = in4;
    end 
        
    always@*
        case (ssd_ctl_en)
            2'b00:
            begin
                ssd_in = digit0;
                ssd_ctl = 4'b0111;
            end
            
            2'b01:
            begin
                ssd_in = digit1;
                ssd_ctl = 4'b1011;
            end
            
            2'b10:
            begin
                ssd_in = digit2;
                ssd_ctl = 4'b1101;
            end
            
            2'b11:
            begin
                ssd_in = digit3;
                ssd_ctl = 4'b1110;
            end
            
            default:
            begin
                ssd_in = 4'd0;
                ssd_ctl = 4'b1111;
            end
            
        endcase
    
endmodule

