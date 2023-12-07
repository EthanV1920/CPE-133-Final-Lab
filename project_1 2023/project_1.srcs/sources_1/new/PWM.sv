`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 11:32:09 PM
// Design Name: 
// Module Name: PWM
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


module PWM(
    input [7:0] pos_in,
    input clk,
    output logic pwm_out
    );

    reg [10:0] period = 0;
    reg [7:0] duty = 0;

    always @(posedge clk ) begin
        if (period < 11'd2000)
            begin
                if (duty < pos_in)
                    begin 
                        duty <= duty + 1;
                        pwm_out <= 1;
                    end
                else
                    pwm_out <= 0;

                period <= period + 1;
            end
        else
            begin
                period <= 0;
                duty <= 0;
            end
    end

endmodule
