`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:47:35 11/23/2014 
// Design Name: 
// Module Name:    readPortContoller 
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
module readPortContoller(ReadPortSelect, opcode);
output [1:0]ReadPortSelect;
input [5:0] opcode;

function [1:0] readport;
input [5:0] op;

begin 
case (op[5:4])
	'b00:	case(opcode[1:0]) 
				'b11: readport = 'b01;
				default: readport = 'b00;
			endcase
	'b01: readport = 'b00;
	'b10: readport = 'b10;	// branch 1-R1, 0-R2
	'b11: case (op[3:0])
				'b1001: readport = 'b01; // LI,LUI readport1 get R1
				'b1010: readport = 'b01;
				'b1100: readport = 'b10; // SWI,SW
				'b1110: readport = 'b10;
				default: readport = 'b00;
			endcase
endcase
end
endfunction

assign ReadPortSelect = readport(opcode);

endmodule
