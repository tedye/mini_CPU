`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:48:31 11/21/2014 
// Design Name: 
// Module Name:    ALUout_reg 
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
module ALUout_reg(ALUout,R1,reset,clk);
output 	reg[31:0]		ALUout;
input 	[31:0]		R1;
input 					reset,clk;

initial begin ALUout = 0; end
always@(posedge clk)
begin
if (reset) begin ALUout <= 0; end
else begin ALUout <= R1; end
end

endmodule
