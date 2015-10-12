`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:58:39 11/21/2014 
// Design Name: 
// Module Name:    ReadPort2MUX 
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
module ReadPort2MUX(ReadPort2out, R1, R3, READPORTSELECT);
output 		[4:0] ReadPort2out;
input 		[4:0] R1,R3;
input 				READPORTSELECT;

assign ReadPort2out =(READPORTSELECT)? R1: R3;

endmodule
