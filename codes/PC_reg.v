`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:27:59 11/21/2014 
// Design Name: 
// Module Name:    PC_reg 
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
module PC_reg(PC, PCin, PCupdate, reset, clk);
output reg 	[31:0]  	PC;
input  		[31:0]  	PCin;
input 					PCupdate, reset, clk;

initial begin PC = 0;end
always@(posedge clk)
begin
if (reset) begin PC <= 0;end
else if (PCupdate) begin PC <= PCin; end
end

endmodule
