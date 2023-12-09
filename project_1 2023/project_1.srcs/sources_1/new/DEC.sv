`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO
// Engineer: Ethan Vosburg
// 
// Create Date: 12/05/2023 10:14:10 PM
// Design Name: Decoder
// Module Name: DEC
// Project Name: Robotic Arm with IR input and Servo Output 
// Target Devices: Basys 3 Development Board
// Tool Versions: 
// Description: Recognizes the input from the IR FSM and passes on cycle to accumulator
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module DEC(
    // Inputs
    input [1:0] fsm_in, // 2-bit signed input logic
    input clk, // Clock input

    // Outputs
    output logic [1:0] q, // 2-bit signed output logic
    output logic clear  // Clear output logic
    );
    
    // Defined states for delay
    typedef enum {S0, S1, S2, S3} STATES;

    // Defines the current and next state
    STATES state, next_state = S0;

    // Clock logic
    always_ff@(negedge clk) begin
        state <= next_state;
        q = 2'b00;
        clear = 1'b0;

        // State logic
        case (state)
            S2: begin
                // Set output and clear when in state 2
                if (fsm_in == 2'b01) begin
                    q = 2'b01;
                    clear = 1'b1;
                end else if (fsm_in == 2'b11) begin
                    q = 2'b11;
                    clear = 1'b1;
                end
            end
            S3: begin
                // Set output and clear when in state 3
                q = 2'b00;
                clear = 1'b0;
            end
        endcase

    end

    // Delay using state logic
    always_comb begin
        next_state = state; // Default to stay in current state
        case (fsm_in)
            2'b01:
                case (state)
                    S0: next_state = S1;
                    S1: next_state = S2;
                    S2: next_state = S3;
                    S3: next_state = S0;
                endcase
            2'b11:
                case (state)
                    S0: next_state = S1;
                    S1: next_state = S2;
                    S2: next_state = S3;
                    S3: next_state = S0;
                endcase
            default: next_state = S0;     
        endcase
    end
endmodule
