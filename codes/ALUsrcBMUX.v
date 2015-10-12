`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:12:37 11/21/2014 
// Design Name: 
// Module Name:    ALUsrcBMUX 
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
module ALUsrcBMUX(ALUsrcBout,R3,extendedIMM,ALUSRCB);
output 	reg[31:0] ALUsrcBout;
input 	[31:0] R3, extendedIMM;
input 	[1:0] ALUSRCB;

always @ (ALUSRCB or R3 or extendedIMM)
begin
case (ALUSRCB)
	'b00:  ALUsrcBout = R3;
	'b01:  ALUsrcBout = 1;
	'b10:  ALUsrcBout = extendedIMM;
	'b11:  ALUsrcBout = 0;
endcase
end

endmodule
