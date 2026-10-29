`timescale 1ns/1ns
`include "d_ff.v"

module d_ff_tb();

reg clk;
reg d;
reg reset;
wire q;

d_ff ff(clk,reset,d,q);

initial begin
clk = 0;
forever #20 clk = ~clk;
end

initial begin
	$dumpfile("d_ff_tb.vcd");
	$dumpvars(0,d_ff_tb);
end

initial begin

	reset = 1; d = 0;
	#15;

	reset = 0; d = 1;
	#30;

	d = 0;
	#10;

	d = 1;
	#15;

	reset = 1; d =1;
	#45;

	d = 0;
	#10;

	d =1;
	#20;

		$display("Test COmplete");
		$finish;

	end
endmodule