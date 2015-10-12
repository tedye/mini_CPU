`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   22:16:50 11/21/2014
// Design Name:   MultiCycle_CPU
// Module Name:   C:/Users/teddymax/verilog/milestone3/CPU_test2.v
// Project Name:  milestone3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: MultiCycle_CPU
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module CPU_test2;

	// Inputs
	reg reset;
	reg clk;

	// Outputs
	wire [31:0] nPC;
	wire [31:0] PC;
	wire [31:0] ALUout;
	wire [31:0] ALU_MEM;
	wire [31:0] Instruction;
	wire [31:0] InstructionOut;
	wire [31:0] WriteData;
	wire [31:0] DMEMOut;
	wire [31:0] JALreturnPC;
	wire [31:0] read_data_1;
	wire [31:0] read_data_2;
	wire [31:0] extendedIMM;
	wire [31:0] Aout;
	wire [31:0] Bout;
	wire [31:0] A;
	wire [31:0] B;
	wire [31:0] MemData;
	wire [13:0] ControlLine;
	wire [4:0] WritePort;
	wire [4:0] ReadPort1;
	wire [4:0] ReadPort2;
	wire [3:0] ALUControl,state;
	wire [1:0] WRITEDATASELECT,ReadPortSelect;
	wire [1:0] ALUSRCB;
	wire [1:0] ALUOP;
	wire BranchTaken;
	wire PCWRITE;
	wire IRWRITE;
	wire WRITEPORTSELECT;
	wire REGWRITE;
	wire PCSRC;
	wire MEMWRITE;
	wire ALUSRCA;
	wire BRANCH;

	// Instantiate the Unit Under Test (UUT)
	MultiCycle_CPU uut (
		.nPC(nPC), 
		.PC(PC), 
		.ALUout(ALUout), 
		.ALU_MEM(ALU_MEM), 
		.Instruction(Instruction), 
		.InstructionOut(InstructionOut), 
		.WriteData(WriteData), 
		.DMEMOut(DMEMOut), 
		.JALreturnPC(JALreturnPC), 
		.read_data_1(read_data_1), 
		.read_data_2(read_data_2), 
		.extendedIMM(extendedIMM), 
		.Aout(Aout), 
		.Bout(Bout), 
		.A(A), 
		.B(B), 
		.MemData(MemData), 
		.ControlLine(ControlLine), 
		.WritePort(WritePort), 
		.ReadPort1(ReadPort1), 
		.ReadPort2(ReadPort2), 
		.ALUControl(ALUControl), 
		.state(state),
		.ReadPortSelect(ReadPortSelect),
		.WRITEDATASELECT(WRITEDATASELECT), 
		.ALUSRCB(ALUSRCB), 
		.ALUOP(ALUOP), 
		.BranchTaken(BranchTaken), 
		.PCWRITE(PCWRITE), 
		.IRWRITE(IRWRITE), 
		.WRITEPORTSELECT(WRITEPORTSELECT), 
		.REGWRITE(REGWRITE), 
		.PCSRC(PCSRC), 
		.MEMWRITE(MEMWRITE), 
		.ALUSRCA(ALUSRCA),
		.BRANCH(BRANCH),
		.reset(reset), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		reset = 1;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#10;
      reset = 0;  
		
		// Add stimulus here

	end
always begin #1 clk = ~clk; end
      
endmodule

