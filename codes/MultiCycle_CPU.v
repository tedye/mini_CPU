`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:55:59 11/21/2014 
// Design Name: 
// Module Name:    MultiCycle_CPU 
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
module MultiCycle_CPU(  nPC,PC,ALUout,ALU_MEM,Instruction, InstructionOut,WriteData,DMEMOut,JALreturnPC,
								read_data_1, read_data_2,extendedIMM,Aout,Bout,A,B,MemData,ControlLine,WritePort,ReadPort1,ReadPort2,
								ALUControl,state,WRITEDATASELECT,ALUSRCB,ALUOP,BranchTaken,PCWRITE,IRWRITE,WRITEPORTSELECT,
								REGWRITE,PCSRC,MEMWRITE,ALUSRCA,BRANCH,ReadPortSelect,reset, clk);
								
output [31:0] nPC,PC,ALUout,ALU_MEM,Instruction, InstructionOut,WriteData,DMEMOut,JALreturnPC,
				read_data_1, read_data_2,extendedIMM,Aout,Bout,A,B,MemData;
output [13:0]	ControlLine;
output [4:0] WritePort,ReadPort1,ReadPort2;
output [3:0] ALUControl;
output [1:0] WRITEDATASELECT,ALUSRCB,ALUOP,ReadPortSelect;
output [3:0] state;
output BranchTaken,PCWRITE,IRWRITE,WRITEPORTSELECT,REGWRITE,PCSRC,MEMWRITE,ALUSRCA,BRANCH;
input reset,clk;

wire BranchTaken,PCWRITE,IRWRITE,WRITEPORTSELECT,REGWRITE,PCSRC,MEMWRITE,ALUSRCA,BRANCH;
wire [1:0] WRITEDATASELECT,ALUSRCB,ALUOP,ReadPortSelect;
wire [3:0] ALUControl,state;
wire [4:0] WritePort,ReadPort1,ReadPort2;
wire [13:0] ControlLine;
wire [31:0] nPC,PC,ALUout,ALU_MEM,Instruction, InstructionOut,WriteData,DMEMOut,JALreturnPC,
				read_data_1, read_data_2,extendedIMM,Aout,Bout,A,B,MemData;

// PC increment 
PC_reg 			pc_reg 			(PC, nPC, PCupdate, reset, clk);
PCcontroller 	pc_controller	(PCupdate, PCWRITE, BranchTaken,BRANCH);
PCsrcMUX			pc_src			(nPC,ALUout,ALU_MEM,PCSRC);

// Instruction Fetch
IMem			instruction_mem	(PC, Instruction);
Instruction_reg instr_reg		(InstructionOut,Instruction,IRWRITE,reset,clk);

// Instruction Decode
WritePortMUX	writeportMux	(WritePort,InstructionOut[25:21],WRITEPORTSELECT);
readPortContoller readctrl		(ReadPortSelect,InstructionOut[31:26]);
ReadPort2MUX	readport1Mux	(ReadPort1,InstructionOut[25:21],InstructionOut[20:16],ReadPortSelect[0]);
ReadPort2MUX 	readport2Mux	(ReadPort2,InstructionOut[25:21],InstructionOut[15:11],ReadPortSelect[1]);
WriteDataMUX	writedataMux	(WriteData, ALU_MEM, DMEMOut, JALreturnPC, WRITEDATASELECT);
nbit_register_file reg_file	(WriteData, read_data_1, read_data_2, ReadPort1, ReadPort2, WritePort, REGWRITE, clk);
ImmExt			immextend		(extendedIMM, InstructionOut[25:0], InstructionOut[31:26]);
ALUsrc_regs		ALUsrcregs		(Aout,Bout,read_data_1,read_data_2,reset,clk);

// Execution
ALUsrcAMUX 		ALUsrcAmux		(A, PC, Aout, ALUSRCA);
ALUsrcBMUX		ALUsrcBmux		(B, Bout,extendedIMM,ALUSRCB);
ALUController	ALUctrl			(ALUControl, ALUOP, InstructionOut[31:26]);
ALU				alu				(ALUout,A,B,ALUControl);	
brancher 		BranchLogic		(BranchTaken, ALUout, InstructionOut[27:26], InstructionOut[31:30]);
ALUout_reg		ALUoutreg		(ALU_MEM,ALUout,reset,clk);
JALPC_reg		JALpcreg			(JALreturnPC, ALU_MEM, reset, clk);

// MEM access
DMem				DataMem			(read_data_2,MemData,ALU_MEM,MEMWRITE,clk);
MemData_reg		MemDataReg		(DMEMOut, MemData, reset, clk);

// controller and control signal mapping
Controller 		FSM				(ControlLine, state, InstructionOut[31:26], reset, clk);
ControlLineMapping	Ctrlline	(	PCWRITE,
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

endmodule
