`timescale 1ns / 1ps

module fsmCPU(clk2,rst2);

	input clk2;//clock 
	input rst2;//reset
	
	reg [1:0] S;//state
	reg [1:0] NS;//next state

	/***** STATE *****/
	always @ (posedge clk2)
		begin

		end
	/***** STATE *****/

	/***** NEXT STATE *****/
	always @ (*)
		begin

		end
	/***** NEXT STATE *****/

	/***** OUTPUTS *****/
	always @ (*)
		begin

		end
	/***** OUTPUTS *****/
endmodule