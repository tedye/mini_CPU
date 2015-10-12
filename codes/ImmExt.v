`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:51:21 11/21/2014 
// Design Name: 
// Module Name:    ImmExt 
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
module ImmExt(extendedIMM, IMM, OPCODE);
output 	[31:0]		extendedIMM;
input 	[25:0]		IMM;
input 	[5:0]			OPCODE;
wire 		[31:0]		ZE,SE,JSE;

ZeroExt 			z 	(ZE,IMM[15:0]);  // zero extend
SignExt 			s0	(SE,IMM[15:0]);  // sign extend for I type
SignExt #(26)	s1	(JSE,IMM);		  // for jump

function [31:0] ext;
input [31:0] ze,se,jse;
input [5:0] opcode;

begin
case (opcode[5:4])
	'b00: ext = jse;
	'b01: ext = 0; 
	'b10: ext = se; 
	'b11: case (opcode[3:0])
				'b0010: ext = se; 
				'b0011: ext = se; 
				'b0111: ext = se;
				'b1101: ext = se;
				'b1110: ext = se;
				default: ext = ze;
			endcase
endcase
end

endfunction

assign extendedIMM = ext(ZE,SE,JSE,OPCODE);

endmodule
