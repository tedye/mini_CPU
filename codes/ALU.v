`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:08:20 11/21/2014 
// Design Name: 
// Module Name:    ALU 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module ALU(ALUOut,A,B,ALUOp);
parameter					 	word_size = 32;
input 	[word_size-1:0] 	A,B;
input 	[3:0] ALUOp;
output 	[word_size - 1:0] ALUOut;
// ------- ideal ALU --------
function [word_size-1:0]		ALU_ideal;  // include c_out;
input		[word_size-1:0] 	R2, R3;
input		[3:0]					ALUOp;
			
	begin
	case (ALUOp)
	'b0000: ALU_ideal = R2;
	'b0001: ALU_ideal = ~R2;
	'b0010: ALU_ideal = (R2 + R3);
	'b0011: ALU_ideal = (R2 - R3);
	'b0100: ALU_ideal = (R2 | R3);
	'b0101: ALU_ideal = (R2 & R3);
	'b0110: ALU_ideal = (R2 ^ R3);
	'b0111: ALU_ideal = (($signed(R2) < $signed(R3))? 1:0);	
	'b1001: ALU_ideal = {R2[31:16],R3[15:0]}; // LI
	'b1010: ALU_ideal = {R3[15:0],R2[15:0]}; // LUI
	'b1011: ALU_ideal = R3;						// LWI
	'b1100: ALU_ideal = R3;						// SWI
	'b1101: ALU_ideal = (R2 + R3);				// LW
	'b1110: ALU_ideal = (R2 + R3);				// SW
	endcase
	end

endfunction

assign ALUOut = ALU_ideal(A,B,ALUOp);

endmodule

