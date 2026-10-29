module t_ff (
	input t,
	input clk,
	input reset,
	output reg q
);

	always@(negedge clk or posedge reset) begin
		if(reset) begin
			q <= 1'b0;
		end else if(t) begin
			q <= ~q;
		end
	end
endmodule

module up_counter (
	input clk,
	input reset,
	output [3:0]q
);

t_ff ff0(.t(1'b1),.clk(clk),.reset(reset),.q(q[0]));
t_ff ff1(.t(1'b1),.clk(clk),.reset(reset),.q(q[1]));
t_ff ff2(.t(1'b1),.clk(clk),.reset(reset),.q(q[2]));
t_ff ff3(.t(1'b1),.clk(clk),.reset(reset),.q(q[3]));

endmodule
		