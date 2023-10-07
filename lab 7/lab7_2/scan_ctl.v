`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 03:03:29 PM
// Design Name: 
// Module Name: scan_ctl
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


module scan_ctl(ssd_ctl_en, ssd_in, ssd_ctl, in1, in0);
input  ssd_ctl_en;
input [3:0] in1, in0;
output reg [3:0] ssd_in;
output reg [3:0] ssd_ctl;

always@*
case (ssd_ctl_en)
    1'b0:
    begin
        ssd_ctl = 4'b1101;
        ssd_in = in1;
    end
    1'b1: 
    begin
        ssd_ctl = 4'b1110;
        ssd_in = in0;
    end
    default:
    begin
        ssd_ctl = 4'b1111;
        ssd_in = 4'd0;
    end
endcase

endmodule
