module lab6_1(
    input clk,
    input lap,
    input en,
  //  input reset,
    output[3:0] DIGIT,
    output[7:0] DISPLAY,
    output[15:0] led
    );

wire lap;
wire en;

reg[3:0] DIGIT = 4'b0000;
reg[7:0] DISPLAY = 8'b00000000;
reg[15:0] led = 16'b0000000000000001;

reg[3:0] digit1 = 4'd0;
reg[3:0] digit2 = 4'd0;
reg[3:0] digit3 = 4'd0;
reg[3:0] digit4 = 4'd0;

reg[3:0] next_digit1 = 4'd0;
reg[3:0] next_digit2 = 4'd0;
reg[3:0] next_digit3 = 4'd0;
reg[3:0] next_digit4 = 4'd0;

reg[3:0] current_digit1 = 4'd0; 
reg[3:0] current_digit2 = 4'd0; 
reg[3:0] current_digit3 = 4'd0; 
reg[3:0] current_digit4 = 4'd0; 

reg[3:0] ACT_DIGIT = 4'd0;

wire clk_div_27;
wire clk_div_20;
wire clk_div_26;

reg[19:0] scan_ctl_counter;
wire[1:0] scan_ctl;

wire en_pulse;
wire rst_pulse;
wire lap_pulse;

reg resume = 1'b0;
reg lap_enable = 1'b0;
reg rst = 1'b0;
reg next_lap_enable;
reg next_resume;

clk_divider_27 clk27(.clk(clk), .clk_div_27(clk_div_27));
clk_divider_20 clk20(.clk(clk), .clk_div_20(clk_div_20));
clk_divider_26 clk26(.clk(clk), .clk_div_26(clk_div_26));

three_pulse threepulse_rst(.in_trig(lap), .clk(clk_div_26), .three_pulse(rst_pulse));
one_pulse onepulse_en(.in_trig(en), .clk(clk_div_20), .one_pulse(en_pulse));
one_pulse onepulse_lap(.in_trig(lap), .clk(clk_div_20), .one_pulse(lap_pulse));


always@(posedge clk)
begin
    scan_ctl_counter <= scan_ctl_counter + 20'd1;
end 
assign scan_ctl = scan_ctl_counter[19:18];


always@(posedge clk_div_27 or posedge rst_pulse) 
begin
    if(rst_pulse == 1)
    begin
        rst <= 1'b1;
        digit1 = 4'd0;
        digit2 = 4'd0;
        digit3 = 4'd0;
        digit4 = 4'd0;
    end
    else
    begin
        digit1 <= next_digit1;
        digit2 <= next_digit2;
        digit3 <= next_digit3;
        digit4 <= next_digit4;
    end
end

//lap
always @* begin
     if(lap_enable==1&&lap_pulse==1)
        next_lap_enable=0;

    else next_lap_enable=lap_enable+lap_pulse;
end

always@* begin
        if(lap_enable == 1 || resume == 0)
        begin
            current_digit1 = current_digit1;
            current_digit2 = current_digit2;
            current_digit3 = current_digit3;
            current_digit4 = current_digit4;
        end
        
        else
        begin
            current_digit1 = digit1;
            current_digit2 = digit2;
            current_digit3 = digit3;
            current_digit4 = digit4;
        end 
end

//resume fsm
always @* begin
     if(resume==1&&en_pulse==1)
        next_resume=0;

    else next_resume=resume+en_pulse;
end

//buffer
always@(posedge clk_div_20 or posedge rst_pulse) begin
    if(rst_pulse) begin
        rst <= 1'b1;
        lap_enable <= 1'b0;
        resume <= 1'b0;
    end
    
    else begin
    rst <= 1'b0;
    lap_enable <= next_lap_enable;
    resume <= next_resume;
    end

end

//lap display
always@*
begin
    if(lap_enable == 1)
            led = 16'b0100000000000000;    
    else
            led = 16'b0000000000000001;
end
    
