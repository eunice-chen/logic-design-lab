`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/02/2021 03:03:30 PM
// Design Name: 
// Module Name: vol_gen
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

module vol_gen(clk, rst_n, high, low, digit0, digit1, high_vol, low_vol);
    input clk;
    input rst_n;
    input high, low; 
    output [3:0] digit1, digit0; 
    output [15:0] high_vol, low_vol;      
    reg [3:0] vol;  
    reg [3:0] temp, high_temp, low_temp; 
    reg [3:0] digit1, digit0;
    reg [15:0] high_vol, low_vol;
    
    always@*
        if (vol > 4'd0)
            low_temp = vol - 1'd1;
        else
            low_temp = vol;
            
    always@*        
        if (vol < 4'd15)
            high_temp = vol +1'b1;
        else
            high_temp = vol;
    
    always@*
        case({high, low})
            2'b10:
                temp = high_temp;
            2'b01:
                temp = low_temp;
            default:
                temp = vol;
         endcase

    always@*
        case(vol)
            4'd15: {high_vol,low_vol,digit1,digit0} = {16'h7fff, 16'h8001, 4'd1, 4'd6};
            4'd14: {high_vol,low_vol,digit1,digit0} = {16'h75ff, 16'h8a01, 4'd1, 4'd5};
            4'd13: {high_vol,low_vol,digit1,digit0} = {16'h6fff, 16'h9001, 4'd1, 4'd4};
            4'd12: {high_vol,low_vol,digit1,digit0} = {16'h65ff, 16'h9a01, 4'd1, 4'd3};
            4'd11: {high_vol,low_vol,digit1,digit0} = {16'h5fff, 16'ha001, 4'd1, 4'd2}; 
            4'd10: {high_vol,low_vol,digit1,digit0} = {16'h55ff, 16'haa01, 4'd1, 4'd1};
            4'd9: {high_vol,low_vol,digit1,digit0} = {16'h4fff, 16'hb001, 4'd1, 4'd0};
            4'd8: {high_vol,low_vol,digit1,digit0} = {16'h45ff, 16'hba01, 4'd0, 4'd9};
            4'd7: {high_vol,low_vol,digit1,digit0} = {16'h3fff, 16'hc001, 4'd0, 4'd8};  
            4'd6: {high_vol,low_vol,digit1,digit0} = {16'h35ff, 16'hca01, 4'd0, 4'd7};
            4'd5: {high_vol,low_vol,digit1,digit0} = {16'h2fff, 16'hd001, 4'd0, 4'd6};
            4'd4: {high_vol,low_vol,digit1,digit0} = {16'h25ff, 16'hda01, 4'd0, 4'd5};
            4'd3: {high_vol,low_vol,digit1,digit0} = {16'h1fff, 16'he001, 4'd0, 4'd4};
            4'd2: {high_vol,low_vol,digit1,digit0} = {16'h15ff, 16'hea01, 4'd0, 4'd3}; 
            4'd1: {high_vol,low_vol,digit1,digit0} = {16'h0fff, 16'hf001, 4'd0, 4'd2};
            4'd0: {high_vol,low_vol,digit1,digit0} = {16'h05ff, 16'hfa01, 4'd0, 4'd1};
            
            default: 
                {high_vol, low_vol, digit1, digit0} = {16'h0, 16'h0, 1'b0, 1'b0};
        endcase

         always@(posedge clk or negedge rst_n)
                if (~rst_n)
                    vol <= 4'b0;
                else
                    vol <= temp;

endmodule
