`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/04/2021 04:56:21 PM
// Design Name: 
// Module Name: test
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

module lab5_1(
    input clk,
    input rst,
    input en,
    output[3:0] DIGIT,
    output[7:0] DISPLAY,
    output[15:0] led
    );

wire rst;
wire en;

reg[3:0] DIGIT = 4'b0000;
reg[7:0] DISPLAY = 8'b00000000;
reg[15:0] led = 16'b0000000000000000;

reg[3:0] digit1 = 4'd5;
reg[3:0] digit2 = 4'd2;
reg[3:0] digit3 = 4'd12;
reg[3:0] digit4 = 4'd12;

reg[3:0] ACT_DIGIT = 4'd0;

wire clk_div_27;
wire clk_div_16;

reg[15:0] scan_ctl_counter;
wire[1:0] scan_ctl;

wire rst_debounced;
wire en_debounced;

wire rst_one_pulse;
wire en_one_pulse;

reg resume = 1'b0;

clk_divider_27 clk27(.clk(clk), .clk_div_27(clk_div_27));
clk_divider_16 clk16(.clk(clk), .clk_div_16(clk_div_16));

debounce debounce_rst(.pb_debounced(rst_debounced), .pb(rst), .clk(clk_div_16));
debounce debounce_en(.pb_debounced(en_debounced), .pb(en), .clk(clk_div_16));

one_pulse onepulse_rst(.pb_debounced(rst_debounced), .clk(clk_div_16), .pb_one_pulse(rst_one_pulse));
one_pulse onepulse_en(.pb_debounced(en_debounced), .clk(clk_div_16), .pb_one_pulse(en_one_pulse));


always@(posedge clk)
begin
    scan_ctl_counter <= scan_ctl_counter + 16'd1;
end
    
assign scan_ctl = scan_ctl_counter[15:14];

always@(posedge en_one_pulse or posedge rst_one_pulse)
begin
    if(rst_one_pulse == 1'b1)
    begin
        resume <= 1'b0;
    end

    else if(en_one_pulse == 1'b1)
        resume <= ~resume;
end

always@(posedge clk_div_27 or posedge rst_one_pulse)
begin
    if(rst_one_pulse == 1'b1)
    begin
        digit1 <= 4'd5;
        digit2 <= 4'd2;
        led <= 16'b0000000000000000;
    end
    
    else
    begin
        if(resume == 1)
        begin
            if(digit2 == 4'd0)
            begin
                if(digit1 != 4'd0) 
                begin
                    digit2 <= digit2;
                    digit1 <= digit1 - 4'd1;
                end
                else begin
                digit2 <= 4'd0;
                digit1 <= 4'd0;
                led <= 16'b1111111111111111;
                end 
            end
            else if(digit2 != 4'd0)
            begin
                if(digit1 != 4'd0)
                begin
                    digit2 <= digit2;
                    digit1 <= digit1 - 4'd1;
                end
                else begin
                digit2 <= digit2 - 4'd1;
                digit1 <= 4'd9;
                end
            end
        end
        else
        begin
            digit2 <= digit2;
            digit1 <= digit1;
        end
    end
end

always@(*)
begin
    case(scan_ctl)
        2'b00:
        begin
            DIGIT = 4'b1110;
            ACT_DIGIT = digit1;
        end
        
        2'b01:
        begin
            DIGIT = 4'b1101;
            ACT_DIGIT = digit2;
        end
        2'b10:
        begin
            DIGIT = 4'b1011;
            ACT_DIGIT = 4'd12;
        end
        
        2'b11:
        begin
            DIGIT = 4'b0111;
            ACT_DIGIT = 4'd12;
        end
    endcase
end

always@(*)
begin 
    case(ACT_DIGIT) //digit
        4'd0: DISPLAY = 8'b00000011;
        4'd1: DISPLAY = 8'b10011111;
        4'd2: DISPLAY = 8'b00100101;
        4'd3: DISPLAY = 8'b00001101;
        4'd4: DISPLAY = 8'b10011001;
        4'd5: DISPLAY = 8'b01001001;
        4'd6: DISPLAY = 8'b01000001;
        4'd7: DISPLAY = 8'b00011111;
        4'd8: DISPLAY = 8'b00000001;
        4'd9: DISPLAY = 8'b00001001;
        4'd11: DISPLAY = 8'b11111101; //----
        4'd12: DISPLAY = 8'b11111111;
	   
	   4'd12: DISPLAY = 8'b11111111;
        default: DISPLAY = 8'b11111111;
    endcase
end
endmodule


