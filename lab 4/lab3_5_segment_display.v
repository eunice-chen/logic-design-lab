`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2021 08:04:09 PM
// Design Name: 
// Module Name: lab3_5_segment_display
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


module lab3_5_segment_display(segs, ssd_in, nums, rst_n, clk);
    
    output [7:0] segs;
	output [3:0] ssd_in;
	input [15:0] nums;
	input rst_n;
	input  clk;
    
    reg [7:0] segs;
	reg [3:0] ssd_in;
	wire [15:0] nums;
    reg [15:0] clk_divider;
    reg [3:0] seg_num;
    
    always @ (posedge clk or negedge rst_n) begin
    	if (~rst_n) begin
    		clk_divider <= 15'b0;
    	end else begin
    		clk_divider <= clk_divider + 15'b1;
    	end
    end
    
    always @ (posedge clk_divider[15] or negedge rst_n) begin
    	if (~rst_n) begin
    		seg_num <= 4'b0000;
    		ssd_in <= 4'b1111;
    	end else begin
    		case (ssd_in)
    			4'b1110 : begin
    					seg_num <= nums[11:8];
    					ssd_in <= 4'b1101;
    				end
    			4'b1101 : begin
						seg_num <= nums[7:4];
						ssd_in <= 4'b1011;
					end
    			4'b1011 : begin
						seg_num <= nums[3:0];
						ssd_in <= 4'b0111;
					end
    			4'b0111 : begin
						seg_num <= nums[15:12];
						ssd_in <= 4'b1110;
					end
    			default : begin
						seg_num <= nums[3:0];
						ssd_in <= 4'b1110;
					end				
    		endcase
    	end
    end
    
    always @ (*) begin
    	case (seg_num)
    		4'd0 : segs = 8'b11010101; //N
			4'd1 : segs = 8'b11100001 ;//T                                               
			4'd2 : segs = 8'b10010001; //H                                             
			4'd3 : segs = 8'b10000011; //U                                             
			4'd4 : segs = 8'b01100001; //E                                               
			4'd5 : segs = 8'b01100011; //C                                               
			4'd6 : segs = 8'b01001001; //S
			default : segs = 8'b11111101;
    	endcase
    end
    
    
endmodule
