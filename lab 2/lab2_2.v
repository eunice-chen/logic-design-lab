// define segment codes
`define SS_0 8'b00000011
`define SS_1 8'b10011111
`define SS_2 8'b00100101
`define SS_3 8'b00001101
`define SS_4 8'b10011001
`define SS_5 8'b01001001
`define SS_6 8'b01000001
`define SS_7 8'b00011111
`define SS_8 8'b00000001
`define SS_9 8'b00001001
`define SS_10 8'b00010001
`define SS_11 8'b11000001
`define SS_12 8'b01100011
`define SS_13 8'b10000101
`define SS_14 8'b01100001
`define SS_15 8'b01110001

module lab2(segs, leds, i);
output [7:0] segs;  
output [3:0] leds;
input [3:0] i;
reg [7:0] segs;  
reg [3:0] leds;
always @*
  case (i)
    4'd0: begin segs = `SS_0; leds = 4'b0000; end
    4'd1: begin segs = `SS_1; leds = 4'b0001; end
    4'd2: begin segs = `SS_2; leds = 4'b0010; end
    4'd3: begin segs = `SS_3; leds = 4'b0011; end
    4'd4: begin segs = `SS_4; leds = 4'b0100; end
    4'd5: begin segs = `SS_5; leds = 4'b0101; end
    4'd6: begin segs = `SS_6; leds = 4'b0110; end
    4'd7: begin segs = `SS_7; leds = 4'b0111; end
    4'd8: begin segs = `SS_8; leds = 4'b1000; end
    4'd9: begin segs = `SS_9; leds = 4'b1001; end
    4'd10: begin segs = `SS_10; leds = 4'b1010; end
    4'd11: begin segs = `SS_11; leds = 4'b1011; end
    4'd12: begin segs = `SS_12; leds = 4'b1100; end
    4'd13: begin segs = `SS_13; leds = 4'b1101; end
    4'd14: begin segs = `SS_14; leds = 4'b1110; end
    4'd15: begin segs = `SS_15; leds = 4'b1111; end
    default: begin segs = 8'b0000000; leds = 4'b0000; end
  endcase 
endmodule