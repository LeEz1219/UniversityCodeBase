//Filename:test−alu.v
//Description:TestmodulefortheALU
//'include"alu.v"

module alu_test();

//RegisterDeclarations

reg [31:0] a, b;
reg [2:0] control;

//WirePorts
wire [31:0] result;
wire zero;
initial
	begin
	a <= 'b1010;
	b <= 'b0111;
	control <= 3'b011;
	
	#1
	$display("A = %b\t B = %b", a, b);
	$monitor("ALUOp = %b\t result = %b", control, result);
	#1
//	$display("A = %b\t B = %b", a, b);
//	$monitor("ALUOp = %b\t result = %b", control, result);
	control <= 3'b100;
	#1
	control <= 3'b010;
	#1
	control <= 3'b111;
	#1
	control <= 3'b011;
	#1
	control <= 3'b110;
	#1
	control <= 3'b001;
	#1
	control <= 3'b000;
	#1
	$finish;
	end
alu alu1(a, b, control, result, zero);



endmodule//test