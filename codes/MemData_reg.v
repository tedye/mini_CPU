`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    17:22:41 11/21/2014 
// Design Name: 
// Module Name:    MemData_reg 
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
module MemData_reg(MemOut, MemIn, reset, clk);
output 	reg[31:0]	MemOut;
input 	[31:0]	MemIn;
input 				reset,clk;

always @ (posedge clk)
begin 
if (reset) MemOut <= 0;
else MemOut <= MemIn;
end

endmodule
