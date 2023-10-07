module lab2_2(seg, led, i, ssd_ctl);
output [3:0] ssd_ctl;
output [7:0] seg;  
output [3:0] led;
input [3:0] i;

wire [3:0] ssd_ctl;

lab2 U4(.segs(seg),.i(i),.leds(led));

assign ssd_ctl = 4'b0000;

endmodule