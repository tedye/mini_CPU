`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:51:06 11/21/2014 
// Design Name: 
// Module Name:    WritePortMUX 
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
module WritePortMUX(WritePort, R1, WRITEPORTSELECT);
output	[4:0] WritePort;
input 	[4:0] R1;
input 			WRITEPORTSELECT;

assign WritePort = (WRITEPORTSELECT) ? 'b11111:R1;

endmodule
