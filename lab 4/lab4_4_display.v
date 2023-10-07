`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2021 03:08:07 AM
// Design Name: 
// Module Name: lab4_4_display
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

`define SS_0 8'b00000011 // 0
`define SS_1 8'b10011111 // 1
`define SS_2 8'b00100101 // 2
`define SS_3 8'b00001101 // 3
`define SS_4 8'b10011001 // 4
`define SS_5 8'b01001001 // 5
`define SS_6 8'b01000001 // 6
`define SS_7 8'b00011111 // 7
`define SS_8 8'b00000001 // 8
`define SS_9 9'b00001001 // 9

module lab4_4_display(seg, i);

output [7:0] seg;
input [3:0] i;

reg [7:0] seg;

always@*
    case(i)
        4'd0: seg = `SS_0; 
        4'd1: seg = `SS_1; 
        4'd2: seg = `SS_2; 
        4'd3: seg = `SS_3; 
        4'd4: seg = `SS_4; 
        4'd5: seg = `SS_5; 
        4'd6: seg = `SS_6; 
        4'd7: seg = `SS_7; 
        4'd8: seg = `SS_8; 
        4'd9: seg = `SS_9; 
        default: seg = `SS_0;
    endcase 
endmodule
