`timescale 1ns/1ns
`include "q1.v"

module q1_tb();

reg w;
reg clk;
reg reset;
wire [3:0]q;

ring_count4bit uut(w,clk,reset,q);

initial begin
	clk = 0;
	forever #20 clk = ~clk;
end

initial begin
	$dumpfile("q1_tb.vcd");
	$dumpvars(0,q1_tb);

reset = 1;
w = 0;
#60;

reset = 0;
w = 1;
#70;

w = 0;
#70;

reset = 1;
#70;

$display("Test complete");
$finish;

end
endmodule