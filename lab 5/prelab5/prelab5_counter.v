`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2021 10:47:34 PM
// Design Name: 
// Module Name: prelab5_counter
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

/*
module clock_divider(
    clk,
    clk_div
    );
    
    parameter n = 27;
    input clk;
    output clk_div;
    
    reg[26:0] num = 27'd0;
    wire [26:0] next_num;

    always @(posedge clk)
    begin
        num = next_num;
    end
    
    assign next_num = num+1;
    assign clk_div = num[n-1];
endmodule
*/
module prelab5_counter(
    input clk,
    input rst,
    input resume,
    output[3:0] digit1,
    output[3:0] digit2,
    output [15:0] led
    );

wire rst;

reg[3:0] digit1 = 4'd5;
reg[3:0] digit2 = 4'd2;
reg[15:0] led = 16'd0;

wire resume;

//clock_divider clkdiv(.clk(clk), .clk_div(clk_div));

always@(negedge clk or negedge rst)// or posedge rst_one_pulse)
begin
    if(rst == 1'b1)
    begin 
        digit1 <= 4'd5;
        digit2 <= 4'd2;
    end
    else if(resume == 1'b1)
    begin
        if(digit2 == 4'd0)
        begin
            if(digit1 != 4'd0) begin
                digit2 <= digit2;
                digit1 <= digit1 - 4'd1;
            end
            
            else begin
                digit2 <= 4'd0;
                digit1 <= 4'd0;
                led <= 16'b1111111111111111;
            end
        end
            
        else if(digit2 != 4'd0)
        begin
            if(digit1 != 4'd0)
            begin
                digit2 <= digit2;
                digit1 <= digit1 - 4'd1;
            end
            
            else
            begin
                digit2 <= digit2 - 4'd1;
                digit1 <= 4'd9;
            end
        end
    end
    
    else if(resume == 1'b0)
    begin
        digit2 <= digit2;
        digit1 <= digit1;
    end
    end
endmodule

