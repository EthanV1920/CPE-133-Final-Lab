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
    );
logic T_1; 
logic [7:0] T_2, T_4, T_6;
logic [1:0] T_3, T_5, T_7;

assign PWR = 1;
assign GND = 0;

clk_div2 SlowClock (.clk(clk), .sclk(T_1));
FSM_IR FSM (.clk(T_1), .IR(IR), .PWM_0(T_2), .PWM_1(T_4), .PWM_2(T_6));
ShiftRegister SR_1 (.clk(T_2[0]), .CLR(1'b0), .D(T_3), .SEL(2'b01), .Q(PWM_0));    
assign  T_3 = ~PWM_0; 
ShiftRegister SR_2 (.clk(T_4[0]), .CLR(1'b0), .D(T_5), .SEL(2'b01), .Q(PWM_1));    
assign  T_5 = ~PWM_1;
ShiftRegister SR_3 (.clk(T_6[0]), .CLR(1'b0), .D(T_7), .SEL(2'b01), .Q(PWM_2));    
assign  T_7 = ~PWM_2;
 
    
endmodule
