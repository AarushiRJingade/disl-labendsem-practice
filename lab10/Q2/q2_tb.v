`timescale 1ns/1ns
`include "q2.v"

module q2_tb();

reg clk, reset;
wire [3:0]q;

up_counter uut(.clk(clk), .reset(reset), .q(q));

initial begin
	clk = 0;
	forever #20 clk = ~clk;
end

initial begin
	$dumpfile("q2_tb.vcd");
	$dumpvars(0,q2_tb);

reset = 1;
#10;

reset = 0;
#200;

$display("test complete");
$finish;

end
endmodule