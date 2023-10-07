`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2021 07:47:35 PM
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


module scan_ctl(
  ssd_ctl, // ssd display control signal 
  in_ssd, // output to ssd display
  in1, // 1st input
  in2, // 2nd input
  in3, // 3rd input
  in4,  // 4th input
  ssd_ctl_en // divided clock for scan control
);

output [3:0] in_ssd; // Binary data 
output [3:0] ssd_ctl; // scan control for 7-segment display
input [3:0] in1,in2,in3,in4; // binary input control for the four digits 
input [1:0] ssd_ctl_en; // divided clock for scan control

reg [3:0] ssd_ctl; // scan control for 7-segment display (in the always block)
reg [3:0] in_ssd; // 7 segment display control (in the always block)

always @*
  case (ssd_ctl_en)
    2'b00: 
    begin
      ssd_ctl=4'b1110;
      in_ssd=in4;
    end
    2'b01: 
    begin
      ssd_ctl=4'b1101;
      in_ssd=in3;
    end
  2'b10: 
    begin
      ssd_ctl=4'b1011;
      in_ssd=in2;
    end
    2'b11: 
    begin
      ssd_ctl=4'b0111;
      in_ssd=in1;
    end
    default: 
    begin
      ssd_ctl=4'b0000;
      in_ssd=4'd10;
    end
  endcase

endmodule
