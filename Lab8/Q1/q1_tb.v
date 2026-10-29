`timescale 1ns/1ns
`include "q1.v"

module q1_tb();

reg serial_in;
reg clk;
reg reset;
wire [5:0]q;

shift_reg_6_bit regis(.serial_in(serial_in),.clk(clk),.reset(reset),.q(q));

initial begin
	clk = 0;
	forever #20 clk = ~clk;
end

initial begin
	$dumpfile("q1_tb.vcd");
	$dumpvars(0,q1_tb);
end

initial begin

	reset = 1; 
	serial_in = 0;
	#20;

	reset = 0;
	
	serial_in  = 1; #40;
	serial_in = 0;	#40;
	serial_in = 1;	#40;
	serial_in = 0;	#40;
	serial_in = 0;	#40;
	serial_in = 1;	#40;

	serial_in = 0; #20;


	$display("Test complete");
	$finish;

end
endmodule

