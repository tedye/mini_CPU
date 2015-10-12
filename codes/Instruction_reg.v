`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:34:34 11/21/2014 
// Design Name: 
// Module Name:    Instruction_reg 
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
module Instruction_reg(instruction, instructionIn, IRWRITE, reset, clk);
output reg	[31:0] 	instruction;
input 		[31:0] 	instructionIn;
input 					IRWRITE, reset, clk;

initial begin instruction = 0; end
always@(posedge clk)
begin 
if (reset) begin instruction <= 0;end
else if (IRWRITE) begin instruction <= instructionIn; end
end
endmodule
