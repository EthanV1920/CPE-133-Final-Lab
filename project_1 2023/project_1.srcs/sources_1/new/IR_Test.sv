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
output PWM_0, PWM_1, PWM_2,
output PWR, GND,
output debug_0, debug_1, debug_2, debug_3, debug_4, debug_5

//output IR_In, IR_Dec, IR_clk, PWM_Out
    );
logic SCLK_0, IR_BIT, FSM_CLK_IN, FSM_CLK_OUT; 
logic DEC_CLR_0, DEC_CLR_1, DEC_CLR_2;
logic [1:0] FSM_DEC_0, FSM_DEC_1, FSM_DEC_2;
logic [1:0] ACC_0, ACC_1, ACC_2;
logic [7:0] ACC_0_PWM_0, ACC_1_PWM_1, ACC_2_PWM_2;
logic debug_led_0, debug_led_1, debug_led_2;
//logic [7:0] T_2, T_4, T_6;
//logic [1:0] T_3, T_5, T_7;

assign PWR = 1;
assign GND = 0;

assign FSM_CLK_IN = FSM_CLK_OUT | DEC_CLR_0 | DEC_CLR_1 | DEC_CLR_2;

clk_div2_0 SCLK_D_0 (
    .clk(clk),
    .sclk(SCLK_0)
    );

clk_div2_1 SCLK_D_1 (
    .clk(clk),
    .sclk(SCLK_1)
    );

FSM_Decoder FSM1 (
    .clk(SCLK_0),
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

assign debug_0 = FSM_CLK_OUT;
assign debug_1 = FSM_CLK_IN;
assign debug_2 = DEC_CLR_2;
assign debug_3 = FSM_DEC_2[0];
assign debug_4 = DEC_CLR_2;
assign debug_5 = FSM_DEC_2[0];

// DEC DEC_0 (
//     .fsm_in(PWM_0),
//     .clk(SCLK_0),
//     .q(ACC_0),
//     .clear(DEC_CLR_0)
//     );

// DEC DEC_1 (
//     .fsm_in(PWM_1),
//     .clk(SCLK_0),
//     .q(ACC_1),
//     .clear(DEC_CLR_1)
//     );

// DEC DEC_2 (
//     .fsm_in(PWM_2),
//     .clk(SCLK_0),
//     .q(ACC_2),
//     .clear(DEC_CLR_2)
//     );

DEC DEC_0 (
    .fsm_in(FSM_DEC_0),
    .clk(SCLK_0),
    .q(ACC_0),
    .clear(DEC_CLR_0)
    );

// assign debug_0 = ACC_0[0];
// assign debug_1 = ACC_0[1];

DEC DEC_1 (
    .fsm_in(FSM_DEC_1),
    .clk(SCLK_0),
    .q(ACC_1),
    .clear(DEC_CLR_1)
    );

// assign debug_2 = ACC_1[0];
// assign debug_3 = ACC_1[1];

DEC DEC_2 (
    .fsm_in(FSM_DEC_2),
    .clk(SCLK_0),
    .q(ACC_2),
    .clear(DEC_CLR_2)
    );

// assign debug_4 = ACC_2[0];
// assign debug_5 = ACC_2[1];

POS_ACC POS_ACC_0 (
    .fsm_in(ACC_0),
    .clk(SCLK_0),
    .clear(1'b0),
    .ld(1'b1),
    .q(ACC_0_PWM_0)
    );

POS_ACC POS_ACC_1 (
    .fsm_in(ACC_1),
    .clk(SCLK_0),
    .clear(1'b0),
    .ld(1'b1),
    .q(ACC_1_PWM_1)
    );

POS_ACC POS_ACC_2 (
    .fsm_in(ACC_2),
    .clk(SCLK_0),
    .clear(1'b0),
    .ld(1'b1),
    .q(ACC_2_PWM_2)
    );

PWM PWM_D_0 (
    .clk(SCLK_1),
    .pos_in(ACC_0_PWM_0),
    .pwm_out(PWM_0)
    );

PWM PWM_D_1 (
    .clk(SCLK_1),
    .pos_in(ACC_1_PWM_1),
    .pwm_out(PWM_1)
    );

PWM PWM_D_2 (
    .clk(SCLK_1),
    .pos_in(ACC_2_PWM_2),
    .pwm_out(PWM_2)
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
