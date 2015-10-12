`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:48:36 11/21/2014 
// Design Name: 
// Module Name:    ControlLineMapping 
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
module ControlLineMapping(
		PCWRITE,
		IRWRITE,
		WRITEPORTSELECT,
		WRITEDATASELECT,
		REGWRITE,
		ALUSRCA,
		ALUSRCB,
		ALUOP,
		PCSRC,
		MEMWRITE,
		BRANCH,
		ControlLine);

output reg	PCWRITE,
				IRWRITE,
				WRITEPORTSELECT,
				REGWRITE,
				ALUSRCA,
				PCSRC,
				MEMWRITE,
				BRANCH;
output reg [1:0]
			WRITEDATASELECT,
			ALUSRCB,
			ALUOP;
			
input [13:0] ControlLine;
			
always@(ControlLine)
begin 
PCWRITE = ControlLine[13];
IRWRITE = ControlLine[12];
WRITEPORTSELECT = ControlLine[11];
WRITEDATASELECT = ControlLine[10:9];
REGWRITE = ControlLine[8];
ALUSRCA = ControlLine[7];
ALUSRCB = ControlLine[6:5];
ALUOP = ControlLine[4:3];
PCSRC = ControlLine[2];
MEMWRITE = ControlLine[1];
BRANCH = ControlLine[0];
end
endmodule
