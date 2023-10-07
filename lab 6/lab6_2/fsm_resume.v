`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/17 15:54:14
// Design Name: 
// Module Name: fsm_resume
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


module fsm_resume(clk, rst_n, pulse, state);
    input clk, rst_n, pulse;
    output reg state;
    reg next_state;
    
    always@(posedge clk or negedge rst_n)
        if (~rst_n)
            state <=  0;
        else
            state <= next_state;
            
     always@*
        case(state)
            1'b1:
                if(pulse == 1'b1)
                    next_state = 0;
                else
                    next_state = 1;
            1'b0:
                if (pulse == 1'b1)
                    next_state = 1;               
                else
                    next_state = 0;   
            default:
                next_state = 0;
        endcase
endmodule
