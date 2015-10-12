`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:06:23 11/21/2014 
// Design Name: 
// Module Name:    ALUsrc_regs 
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
module ALUsrc_regs(Aout,Bout,Ain,Bin,reset,clk);
output reg [31:0] Aout,Bout;
input  [31:0] Ain, Bin;
input reset,clk;

initial begin Aout = 0;Bout = 0; end
always@(posedge clk)
begin 
if (reset)
	begin 
	Aout <= 0;
	Bout <= 0;
	end
else 
	begin 
	Aout <= Ain;
	Bout <= Bin;
	end
end
endmodule
