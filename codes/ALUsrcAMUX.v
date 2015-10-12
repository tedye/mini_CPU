`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:18:06 11/21/2014 
// Design Name: 
// Module Name:    ALUsrcAMUX 
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
module ALUsrcAMUX(ALUsrcAout, PC, R2, ALUSRCA);
output 	[31:0] ALUsrcAout;
input 	[31:0] PC, R2;
input 	ALUSRCA;

assign ALUsrcAout = (ALUSRCA) ? R2:PC; 

endmodule
