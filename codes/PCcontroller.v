`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:24:41 11/21/2014 
// Design Name: 
// Module Name:    PCcontroller 
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
module PCcontroller(PCupdate, PCWRITE, BranchTaken,BRANCH);
output PCupdate;
input PCWRITE, BranchTaken,BRANCH;

assign PCupdate = PCWRITE | (BranchTaken & BRANCH);

endmodule
