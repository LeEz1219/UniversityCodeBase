// Class: CSCI 401 Computer Architecture
// Term: SPR11
// Name(s): 
//
// Lab #1: Instruction Fetch Stage

//                              -*- Mode: Verilog -*-
// Filename        : mem.v
// Description     : The instruction memory module
//                   of the IF stage of the pipeline
// Authors         : George M. Georgiou and Scott McWilliams
// Created On      : 2/06/2003
// Modified On     : 4/5/2011
// Modified By     : Jason Fredrick and David Sturgeon

`timescale 1ns / 1ps

module memory (
   output reg [31:0] data,       // Output of Instruction Memory
   input wire [31:0] addr        // Input of Instruction Memory
   );

	parameter NOP		= 32'b1000_0000_0000_0000_0000_0000_0000_0000;	
	integer i;

   
// Register Declarations
   reg [31:0] MEM[0:127];  // 128 words of 32-bit memory

   	initial begin

		data <= 0;
		
		//  Initialize DMEM[0-5] from data.txt
		$readmemb("risc.txt",MEM);
		for (i = 37; i < 127; i = i + 1)
			MEM[i] = NOP;
		#0	
		for (i = 0; i < 24; i = i + 1)
			$display(MEM[i]);
		
	end
/* Initialize Registers
   initial begin
   MEM[0] <= 'h002300AA;
   MEM[1] <= 'h10654321;
   MEM[2] <= 'h00100022;
   MEM[3] <= 'h8C123456;
   MEM[4] <= 'h8F123456;
   MEM[5] <= 'hAD654321;
   MEM[6] <= 'h13012345;
   MEM[7] <= 'hAC654321;
   MEM[8] <= 'h12012345;
   MEM[9] <= 'h00000000;
   end */
   
   always @ (addr) data <= MEM[addr];
endmodule // memory
