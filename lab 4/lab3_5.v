`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2021 07:56:18 PM
// Design Name: 
// Module Name: lab3_5
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


module lab3_5_(
    input clk,
    input rst_n,
    output [7:0] seg,
    output [3:0] ssd_ctl
    );

wire [15:0] nums;
reg [28:0] counter; 
wire clk_out;
reg [3:0] num1, num2, num3, num4; // registers to hold the LED values

always @ (posedge clk or negedge rst_n) //always block for the counter
begin
 if(~rst_n)
  counter <= 4'd0;
 else if(counter == 50000000) //reset after 1 second
  counter <= 4'd0;
 else
  counter <= counter + 1'b1;
end

reg [3:0] count; //register to hold the count upto 9. That is why a 4 bit register is used. 3 bit would not have been enough.

assign clk_out = ((counter == 50000000)?1'b1:1'b0); //clk_out every second

always @ (posedge clk_out or negedge rst_n)
begin
 if(~rst_n)
  count <= 0;
 else if(count == 8)
   count <= 4'd0;
  else 
  count <= count + 1;

end

always @ (*) //always block that will scroll or move the text. Accomplished with case
begin
    case(count)
        4'd0: begin num1 = 4'd0; num2 = 4'd1; num3 = 4'd2; num4 = 4'd3; end  //NTHU
        4'd1: begin num1 = 4'd1; num2 = 4'd2; num3 = 4'd3; num4 = 4'd4; end  //THUE
        4'd2: begin num1 = 4'd2; num2 = 4'd3; num3 = 4'd4; num4 = 4'd4; end  //HUEE
        4'd3: begin num1 = 4'd3; num2 = 4'd4; num3 = 4'd4; num4 = 4'd5; end  //UEEC
        4'd4: begin num1 = 4'd4; num2 = 4'd4; num3 = 4'd5; num4 = 4'd6; end  //EECS
        4'd5: begin num1 = 4'd4; num2 = 4'd5; num3 = 4'd6; num4 = 4'd0; end  //ECSN
        4'd6: begin num1 = 4'd5; num2 = 4'd6; num3 = 4'd0; num4 = 4'd1; end  //CSNT
        4'd7: begin num1 = 4'd6; num2 = 4'd0; num3 = 4'd1; num4 = 4'd2; end  //SNTH
        default: begin num1 = 4'd0; num2 = 4'd1; num3 = 4'd2; num4 = 4'd3; end 
  endcase
end

    assign nums = {num1, num2, num3, num4};
    lab3_5_segment_display U0 (.segs(seg), .ssd_in(ssd_ctl), .nums(nums), .rst_n(rst_n), .clk(clk));
    
endmodule
