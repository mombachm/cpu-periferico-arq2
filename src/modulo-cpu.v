`timescale 1ns / 1ps

module fsmCPU(clk2,rst2);

    output reg [1:0] dado;    //dado 
	output reg [1:0] send;    //send - [1 - dado enviado; 0 - pronto para enviar dado]

    input ack;		          //ack [1 - aguardando retorno; 2 - esperando envio de dado]
	input clk;		          //clock
	input rst;		          //reset
	
	reg S  [1:0];
	reg NS [1:0];
	
	/*
	estados:
	00 = estado inicial (ack == 0 && send == 0)
	01 = esperando ack (ack == 1 && send == 1) 
	*/

	/***** STATE *****/
	always @ (posedge clk2)
		begin
			if(rst == 1)
				S <= 2'b00;
			else
				S <= NS;
		end
	/***** STATE *****/

	/***** NEXT STATE *****/
	always @ (*)
		begin
			case ({S})
				2'b00://estado 00
					if(rst == 1 || ack == 0)
						NS = 2'b00;
						send = 0;
					else if (ack == 1 && rst == 0)
						NS = 2'b01;
						send = 1;
                2'b01://estdo 01
					if(ack == 1)
						NS = 2'b01;
						send = 0;
					else if (ack == 0)
						NS = 2'b00;
						send = 1;
			endcase
		end
	/***** NEXT STATE *****/

	/***** OUTPUTS *****/
	always @ (*)
		begin
			case ({S})
				2'b00://estado 00
				begin
					send	= 0;
					dado    = 0;
				end
				2'b01://estado 01
				begin
					send    = 0;
					dado	= 0;
				end
			endcase
		end
	/***** OUTPUTS *****/
endmodule