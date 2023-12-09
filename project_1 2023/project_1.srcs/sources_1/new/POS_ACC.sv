`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO
// Engineer: Ethan Vosburg
// 
// Create Date: 12/05/2023 10:14:50 PM
// Design Name: Position Accumulator
// Module Name: POS_ACC
// Project Name: Robotic Arm with IR input and Servo Output 
// Target Devices: Basys 3 Development Board
// Tool Versions: 
// Description: Accumulates the position of the IR input from the decoder and outputs to the PWM module
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module POS_ACC(
    // Inputs
    input [1:0] fsm_in, // Signed 2bit input
    input clk, ld, clear, // Clock, load, and clear inputs

    // Outputs
    output logic [7:0] q = 8'd55 // Accumulator output
    );
    
    // Accumulator Logic
    always_ff @ (posedge clk)
    begin
        if (clear)
            begin
                // Reset the accumulator
                q <= 8'd55;
            end 
        else if (ld)
            // Increment the accumulator when load is +1
            // $display("q = %d", q); // Debug code
            if ((q >= 8'd55) && (q <= 8'd245))
                begin    
                    if (fsm_in == 2'b01)
                        begin 
                            q <= q + 8'd10;
                        end
                end
            // Decerement the accumulator when load is -1
            if ((q >= 8'd65) && (q <= 8'd255))
                if (fsm_in == 2'b11)
                    q <= q - 8'd10;
    end

endmodule
