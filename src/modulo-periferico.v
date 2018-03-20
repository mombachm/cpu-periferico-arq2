`timescale 1ns / 1ps

module fsmPeriferico(send,dataInput,ack,clk1,rst1);

	output reg ack;

	input send;
  input [1:0] dataInput;
	input clk1;
	input rst1;

  reg [1:0] data;
	
	reg S;//state
	reg NS;//next state

	/***** STATE *****/
	always @ (posedge clk1)
		begin
			if(rst1 == 1)
      begin
				S <= 0;
        data <= 2'b00;
      end
			else
				S <= NS;
		end
	/***** STATE *****/

	/***** NEXT STATE *****/
	always @ (*)
		begin
			case ({S})
				0://estado 00
					if(send == 1)
						NS = 1;
					else
						NS = 0;
				1://estado 01
					if(send == 1)
						NS = 1;
					else
						NS = 0;
			endcase
		end
	/***** NEXT STATE *****/

	/***** OUTPUTS *****/
	always @ (*)
		begin
			case ({S})
				0:begin
					ack = 0;
				end
				1:begin
          data = dataInput;
					ack = 1;
				end
			endcase
		end
	/***** OUTPUTS *****/
endmodule