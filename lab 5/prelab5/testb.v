`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/03/2021 11:55:49 PM
// Design Name: 
// Module Name: testb
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


`define CYC 10

module tb();
    wire[3:0] digit1;
    wire[3:0] digit2;
    wire[15:0] led;
    
    reg rst, resume;
    reg clk = 1'b1;

    prelab5_counter U0(.clk(clk), .rst(rst), .resume(resume), .digit1(digit1), .digit2(digit2), .led(led));

    always #(`CYC) clk = ~clk;

    initial begin
        warmUp;
        repeat(2**8) begin
            @(negedge clk);
        end

        $finish;
    end

    task warmUp; begin
        rst = 1'b1;
        resume = 1'b0;
        #10
        rst = 1'b0;
        resume = 1'b1;
        #50
        resume = 1'b0;
        #30
        resume = 1'b1;
        #50
        rst = 1'b1;
        #30
        rst = 1'b0;
        resume = 1'b1;
    end
    endtask


endmodule
