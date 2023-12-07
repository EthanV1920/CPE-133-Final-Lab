`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 10:14:10 PM
// Design Name: 
// Module Name: DEC
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


module DEC(
    input [1:0] fsm_in,
    input clk,
    output reg [1:0] q,
    output logic clear
    );

    typedef enum {S0, S1, S2} STATES;

    STATES state, next_state;

    always_ff@(posedge clk) begin
        state <= next_state;
    end

    always_comb
    begin
        next_state = S0;
        case (fsm_in)
            2'b01:
                case(state)
                    S0: next_state <= S1;
                    S1: 
                        begin
                            q <= 2'b01;
                            clear <= 1'b1;
                        end
                    default: next_state <= S0;
                endcase
            2'b11:
                case(state)
                    S0: next_state <= S1;
                    S1: 
                        begin
                            q <= 2'b11;
                            clear <= 1'b1;
                        end
                    default: next_state <= S0;
                endcase
            default:
                begin
                    q <= 2'b00;
                    clear <= 1'b0;
                end     
        endcase
    end

endmodule
