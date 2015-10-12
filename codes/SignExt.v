`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:44:13 11/21/2014 
// Design Name: 
// Module Name:    SignExt 
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
module SignExt(extendedIMM, IMM);
parameter width = 16;
output 	[31:0]extendedIMM;
input 	[width -1 :0 ] IMM;

begin 
assign extendedIMM = {{(32-width){IMM[width-1]}},IMM[width-1:0]};
end

endmodule
