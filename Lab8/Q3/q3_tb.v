`timescale 1ns/1ns
`include "q3.v"

module q3_tb();

reg clk,reset;
wire [4:0]q;

johnson jj(clk,reset,q);

initial begin
	clk = 0;
	forever #20 clk = ~clk;
end

initial begin
	$dumpfile("q3_tb.vcd");
	$dumpvars(0,q3_tb);

	reset = 1;
	#50;
	reset = 0;
	#120;

	$display("Test complete");
	$finish;
end
endmodule