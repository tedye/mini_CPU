`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:45:04 11/21/2014 
// Design Name: 
// Module Name:    ALUController 
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
module ALUController(ALUControl, ALUOP, opcode);
output reg[3:0]	ALUControl;
input	 [1:0]	ALUOP;
input  [5:0]	opcode;

always @ (ALUOP or opcode)
begin
case (ALUOP)
	'b00: ALUControl = 'b0010; //add
	'b01: ALUControl = 'b0011; //sub
	'b10: ALUControl = opcode[3:0];
endcase
end
endmodule
