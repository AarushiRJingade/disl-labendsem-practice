module d_ff(
	input d,
	input clk,
	input reset,
	output reg q
);

always@(posedge clk or posedge reset) begin
	if(reset) begin
		q <= 1'b0;
	end else begin
		q <= d;
	end
end
endmodule


module 	shift_reg_6_bit(
	input serial_in,
	input clk,
	input reset,
	output [5:0]q
);

d_ff ff1(.d(serial_in),.clk(clk),.reset(reset),.q(q[0]));
d_ff ff2(.d(q[0]),.clk(clk),.reset(reset),.q(q[1]));
d_ff ff3(.d(q[1]),.clk(clk),.reset(reset),.q(q[2]));
d_ff ff4(.d(q[2]),.clk(clk),.reset(reset),.q(q[3]));
d_ff ff5(.d(q[3]),.clk(clk),.reset(reset),.q(q[4]));
d_ff ff6(.d(q[5]),.clk(clk),.reset(reset),.q(q[5]));

endmodule