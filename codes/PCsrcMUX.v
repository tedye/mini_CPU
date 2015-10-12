`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:40:06 11/21/2014 
// Design Name: 
// Module Name:    PCsrcMUX 
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
module PCsrcMUX(nPC,PCPlusOne,PCBrOrJump,PCSRC);
output 	reg [31:0]	nPC;
input 	[31:0]	PCPlusOne, PCBrOrJump;
input 				PCSRC;

always @ (PCSRC or PCPlusOne or PCBrOrJump)
begin
case (PCSRC)
	'b0:  nPC = PCPlusOne;
	'b1:  nPC = PCBrOrJump;
endcase
end
endmodule
