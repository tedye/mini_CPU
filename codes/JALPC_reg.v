`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:08:41 11/21/2014 
// Design Name: 
// Module Name:    JALPC_reg 
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
module JALPC_reg(JALreturnPC, ALUout_reg_out, reset, clk);
output 	reg[31:0]		JALreturnPC;
input 	[31:0]		ALUout_reg_out;
input 					reset,clk;

initial begin JALreturnPC = 0; end
always@(posedge clk)
begin 
	if (reset) JALreturnPC <= 0;
	else JALreturnPC <= ALUout_reg_out;
end

endmodule
