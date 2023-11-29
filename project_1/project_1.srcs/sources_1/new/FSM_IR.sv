`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO
// Engineer: Wyatt Tack
// 
// Create Date: 11/28/2023 10:26:21 AM
// Design Name: IR FSM Decoder
// Module Name: FSM_IR
// Project Name: Remote Control Servo Arm
// Target Devices: 
// Tool Versions: 
// Description: Uses an FSM to decode a 38kHz IR signal from a remote, 
//              to add +/- 1 to a variable controlling the position of a servo motor
// 
// Dependencies: Needs clk to run at 38k Hz
// 
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FSM_IR(
input clk,
input IR,
output logic PWM_0, PWM_1, PWM_2
    );
    
    typedef enum {Start, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, e5, e6, e7, e8, e9, e10, e11, e12, e13, e14, f7, f8, f9, f10, f11, f12, f13} STATES;
    STATES PS, NS;
    
    always_ff@(posedge clk)
    begin
    PS <= NS;
    end
    
    always_comb
    begin
    PWM_0 = 0;
    PWM_1 = 0;
    PWM_2 = 0;
    case (PS)
        Start:
        begin
        PWM_0 = 0;
        PWM_1 = 0;
        PWM_2 = 0;
        if (IR) NS = Start;
        else NS = a1;
        end
       
    
    
    default:
    NS = Start;
    endcase
    end
endmodule
