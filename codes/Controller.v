`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:19:38 11/21/2014 
// Design Name: 
// Module Name:    Controller 
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
module Controller( ControlLine,state, opcode, reset, clk);
parameter S_IDLE	=	4'b0000;
// Parameters to decribe 11 states
parameter S_1  = 		4'b0001;		// instruction fetch 
parameter S_2  = 		4'b0010;		// instruction decode
parameter S_3 	=		4'b0011;	   // memory addr. computation or Immediate calculation
parameter S_4 	= 		4'b0100;		// memory access read
parameter S_5  = 		4'b0101;		// memory read complete write back to reg
parameter S_6	= 		4'b0110;		// memory access write
parameter S_7  = 		4'b0111;		// execution
parameter S_8  = 		4'b1000;		// R-type or I-type instruction calculation complete
parameter S_9	=		4'b1001;		// branch complete
parameter S_10	=		4'b1010;		// jump complete
parameter S_11	=		4'b1011;		// jump and link complete
parameter S_12	=		4'b1100;		// LI/LUI instruction
parameter S_13 = 		4'b1101;		// Jump register


// Parameters to decribe input bit patterns
parameter I_I	=		2'b11;		// I-type opcode
parameter I_R  = 		2'b01;  	 	// R-type opcode
parameter I_B	=		2'b10; 		// BEQ opcode
parameter I_J  = 		2'b00;		// jump opcode


output reg	[13:0] 	ControlLine;
input 		[5:0] 	opcode;
input 					reset,clk;

// internal variables
output reg 		[3:0]		state;
wire		[3:0]		next_state;

// next state function
function [3:0] 	nextState_func;
input 	[3:0] 	s; 					// current state
input		[5:0] 	i;						// input

begin
case(s)
	S_1: nextState_func = S_2;
	
	S_2:
		case(i[5:4])
						I_I: if (i[3:0]=='b1001||i[3:0]=='b1010) begin nextState_func = S_12; end
								else begin nextState_func = S_3; end
						
						I_R: nextState_func = S_7;
						I_B: nextState_func = S_9;
						I_J: if (i[3:0] == 'b000) begin nextState_func = S_IDLE;end
								else if (i[3:0] =='b001) begin nextState_func = S_10; end
								else if (i[3:0] == 'b010) begin nextState_func = S_11; end
								else if (i[3:0] == 'b011) begin nextState_func = S_13; end
		endcase
	
	S_3:
		case(i[3:0])
						'b1011: nextState_func = S_4;
						'b1101: nextState_func = S_4;
						'b1100: nextState_func = S_6;
						'b1110: nextState_func = S_6;
						default: nextState_func = S_8;
		endcase
	S_4: nextState_func = S_5;
	S_5: nextState_func = S_1;
	S_6: nextState_func = S_1;
	S_7: nextState_func = S_8;
	S_8: nextState_func = S_1;
	S_9: nextState_func = S_1;
	S_10: nextState_func = S_1;
	S_11: nextState_func = S_1;
	S_12: nextState_func = S_8;
	S_13: nextState_func = S_1;
	S_IDLE: nextState_func = S_1;
	default: nextState_func = S_IDLE;
endcase
end
endfunction

assign next_state = nextState_func(state,opcode);

// output Combinational logic
always @(state or reset)
begin
	if (reset == 1'b1) begin ControlLine = 0;end
	else begin
		case(state)
				S_1: ControlLine = 'b110_0000_0100_000;
						
				S_2: ControlLine = 'b000_0000_1000_000;
								
				S_3: ControlLine = 'b000_0001_1010_000;				
				
				S_4: ControlLine = 'b000_0000_0000_000;
									
				S_5: ControlLine = 'b000_0110_0000_000;
											
				S_6: ControlLine = 'b000_0000_0000_010;			
					
				S_7: ControlLine = 'b000_0001_0010_000;					

				S_8: ControlLine = 'b000_0010_0000_000;
				
				S_9: ControlLine = 'b000_0001_0001_101;
						
				S_10: ControlLine = 'b100_0000_0000_100;
				
				S_11: ControlLine = 'b101_1010_0000_100;
				
				S_12: ControlLine = 'b000_0001_1010_000;
				
				S_13: ControlLine = 'b100_0001_1100_000;
				
				S_IDLE:  ControlLine = 0;
								
		endcase
	end
end

always @ (posedge clk)
begin
	if (reset == 1'b1) 
	begin state <= S_IDLE; end
	else begin state <= next_state; end
end

endmodule
