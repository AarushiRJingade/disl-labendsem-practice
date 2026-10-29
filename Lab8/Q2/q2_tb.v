`timescale 1ns/1ns
`include "q2.v"

module q2_tb();

parameter N = 8;

reg [N-1:0]d;
reg clk;
reg reset;
wire [N-1:0]q;

nbit_register uut(d,clk,reset,q);

initial begin
	clk = 0;
	forever #10 clk = ~clk;
end

initial begin
	$dumpfile("q2_tb");
	$dumpvars(0,q2_tb);

	reset = 1;
	d = 0;
	#40;

	reset = 0;
	d = 8'hAA;
	#40;

	d = 8'hF0;
	#40;

	d = 8'h00;
	#40;

	d = 8'hFF;
	#40;

	reset = 1;
	d = 8'h00;
	#20;

$display("Test complete");
$finish;

end
endmodule
