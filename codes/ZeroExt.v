`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:48:26 11/21/2014 
// Design Name: 
// Module Name:    ZeroExt 
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
module ZeroExt(extendedIMM, IMM);
parameter width = 16;
output 	[31:0]	extendedIMM;
input 	[width -1: 0] IMM;

begin 
assign extendedIMM = $unsigned(IMM); 
end

endmodule
