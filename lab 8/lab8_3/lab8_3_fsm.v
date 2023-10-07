`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2021 12:32:08 AM
// Design Name: 
// Module Name: lab8_3_fsm
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


module lab8_3_fsm(clk, rst_n, key_in, digit_in, digit_last, curr_state, val_1, val_2, val_3, val_4, add_enable, sub_enable, mul_enable, result_enable);
input clk;
input rst_n;
input key_in;
input [511:0] digit_in;
input [8:0] digit_last;
output add_enable, sub_enable, mul_enable, result_enable;
output [2:0] curr_state;
output [8:0] val_1, val_2, val_3, val_4;

reg [2:0] curr_state;
reg [2:0] next_state;
reg [8:0] val_1, val_2, val_3, val_4;
reg [8:0] temper1, temper2, temper3, temper4;
reg add_enable, sub_enable, mul_enable, result_enable;
reg temper_add, temper_sub, temper_mul, temper_result;

always @*
begin
    next_state = 0;
    case (curr_state)
        3'b000: 
        begin 
            if (key_in && digit_in[511:0])
            begin 
                next_state = 3'b001;
                temper_add = 1'b0;
                temper_sub = 1'b0;
                temper_mul = 1'b0;
                temper_result = 1'b0;    
                temper1 = digit_last;
                temper2 = val_2;
                temper3 = val_3;
                temper4 = val_4;                    
            end
            else         
            begin 
                next_state = 3'b000; 
                temper_add = add_enable;
                temper_sub = sub_enable;
                temper_mul = mul_enable;             
                temper_result = result_enable;      
                temper1 = val_1;
                temper2 = val_2;
                temper3 = val_3;
                temper4 = val_4;                          
            end
          end
         3'b001: 
          begin 
            if (key_in && digit_in[511:0])
            begin 
                next_state = 3'b100;
                temper_add = 1'b0;
                temper_sub = 1'b0;
                temper_mul = 1'b0;             
                temper_result = 1'b0;    
                temper1 = val_1;
                temper2 = digit_last;
                temper3 = val_3;
                temper4 = val_4;                    
            end
            else         
            begin 
                next_state = 3'b001; 
                temper_add = add_enable;
                temper_sub = sub_enable;
                temper_mul = mul_enable;         
                temper_result = result_enable;    
                temper1 = val_1;
                temper2 = val_2;
                temper3 = val_3;
                temper4 = val_4;                     
            end
        end
       3'b100: 
        begin 
            if (key_in && digit_in[9'h01C])
            begin
                next_state = 3'b010;
                temper_add = 1'b1;
                temper_sub = 1'b0;
                temper_mul = 1'b0;
                temper_result = 1'b0; 
                temper1 = val_1;
                temper2 = val_2;
                temper3 = val_3;
                temper4 = val_4;                       
            end
            else if (key_in && digit_in[9'h01B])
            begin
                next_state = 3'b010;
                temper_add = 1'b0;
                temper_sub = 1'b1;
                temper_mul = 1'b0;
                temper_result = 1'b0; 
                temper1 = val_1;
                temper2 = val_2;
                temper3 = val_3;
                temper4 = val_4;                       
            end
            else if (key_in && digit_in[9'h03A])
            begin
                next_state = 3'b010;
                temper_add = 1'b0;
                temper_sub = 1'b0;
                temper_mul = 1'b1;                        
                temper_result = 1'b0;  
                temper1 = val_1;
                temper2 = val_2;
                temper3 = val_3;
                temper4 = val_4;                      
            end
            else         
            begin 
                next_state = 3'b100; 
                temper_add = add_enable;
                temper_sub = sub_enable;
                temper_mul = mul_enable;               
                temper_result = result_enable;  
                temper1 = val_1;
                temper2 = val_2;
                temper3 = val_3;
                temper4 = val_4;                     
            end
        end
        3'b010: 
        begin 
            if (key_in && digit_in[511:0])
            begin 
                next_state = 3'b011; 
                temper_add = add_enable;
                temper_sub = sub_enable;
                temper_mul = mul_enable;
                temper_result = result_enable;  
                temper1 = val_1;
                temper2 = val_2;
                temper3 = digit_last;
                temper4 = val_4;                      
            end
            else         
            begin 
                next_state = 3'b010; 
                temper_add = add_enable;
                temper_sub = sub_enable;
                temper_mul = mul_enable; 
                temper_result = result_enable; 
                temper1 = val_1;
                temper2 = val_2;
                temper3 = val_3;
                temper4 = val_4;                       
            end
        end
        3'b011: 
         begin 
            if (key_in && digit_in[511:0])
            begin 
                next_state = 3'b101; 
                temper1 = val_1;
                temper2 = val_2;
                temper3 = val_3;
                temper4 = digit_last;
                temper_add = add_enable;
                temper_sub = sub_enable;
                temper_mul = mul_enable;
                temper_result = result_enable;                        
            end
            else         
            begin 
                next_state = 3'b011; 
                temper_add = add_enable;
                temper_sub = sub_enable;
                temper_mul = mul_enable; 
                temper_result = result_enable;  
                temper1 = val_1;
                temper2 = val_2;
                temper3 = val_3;
                temper4 = val_4;                      
            end
        end
        3'b101: 
         begin 
            if (key_in && digit_in[9'h05A])
            begin 
                next_state = 3'b111; 
                temper_add = add_enable;
                temper_sub = sub_enable;
                temper_mul = mul_enable;
                temper_result = 1'b1;   
                temper1 = val_1;
                temper2 = val_2;
                temper3 = val_3;
                temper4 = val_4;                     
            end
            else         
            begin 
                next_state = 3'b101; 
                temper_add = add_enable;
                temper_sub = sub_enable;
                temper_mul = mul_enable; 
                temper_result = result_enable;    
                temper1 = val_1;
                temper2 = val_2;
                temper3 = val_3;
                temper4 = val_4;                    
            end
        end
        3'b111:
        begin 
            if (key_in && digit_in[9'h02D])
            begin 
                next_state = 3'b000; 
                temper_add = 1'b0;
                temper_sub = 1'b0;
                temper_mul = 1'b0;
                temper_result = 1'b0;   
                temper1 = 9'd0;
                temper2 = 9'd0;
                temper3 = 9'd0;
                temper4 = 9'd0;                     
            end
            else         
            begin 
                next_state = 3'b111; 
                temper_add = add_enable;
                temper_sub = sub_enable;
                temper_mul = mul_enable; 
                temper_result = result_enable;     
                temper1 = val_1;
                temper2 = val_2;
                temper3 = val_3;
                temper4 = val_4;                   
            end
        end                                 
    endcase
end


always @ (posedge clk or negedge rst_n)
if (~rst_n)
begin
    curr_state <= 3'b000;
    add_enable <= 1'b0;
    sub_enable <= 1'b0;
    mul_enable <= 1'b0;
    result_enable <= 1'b0;
    val_1 <= 9'h070;
    val_2 <= 9'h070;
    val_3 <= 9'h070;
    val_4 <= 9'h070;
end
else
begin
    curr_state <= next_state;
    add_enable <= temper_add;
    sub_enable <= temper_sub;
    mul_enable <= temper_mul;
    result_enable <= temper_result;
    val_1 <= temper1;
    val_2 <= temper2;
    val_3 <= temper3;
    val_4 <= temper4;
end

endmodule
