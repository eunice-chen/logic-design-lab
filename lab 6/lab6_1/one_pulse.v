module one_pulse(
	input clk,
	input in_trig,
	output reg one_pulse
	);
	
	reg trig_delay;
	reg out_pulse_next;
	
	always@(posedge clk) begin
        trig_delay <= in_trig;
	end
	
	always@* begin
		if( (in_trig == 1'b1) & (~trig_delay == 1'b1)) out_pulse_next = 1;
		else out_pulse_next = 0;
	end
	
	always@(posedge clk) begin
        one_pulse <= out_pulse_next;
	end
endmodule