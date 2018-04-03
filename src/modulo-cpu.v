`timescale 1ns / 1ps

module fsmCPU(clk2,rst2,ack,dado,send);

    output reg [1:0] dado;    //dado 
	output reg [1:0] send;    //send - [1 - dado enviado; 0 - pronto para enviar dado]

    input ack;		          //ack [1 - aguardando retorno; 2 - esperando envio de dado]
	input clk2;		          //clock
	input rst2;		          //reset
	
	reg [1:0] S;
	reg [1:0] NS;
	
	/*
	estados:
	00 = estado inicial (ack == 0 && send == 0)
	01 = esperando ack (ack == 1 && send == 1) 
	*/

	/***** STATE *****/
	always @ (posedge clk2)
		begin
			if (rst2 == 1)
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
				begin
					if (rst2 == 1 || ack == 0)
					begin
						NS = 2'b00;
						send = 0;
						dado = 0;  //==================> Se não funcionar, testar sem
					end
					else if (ack == 1 && rst2 == 0)
					begin
						NS = 2'b01;
						send = 1;
						dado = 1;
					end
				end
                2'b01://estdo 01
				begin
					if (ack == 1)
					begin
						NS = 2'b01;
						send = 0;
						dado = 0;  //==================> Se não funcionar, testar sem
					end
					else if (ack == 0)
					begin
						NS = 2'b00;
						send = 1;
						dado = 1;
					end
				end
			endcase
		end
	/***** NEXT STATE *****/

	/***** OUTPUTS *****/
	always @ (*)
		begin
			case ({S})
				2'b00://estado 00
				begin
					send	= 1;
					dado    = 1;
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