`timescale 1ns / 1ps
/* alu_control.v */

module alu_control(
    input	wire	[5:0]	funct,
    input	wire	[1:0]	aluop,
    output	reg		[2:0]	select
    );
	
	
	parameter		Rtype 		=	2'b10; //this is a 2 bit paramter,
			//These are the function field paramters for Rtype. Use Fig 3.2 to complete
	parameter			Radd		=	6'b100000;
	parameter			Rsub		=	6'b100010;
	parameter			Rand		=	6'b100100;
	parameter			Ror			=	6'b100101;
	parameter			Rslt		=	6'b101010;
	
	parameter		lwsw		=	2'b00;		//since LW and SW use the same bit pattern, only way to store them as a paramter
	parameter		Itype		=	2'b01;		// beq
	parameter		xis			=	6'bXXXXXX;
		
	
	parameter	ALUadd		=	3'b010;
	parameter	ALUsub		=	3'b110;
	parameter	ALUand		=	3'b000;
	parameter	ALUor		=	3'b001;
	parameter	ALUslt		=	3'b111;
					
	parameter	unknown		=	2'b11;
	parameter	ALUx		=	3'b011;
	
	initial
		select <= 0;
	
	always@* begin
		
		if (aluop == Rtype)
		 begin
			case(funct)
			   //assign the correct select value baesd on the function field.
				//Use Fig 3.2 to aid you in this.
				Radd:			select <= ALUadd;
				Rsub:			select <= ALUsub;
				Rand:			select <= ALUand;
				Ror:			select <= ALUor;
				Rslt:			select <= ALUslt;
				default:		select <= ALUx;
			endcase
	    end
		 
		//For all Other Types. Use figure 3.2 to help you out. 
		//Feel free to reuse any of the paramters defined aove.
		
		else if (aluop == lwsw)	begin
			select <= ALUadd;
		end
		
		else if (aluop == Itype) begin		
			select <= ALUsub;
		end
		
		else if (aluop == unknown) begin	
			select <= ALUx;
		end
		// Redundant for completeness
		else begin
			select <= select;			
	    end	
	end
	
endmodule

//If the input information does not correspond to any valid instruction,
//aluop = 2'b11 which sets control = ALUx = 3'b011 
//and ALU output is 32 x's as required by lab manual. 