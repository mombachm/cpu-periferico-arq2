`timescale 1ns / 1ps

module fsmCPU(clk2,rst2,ack,data,send);

	output reg [2:0] data;    //dado 
	output reg send;    //send - [1 - dado enviado; 0 - pronto para enviar dado]

	input ack;		          //ack [1 - aguardando retorno; 2 - esperando envio de dado]
	input clk2;		          //clock
	input rst2;		          //reset
	
	reg S;
	reg NS;
	
	/*
	estados:
	00 = estado inicial (ack == 0 && send == 0)
	01 = esperando ack (ack == 1 && send == 1) 
	*/

	/***** STATE *****/
	always @ (posedge clk2)
		begin
			if (rst2 == 1)
				S <= 0;
			else
				S <= NS;
		end
	/***** STATE *****/

	/***** NEXT STATE *****/
	always @ (*)
		begin
			case ({S})
				0://estado 00
					if (ack == 0)
						NS = 0;
					else
						NS = 1;
        1://estdo 01
					if (ack == 0)
          begin
						NS = 0;
            data = 0;
          end
					else
						NS = 1;
			endcase
		end
	/***** NEXT STATE *****/

	/***** OUTPUTS *****/
	always @ (*)
		begin
			case ({S})
				0://estado 00
				begin
					send	= 1;
					data  = $urandom%7; 
				end
				1://estado 01
				begin
					send = 0;
				end
			endcase
		end
	/***** OUTPUTS *****/
endmodule