`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/27/2021 06:09:57 PM
// Design Name: 
// Module Name: lab4_4_counter
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


module lab4_4_counter(q, q1, clk, rst_n);

output [3:0] q;
output [3:0] q1;
input clk;
input rst_n;

reg [3:0] q;
reg [3:0] q1;
reg [3:0] q_count;
reg [3:0] q1_count;

/*always@* begin
    q_count = q +1'b1;
    q1_count = q1 + 1'b1;
end */

always@(posedge clk or negedge rst_n)
    if(~rst_n)  begin
        q <= 4'd0;
        q1<= 4'd0;
    end
    else begin
        q <= q + 1'b1;
        if (q >= 4'd9)  begin 
            q<= 4'd0;
            q1 <= q1 + 1'b1;
            if(q1 >= 4'd9) begin 
                q1 <= 4'd0;
            end
         end
    end

endmodule
