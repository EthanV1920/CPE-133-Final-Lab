`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO
// Engineer: Wyatt Tack
// 
// Create Date: 11/28/2023 10:26:21 AM
// Design Name: IR FSM Decoder
// Module Name: FSM_IR
// Project Name: Remote Control Servo Arm
// Target Devices: Elegoo IR remote and reciver module
// Tool Versions: 
// Description: Uses an FSM to decode a 38kHz IR signal from a remote, 
//              to add +/- 1 to a variable controlling the position of a servo motor
// 
// Dependencies: FSM IR Bit Decoder
// 
// Revision: 1.0
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FSM_IR(
    // Inputs
    input clk, // Clock input
    input IR, // IR input

    // Outputs
    output logic [1:0] PWM_0, PWM_1, PWM_2 // PWM outputs
    );
    
    // Define states
    typedef enum {Start, a1, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16, 
    b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, 
    c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15, c16, 
    d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, 
    e5, e6, e7, e8, e9, e10, e11, e12, e13, e14, 
    f7, f8, f9, f10, f11, f12, f13} STATES;
    
    // Define current and next state
    STATES PS, NS;
    

    // Clock logic
    always_ff@(posedge clk)
    begin
    PS <= NS;
    end
    
    // FSM logic
    always_comb
    begin
    PWM_0 = 0;
    PWM_1 = 0;
    PWM_2 = 0;
    case (PS)
        Start://11111...
        begin
        PWM_0 = 0;
        PWM_1 = 0;
        PWM_2 = 0;
        if (IR) NS = Start;
        else NS = a1;
        end
        a1://0
        begin
        if (IR) NS = a2;
        else NS = b2;
        end
        a2://01
        begin
        if (IR) NS = a3;
        else NS = b3;
        end
        a3://011
        begin
        if (!IR) NS = a4;
        else NS = Start;
        end
        a4://0110
        begin
        if (!IR) NS = a5;
        else NS = Start;
        end 
        a5://01100
        begin
        if (!IR) NS = a6;
        else NS = Start;
        end
        a6://011000
        begin
        if (IR) NS = a7;
        else NS = Start;
        end
        a7://0110001
        begin
        if (!IR) NS = a8;
        else NS = Start;
        end
        a8://01100010
        begin
        if (IR) NS = a9;
        else NS = Start;
        end
        a9://011000101
        begin
        if (!IR) NS = a10;
        else NS = Start;
        end
        a10://0110001010
        begin
        if (!IR) NS = a11;
        else NS = Start;
        end
        a11://01100010100
        begin
        if (IR) NS = a12;
        else NS = Start;
        end
        a12://011000101001
        begin
        if (IR) NS = a13;
        else NS = Start;
        end
        a13://0110001010011
        begin
        if (IR) NS = a14;
        else NS = Start;
        end
        a14://01100010100111
        begin
        if (!IR) NS = a15;
        else NS = Start;
        end
        a15://011000101001110
        begin
        if (IR) NS = a16;
        else NS = Start;
        end
        a16://0110001010011101
        begin
        PWM_1 = 2'b01;
        NS = Start;
        end
        b2://00
        begin
        if (IR) NS = c3;
        else NS = d3;
        end
        b3://010
        begin
        if (IR) NS = b4;
        else NS = Start;
        end
        b4://0101
        begin
        if (!IR) NS = b5;
        else NS = Start;
        end
        b5://01010
        begin
        if (!IR) NS = b6;
        else NS = Start;
        end
        b6://010100
        begin
        if (!IR) NS = b7;
        else NS = Start;
        end
        b7://0101000
        begin
        if (!IR) NS = b8;
        else NS = Start;
        end
        b8://01010000
        begin
        if (IR) NS = b9;
        else NS = Start;
        end
        b9://010100001
        begin
        if (!IR) NS = b10;
        else NS = Start;
        end
        b10://0101000010
        begin
        if (IR) NS = b11;
        else NS = Start;
        end
        b11://01010000101
        begin
        if (!IR) NS = b12;
        else NS = Start;
        end
        b12://010100001010
        begin
        if (IR) NS = b13;
        else NS = Start;
        end
        b13://0101000010101
        begin
        if (IR) NS = b14;
        else NS = Start;
        end
        b14://01010000101011
        begin
        if (IR) NS = b15;
        else NS = Start;
        end
        b15://010100001010111
        begin
        PWM_1 = 2'b11;
        NS = Start;
        end
        c3://001
        begin
        if (!IR) NS = c4;
        else NS = Start;
        end
        c4://0010
        begin
        if (!IR) NS = c5;
        else NS = Start;
        end
        c5://00100
        begin
        if (!IR) NS = c6;
        else NS = Start;
        end
        c6://001000
        begin
        if (IR) NS = c7;
        else NS = d7;
        end
        c7://0010001
        begin
        if (!IR) NS = c8;
        else NS = Start;
        end
        c8://00100010
        begin
        if (IR) NS = c9;
        else NS = Start;
        end
        c9://001000101
        begin
        if (IR) NS = c10;
        else NS = Start;
        end
        c10://0010001011
        begin
        if (!IR) NS = c11;
        else NS = Start;
        end
        c11://00100010110
        begin
        if (IR) NS = c12;
        else NS = Start;
        end
        c12://001000101101
        begin
        if (IR) NS = c13;
        else NS = Start;
        end
        c13://0010001011011
        begin
        if (IR) NS = c14;
        else NS = Start;
        end
        c14://00100010110111
        begin
        if (!IR) NS = c15;
        else NS = Start;
        end
        c15://001000101101110
        begin
        if (IR) NS = c16;
        else NS = Start;
        end
        c16://0010001011011101
        begin
        PWM_0 = 2'b11;
        NS = Start;
        end
        d3://000
        begin
        if (!IR) NS = d4;
        else NS = Start;
        end
        d4://0000
        begin
        if (IR) NS = d5;
        else NS = e5;
        end
        d5://00001
        begin
        if (!IR) NS = d6;
        else NS = Start;
        end
        d6://000010
        begin
        if (!IR) NS = e7;
        else NS = Start;
        end
        d7://0010000
        begin
        if (!IR) NS = d8;
        else NS = Start;
        end
        d8://00100000
        begin
        if (IR) NS = d9;
        else NS = Start;
        end
        d9://001000001
        begin
        if (IR) NS = d10;
        else NS = Start;
        end
        d10://0010000011
        begin
        if (!IR) NS = d11;
        else NS = Start;
        end
        d11://00100000110
        begin
        if (IR) NS = d12;
        else NS = Start;
        end
        d12://001000001101
        begin
        if (IR) NS = d13;
        else NS = Start;
        end
        d13://0010000011011
        begin
        if (IR) NS = d14;
        else NS = Start;
        end
        d14://00100000110111
        begin
        if (IR) NS = d15;
        else NS = Start;
        end
        d15://001000001101111
        begin
        PWM_2 = 2'b01;
        NS = Start;
        end
        e5://00000
        begin
        if (!IR) NS = e6;
        else NS = Start;
        end
        e6://000000
        begin
        if (!IR) NS = f7;
        else NS = Start;
        end
        e7://0000100
        begin
        if (!IR) NS = e8;
        else NS = Start;
        end
        e8://00001000
        begin
        if (IR) NS = e9;
        else NS = Start;
        end
        e9://000010001
        begin
        if (IR) NS = e10;
        else NS = Start;
        end
        e10://0000100011
        begin
        if (IR) NS = e11;
        else NS = Start;
        end
        e11://00001000111
        begin
        if (IR) NS = e12;
        else NS = Start;
        end
        e12://000010001111
        begin
        if (!IR) NS = e13;
        else NS = Start;
        end
        e13://0000100011110
        begin
        if (IR) NS = e14;
        else NS = Start;
        end
        e14://00001000111101
        begin
        PWM_0 = 2'b01;
        NS = Start;
        end
        f7://0000000
        begin
        if (!IR) NS = f8;
        else NS = Start;
        end
        f8://00000000
        begin
        if (IR) NS = f9;
        else NS = Start;
        end
        f9://000000001
        begin
        if (IR) NS = f10;
        else NS = Start;
        end
        f10://0000000011
        begin
        if (IR) NS = f11;
        else NS = Start;
        end
        f11://00000000111
        begin
        if (IR) NS = f12;
        else NS = Start;
        end
        f12://000000001111
        begin
        if (IR) NS = f13;
        else NS = Start;
        end
        f13://0000000011111
        begin
        PWM_2 = 2'b11;
        NS = Start;
        end
    default:
    NS = Start;
    endcase
    end
endmodule
