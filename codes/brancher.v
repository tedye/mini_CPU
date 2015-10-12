`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:27:27 11/21/2014 
// Design Name: 
// Module Name:    brancher 
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
module brancher(BranchTaken, ALUout, BranchType,InstrType);
output		reg BranchTaken;
input [31:0] 	ALUout;
input [1:0]		BranchType,InstrType;

always @ (BranchType or ALUout)
begin 
if (InstrType == 'b10
	&& (BranchType == 'b00 && ALUout == 0     // BEQ
	|| BranchType == 'b01 && ALUout != 0     // BNE
	|| BranchType == 'b10 && $signed(ALUout) > 0      // BLT
	|| BranchType == 'b11 && $signed(ALUout) >= 0))    // BLE
	begin BranchTaken = 1; end
else begin BranchTaken = 0; end
end


endmodule
