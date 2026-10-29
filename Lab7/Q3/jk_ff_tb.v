`timescale 1ns/1ns
`include "jk_ff.v"

module jk_ff_tb();

reg j;
reg k;
reg clk;
reg reset;
wire q;

jk_ff ff(.j(j),.k(k),.clk(clk),.reset(reset),.q(q));

initial begin
	clk = 0;
	forever #20 clk = ~clk;
end


initial begin
	$dumpfile("jk_ff_tb.vcd");
	$dumpvars(0,jk_ff_tb);
end


initial begin
	reset = 1; 
	j = 1; k = 0;
	#40;
	
	reset = 0;
	j = 0; k = 0;
	#40;

	j = 0; k = 1;
	#45;

	j = 1; k = 1;
	#45;

	reset = 1; j = 0; k = 0;
	#40;

	reset = 0;
	#40;

$display("test complete");
$finish;

end
endmodule