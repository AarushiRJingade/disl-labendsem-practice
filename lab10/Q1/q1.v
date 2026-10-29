module jk_ff(
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
			endcase
		end
	end
endmodule

module ring_count4bit (
	input w,
	input clk,
	input reset,
	output [3:0]q
);

wire t0,t1,t2,t3;

assign t0 = (w & q[0]) | (~w & ~q[0]);
assign t1 = (w & q[0] & q[1]) | (~w & ~q[0] & ~q[1]);
assign t2 = (w & q[0] & q[1] & q[2]) | (~w & ~q[0] & ~q[1] & ~q[2]);
assign t3 = (w & q[0] & q[1] & q[2] & q[3]) | (~w & ~q[0] & ~q[1] & ~q[2] & ~q[3]);

jk_ff ff1(.j(t0) , .k(t0), .clk(clk), .reset(reset) , .q(q[0]));
jk_ff ff2(.j(t1) , .k(t1), .clk(clk), .reset(reset) , .q(q[1]));
jk_ff ff3(.j(t2) , .k(t2), .clk(clk), .reset(reset) , .q(q[2]));
jk_ff ff4(.j(t3) , .k(t3), .clk(clk), .reset(reset) , .q(q[3]));

endmodule

