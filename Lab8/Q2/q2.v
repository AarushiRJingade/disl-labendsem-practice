module nbit_register # (parameter N = 8)(
	input [N-1:0]d,
	input clk,
	input reset,
	output reg [N-1:0]q
);

always@(posedge clk or posedge reset) begin
	if(reset) begin
		q <= 1'b0;
	end else begin
		q <= d;
	end
end endmodule


