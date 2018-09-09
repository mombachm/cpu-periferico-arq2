`timescale 1ns / 1ps

`include "src/modulo-cpu.v" 
`include "src/modulo-periferico.v" 

module testbench;

  reg Running;
  reg Running2;

	//*** Inputs Periferico ***
  //alterar para wire ao testar com a CPU
	wire send;

	reg clk1;
	reg rst1;

  //alterar para wire ao testar com a CPU
	wire [2:0] dataWire;

  //*** Inputs CPU ***
	reg clk2;
	reg rst2;

	// Outputs
	wire ack;

	// Instantiate the Unit Under Test (UUT)
	fsmPeriferico fsmPeriferico (
    //vai ser o output da CPU (wire)
		.send(send), 
    //vai ser o output da CPU (wire)
		.dataInput(dataWire), 
    .ack(ack),
		.clk1(clk1), 
		.rst1(rst1)
	);

  fsmCPU fsmCPU (
		.clk2(clk2), 
		.rst2(rst2),
    .ack(ack),
    .data(dataWire),
    .send(send)
	);

	initial begin
    // Dump waves
    $dumpfile("dump.vcd");
    //$dumpfile("clock2xPeriferico.vcd");
    //$dumpfile("clock2xCPU.vcd");
    //$dumpfile("clock10xCPU.vcd");
    //$dumpfile("clock10xPeriferico.vcd");
    $dumpvars(3);
		// Initialize Inputs
		clk1 = 0;
		rst1 = 1;

    clk2 = 0;
		rst2 = 1;

		#200;

    rst1 = 0;
    rst2 = 0;

    #2000 
    
    Running = 0;
    Running2 = 0;
	end

//clock periferico
initial begin
  clk1 = 0;
  Running = 1;
  while (Running) begin
    #50 clk1 = ~clk1;
  end
end

//clock cpu
initial begin
  clk2 = 0;
  #50
  Running2 = 1;
  while (Running2) begin
    #25 clk2 = ~clk2;
  end
end
  
endmodule

