`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:14:40 11/21/2014 
// Design Name: 
// Module Name:    WriteDataMUX 
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
module WriteDataMUX(WriteDataOut, ALUout, DMEMOut, JALreturnPC, WRITETDATASELECT);
output 		reg[31:0]	WriteDataOut;
input 		[31:0]	ALUout, DMEMOut, JALreturnPC;
input			[1:0] 	WRITETDATASELECT;

always @ (WRITETDATASELECT or ALUout or DMEMOut or JALreturnPC)
begin
case (WRITETDATASELECT)
	'b00: WriteDataOut = ALUout;
	'b01: WriteDataOut = DMEMOut;
	'b10: WriteDataOut = JALreturnPC;
endcase
end

endmodule
