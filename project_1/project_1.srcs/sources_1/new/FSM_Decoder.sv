`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO
// Engineer: Wyatt Tack
// 
// Create Date: 12/01/2023 02:14:47 PM
// Design Name: FSM IR NEC decoder
// Module Name: FSM_Decoder
// Project Name: IR controlled robotic arm
// Target Devices: Elegoo IR Remote and reciever module
// Tool Versions: 
// Description: Uses an FSM to decode the output of an NEC protocol IR module to
//              Determine if the output is a 1 or a 0 bit   
//
// Dependencies: Slow Clock 1 (1778 HZ)
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module FSM_Decoder(
input clk,
input IR,
output logic IR_Bit, 
output logic clk_out
    );
    typedef enum {Start, a, b, c, d, e} STATES;
    STATES PS, NS;
    always_ff@(posedge clk)
    begin
    PS <= NS;
    end   
    
    always_comb
    begin
    IR_Bit = 0;
    clk_out = 0;
    case (PS)
        Start:
        begin
        clk_out = 0;
        if (IR) 
        begin
        NS = Start;
        IR_Bit = 0;
        end
        else 
        begin
        NS = a;
        IR_Bit = 0;
        end
        end
        a:
        begin
        clk_out = 1;
        if (IR) 
            begin
            NS = b;
            IR_Bit = 0;
            end
        else 
            begin
            NS = Start;
            IR_Bit = 0;
            end
        end
        b:
        begin
        clk_out = 0;
        if (IR) 
            begin
            NS = c;
            IR_Bit = 0;
            end
        else 
            begin
            NS = a;
            IR_Bit = 0;
            end
        end
        c:
        begin
        clk_out = 0;
        if (IR) 
            begin
            NS = d;
            IR_Bit = 0;
            end
        else 
            begin
            NS = Start;
            IR_Bit = 0;
            end
        end
        d:
        begin
        clk_out = 0;
        if (IR) 
            begin
            NS = Start;
            IR_Bit = 0;
            end
        else 
            begin
            NS = e;
            IR_Bit = 1;
            end
        end
        e:
        begin
        clk_out = 1;
        IR_Bit = 1;
        if (IR) 
            begin
            NS = b;
            //IR_Bit = 0;
            end
        else 
            begin
            NS = Start;
            //IR_Bit = 0;
            end
        end
        
        
    default:
    NS = Start;
    endcase
    end   
endmodule
