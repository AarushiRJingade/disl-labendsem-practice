`timescale 1ns/1ns
`include "q1.v"

module q1_tb();

reg E,x,clk,reset;
wire A,B;

seq_cir uut(E,x,clk,reset,A,B);

initial begin
	clk = 0;
	forever #20 clk = ~clk;
end

initial begin
	$dumpfile("q1_tb.vcd");
	$dumpvars(0,q1_tb);

reset = 1;
E = 0;
x = 0;
#30;

reset = 0; #40;

E = 0; x = 0;
#40;

E = 0; x = 1;
#40;

E = 1; x = 1;
#40;

E = 1; x = 0;
#40;

reset = 1;
#20;
E = 0;
#20;

$display("Test complete");
$finish;

end
endmodule