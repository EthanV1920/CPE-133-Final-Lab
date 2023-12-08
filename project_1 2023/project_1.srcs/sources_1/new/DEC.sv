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
    
    typedef enum {S0, S1, S2, S3} STATES;

    STATES state, next_state = S0;

    always_ff@(posedge clk) begin
        state <= next_state;

        q = 2'b00;
        clear = 1'b0;

        case (state)
            S2: begin
                if (fsm_in == 2'b01) begin
                    q = 2'b01;
                    clear = 1'b1;
                end else if (fsm_in == 2'b11) begin
                    q = 2'b11;
                    clear = 1'b1;
                end
            end
            S3: begin
                q = 2'b00;
                clear = 1'b0;
            end
        endcase

    end

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

    // always_comb
    // begin
    //     case (fsm_in)
    //         2'b01:
    //             case(state)
    //                 S0: next_state = S1;
    //                 S1: next_state = S2;
    //                 S2: 
    //                     begin
    //                         q = 2'b01;
    //                         clear = 1'b1;
    //                         next_state = S3;
    //                     end
    //                 S3:
    //                     begin
    //                         q = 2'b00;
    //                         clear = 1'b0;
    //                         next_state = S0;
    //                     end
    //                 default: next_state = S0;
    //             endcase
    //         2'b11:
    //             case(state)
    //                 S0: next_state = S1;
    //                 S1: next_state = S2;
    //                 S2: 
    //                     begin
    //                         q = 2'b11;
    //                         clear = 1'b1;
    //                         next_state = S3;
    //                     end
    //                 S3:
    //                     begin
    //                         q = 2'b00;
    //                         clear = 1'b0;
    //                         next_state = S0;
    //                     end
    //                 default: next_state = S0;
    //             endcase
    //         default:
    //             begin
    //                 q = fsm_in;
    //                 clear = 1'b0;
    //                 next_state = S0;
    //             end     
    //     endcase
    // end

endmodule
