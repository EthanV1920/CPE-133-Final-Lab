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
    output logic [1:0] q,
    output logic clear
    );

    always_ff@(posedge clk) begin
        // state <= next_state;
        case (fsm_in)
            2'b01:
                begin
                    q <= 2'b01;
                    clear <= 1'b1;
                end
            2'b11:
                begin
                    q <= 2'b11;
                    clear <= 1'b1;
                end
            default:
                begin
                    q <= 2'b00;
                    clear <= 1'b0;
                end
        endcase
    end
endmodule
    // typedef enum {S0, S1, S2} STATES;

    // STATES state, next_state;


    // always_comb
    // begin
    //     case(state)
    //         S0:
    //             next_state = S1;
    //         S1:
    //             next_state = S2;
    //         S2:
    //         default:
    //             next_state = S0;
    //     endcase
    // end
// endmodule
