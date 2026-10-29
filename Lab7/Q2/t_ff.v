module t_ff (
	input clk,
	input reset,
	input t,
	output reg q
);

always@(negedge clk or negedge reset) begin
	if(!reset) begin
		q <= 1'b0;
	end else if(t) begin
		q <= ~q;
	end
end
endmodule