//counter
always@*
begin
    if(resume == 1)
    begin
        next_digit4 = 4'd0;
        next_digit3 = 4'd0;
        next_digit2 = 4'd0;
        next_digit1 = 4'd0;
        if(digit4 != 4'd5)
        begin
            if(digit3 != 4'd9)
            begin
                if(digit2 != 4'd5)
                begin
                    if(digit1 != 4'd9)
                    begin
                        next_digit4 = digit4;
                        next_digit3 = digit3;
                        next_digit2 = digit2;
                        next_digit1 = digit1 + 4'd1;
                    end
                    else
                    begin
                        next_digit4 = digit4;
                        next_digit3 = digit3;
                        next_digit2 = digit2 + 4'd1;
                        next_digit1 = 4'd0;
                    end
                end
                else if(digit2 == 4'd5)
                begin
                    if(digit1 != 4'd9)
                    begin
                        next_digit4 = digit4;
                        next_digit3 = digit3;
                        next_digit2 = digit2;
                        next_digit1 = digit1 + 4'd1;
                    end
                    else
                    begin   
                        next_digit4 = digit4;
                        next_digit3 = digit3 + 4'd1;
                        next_digit2 = 4'd0;
                        next_digit1 = 4'd0;
                    end
                end
            end
            else if(digit3 == 4'd9)
            begin
                if(digit2 != 4'd5)
                begin
                    if(digit1 != 4'd9)
                    begin
                        next_digit4 = digit4;
                        next_digit3 = digit3;
                        next_digit2 = digit2;
                        next_digit1 = digit1 + 4'd1;
                    end
                    else
                    begin
                        next_digit4 = digit4;
                        next_digit3 = digit3;
                        next_digit2 = digit2 + 4'd1;
                        next_digit1 = 4'd0;
                    end
                end
                else if(digit2 == 4'd5)
                begin
                    if(digit1 != 4'd9)
                    begin
                        next_digit4 = digit4;
                        next_digit3 = digit3;
                        next_digit2 = digit2;
                        next_digit1 = digit1 + 4'd1;
                    end
                    else
                    begin   
                        next_digit4 = digit4 + 4'd1;
                        next_digit3 = 4'd0;
                        next_digit2 = 4'd0;
                        next_digit1 = 4'd0;
                    end
                end
            end
        end   
        else if(digit4 == 4'd5)
        begin 
            if(digit3 != 4'd9)
            begin
                if(digit2 != 4'd5)
                begin
                    if(digit1 != 4'd9)
                    begin
                        next_digit4 = digit4;
                        next_digit3 = digit3;
                        next_digit2 = digit2;
                        next_digit1 = digit1 + 4'd1;
                    end
                    else
                    begin
                        next_digit4 = digit4;
                        next_digit3 = digit3;
                        next_digit2 = digit2 + 4'd1;
                        next_digit1 = 4'd0;
                    end
                end
                else if(digit2 == 4'd5)
                begin
                    if(digit1 != 4'd9)
                    begin
                        next_digit4 = digit4;
                        next_digit3 = digit3;
                        next_digit2 = digit2;
                        next_digit1 = digit1 + 4'd1;
                    end
                    else
                    begin   
                        next_digit4 = digit4;
                        next_digit3 = digit3 + 4'd1;
                        next_digit2 = 4'd0;
                        next_digit1 = 4'd0;
                    end
                end
            end
            else if(digit3 == 4'd9)
            begin
                if(digit2 != 4'd5)
                begin
                    if(digit1 != 4'd9)
                    begin
                        next_digit4 = digit4;
                        next_digit3 = digit3;
                        next_digit2 = digit2;
                        next_digit1 = digit1 + 4'd1;
                    end
                    else
                    begin
                        next_digit4 = digit4;
                        next_digit3 = digit3;
                        next_digit2 = digit2 + 4'd1;
                        next_digit1 = 4'd0;
                    end
                end
                else if(digit2 == 4'd5)
                begin
                    if(digit1 != 4'd9)
                    begin
                        next_digit4 = digit4;
                        next_digit3 = digit3;
                        next_digit2 = digit2;
                        next_digit1 = digit1 + 4'd1;
                    end
                    else
                    begin   
                        next_digit4 = 4'd0;
                        next_digit3 = 4'd0;
                        next_digit2 = 4'd0;
                        next_digit1 = 4'd0;
                    end
                end
            end   
        end
    end
    else if(resume == 0)
    begin
        next_digit1 = 4'd0;
        next_digit2 = 4'd0;
        next_digit3 = 4'd0;
        next_digit4 = 4'd0;
    end
    else if(rst == 1'b1)
    begin
        next_digit1 = 4'd0;
        next_digit2 = 4'd0;
        next_digit3 = 4'd0;
        next_digit4 = 4'd0;
    end
    else
    begin
        next_digit4 = digit4;
        next_digit3 = digit3;
        next_digit2 = digit2;
        next_digit1 = digit1;
    end
end

//ssd display  
always@(*)
begin
    case(scan_ctl)
        2'b00:
        begin
            DIGIT = 4'b1110;
            if((lap_enable == 1 || resume == 0) && ~rst)
            begin
                ACT_DIGIT = current_digit1;
            end
            else
            ACT_DIGIT = digit1;
        end
        
        2'b01:
        begin
            DIGIT = 4'b1101;
            if((lap_enable == 1 || resume == 0) && ~rst)
            begin
                ACT_DIGIT = current_digit2;
            end
            else
            ACT_DIGIT = digit2;
        end
        2'b10:
        begin
            DIGIT = 4'b1011;
            if((lap_enable == 1 || resume == 0) && ~rst)
            begin
                ACT_DIGIT = current_digit3;
            end
            else
            ACT_DIGIT = digit3;
        end
        
        2'b11:
        begin
            DIGIT = 4'b0111;
            if((lap_enable == 1 || resume == 0) && ~rst)
            begin
                ACT_DIGIT = current_digit4;
            end
            else
            ACT_DIGIT = digit4;
        end
    endcase
end

//bcd to ssd
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
        4'd11: DISPLAY = 8'b11111110; //----
        4'd12: DISPLAY = 8'b11111111;
	4'd12: DISPLAY = 8'b11111111;
        default: DISPLAY = 8'b11111111;
    endcase
end
endmodule