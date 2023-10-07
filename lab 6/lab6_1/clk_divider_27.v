module clk_divider_27(clk, clk_div_27);
    
input clk;
output clk_div_27;

reg clk_div_27;
reg [25:0] counter;

always@(posedge clk)
begin
            counter <= counter + 26'd1;
            if(counter == 26'd50000000 - 26'd1) begin
                clk_div_27 <= ~clk_div_27;
                counter <= 26'd0;
            end
end
endmodule