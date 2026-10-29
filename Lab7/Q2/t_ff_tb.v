`timescale 1ns/1ns
`include "t_ff.v"

module t_ff_tb();

reg clk;
reg reset;
reg t;
wire q;

t_ff ff(clk,reset,t,q);

initial begin 
	clk = 0;
	forever #20 clk = ~clk;
end

initial begin
	$dumpfile("t_ff_tb.vcd");
	$dumpvars(0,t_ff_tb);
end

initial begin

	reset = 0; t = 0;
	#10;

	reset = 1; t = 0;
	#20;

	t = 1;
	#15;

	reset = 0; t =1;
	#20;

	reset = 1; t = 1; 
	#25;

	t =0;
	#30;

	$display("Test Complete");
	$finish;
end
endmodule