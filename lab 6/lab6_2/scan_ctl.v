`timescale 1ns / 1ps

module scan_ctl(ssd_ctl_en, ssd_in, ssd_ctl, in3, in2, in1, in0);
input [1:0] ssd_ctl_en;
input [3:0] in3, in2, in1, in0;
output reg [3:0] ssd_in;
output reg [3:0] ssd_ctl;

always@*
case (ssd_ctl_en)
    2'b00: 
    begin
        ssd_ctl = 4'b0111;
        ssd_in = in3;
    end
    2'b01:
    begin
        ssd_ctl = 4'b1011;
        ssd_in = in2;
    end
    2'b10:
    begin
        ssd_ctl = 4'b1101;
        ssd_in = in1;
    end
    2'b11: 
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
