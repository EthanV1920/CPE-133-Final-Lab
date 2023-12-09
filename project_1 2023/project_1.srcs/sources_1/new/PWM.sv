`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO
// Engineer: Ethan Vosburg
// 
// Create Date: 12/06/2023 11:32:09 PM
// Design Name: PWM Module
// Module Name: PWM
// Project Name: Robotic Arm with IR input and Servo Output 
// Target Devices: Basys 3 Development Board
// Tool Versions: 
// Description: Recive the position from the accumulator and output a PWM signal
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module PWM(
    // Inputs
    input [7:0] pos_in,
    input clk,
    // Outputs
    output logic pwm_out
    );

    // Registers to store the period and duty cycle
    reg [10:0] period = 0;
    reg [7:0] duty = 0;

    // PWM logic
    always @(posedge clk ) begin
        if (period < 11'd2000)
            begin
                // Set pwm output high for a portion of the period
                if (duty < pos_in)
                    begin 
                        duty <= duty + 1;
                        pwm_out <= 1;
                    end
                else
                    begin
                        // Set pwm output low for the rest of the period
                        pwm_out <= 0;
                    end

                period <= period + 1;
            end
        else
            begin
                // Reset period and duty cycle
                period <= 0;
                duty <= 0;
            end
    end

endmodule
