module jkff(
	input j,
	input k,
	input clk,
	input reset,
	output reg q
);

always@(posedge clk or posedge reset) begin
	if(reset) begin
		q <= 1'b0;
	end else begin
		case({j,k})
	2'b00: q <= q;
	2'b01: q <= 1'b0;
	2'b10: q <= 1'b1;
	2'b11: q <= ~q;
	default : q <= q;
		endcase
end
end
endmodule

module seq_cir(
	input E,
	input x,
	input clk,
	input reset,
	output A,
	output B
);
wire Ja,Ka,Jb,Kb;

assign Ja = E&((B&x) | (~B&~x));
assign Ka = E&((B&x) | (~B&~x));

assign Jb = E;
assign Kb = E;

jkff ff1(.j(Ja),.k(Ka),.clk(clk),.reset(reset),.q(A));
jkff ff2(.j(Jb),.k(Kb),.clk(clk),.reset(reset),.q(B));

endmodule