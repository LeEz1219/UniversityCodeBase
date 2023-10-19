//Filename:test−5bitmux.v
//Description:Testingthe5bitmuxmodule
//oftheEXstageofthepipeline.
//‘include”5bit−mux.v”
module test_mux();
//WirePorts
wire [4:0] Y;
//RegisterDeclarations
	reg [4:0] A;
	reg [4:0] B;
	reg sel;
	mux #(
		.BITS(5)
	) mux1 (
		Y,
		A,
		B,
		sel
	); //instantiatethemux
	
	initial 
	begin
		A=5'b01010;
		B=5'b10101;
		sel = 1'b1;
		#10;
		A=5'b00000;
		#10
		sel=1'b1;
		#10;
		B=5'b11111;
		#5;
		A=5'b00101;
		#5;
		sel=1'b0;
		B=5'b11101;
		#5;
		sel=1'bx;
	end
	
	always @(A or B or sel)
		#1 $display("At t= %0d sel= %b A= %b B= %b Y= %b", $time, sel, A, B, Y);
	
endmodule//test
