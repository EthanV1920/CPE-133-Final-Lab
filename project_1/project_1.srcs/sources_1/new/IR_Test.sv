`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 02:09:10 PM
// Design Name: 
// Module Name: IR_Test
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module IR_Test(
input clk,
input IR,
output logic [1:0] PWM_0, PWM_1, PWM_2,
output PWR, GND
//output IR_In, IR_Dec, IR_clk, PWM_Out
    );
logic SCLK_1, IR_BIT, FSM_CLK_OUT, FSM_CLK_IN; 
logic [1:0] FSM_DEC_0, FSM_DEC_1, FSM_DEC_2;
//logic [7:0] T_2, T_4, T_6;
//logic [1:0] T_3, T_5, T_7;

assign PWR = 1;
assign GND = 0;

assign FSM_CLK_IN = 1 & FSM_CLK_OUT;

clk_div2_0 SlowClock (
    .clk(clk),
    .sclk(SCLK_1)
    );

FSM_Decoder FSM1 (
    .clk(SCLK_1),
    .IR(IR),
    .IR_Bit(IR_BIT),
    .clk_out(FSM_CLK_OUT)
    );

FSM_IR FSM2 (
    .clk(FSM_CLK_IN),
    .IR(IR_BIT),
    .PWM_0(FSM_DEC_0),
    .PWM_1(FSM_DEC_1),
    .PWM_2(FSM_DEC_2)
    );

DEC DEC_0 (
    .fsm_in(FSM_DEC_0),
    .clk(SCLK_1),
    .q(PWM_0),
    .clear(FSM_CLK_IN)
    );

DEC DEC_1 (
    .fsm_in(FSM_DEC_1),
    .clk(SCLK_1),
    .q(PWM_1),
    .clear(FSM_CLK_IN)
    );

DEC DEC_2 (
    .fsm_in(FSM_DEC_2),
    .clk(SCLK_1),
    .q(PWM_2),
    .clear(FSM_CLK_IN)
    );

//assign IR_In = IR;
//assign IR_Dec = IR_BIT;
//assign IR_clk = FSM_CLK_OUT;
//assign PWM_Out = PWM_1[0];

//FSM_IR FSM2 (.clk(FSM_CLK_OUT), .IR(IR_BIT), .PWM_0(T_2), .PWM_1(T_4), .PWM_2(T_6));
//ShiftRegister SR_1 (.clk(T_2[0]), .CLR(1'b0), .D(T_3), .SEL(2'b01), .Q(PWM_0));    
//assign  T_3 = ~PWM_0; 
//ShiftRegister SR_2 (.clk(T_4[0]), .CLR(1'b0), .D(T_5), .SEL(2'b01), .Q(PWM_1));    
//assign  T_5 = ~PWM_1;
//ShiftRegister SR_3 (.clk(T_6[0]), .CLR(1'b0), .D(T_7), .SEL(2'b01), .Q(PWM_2));    
//assign  T_7 = ~PWM_2;
 
    
endmodule
