`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/07/2023 12:56:36 AM
// Design Name: 
// Module Name: PWM_TB
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


module PWM_TB();

    // Inputs
    logic [7:0] pos_in_tb;
    logic clk_tb;
    
    // Outputs
    logic pwm_out_tb;
    

    PWM UUT (
        .pos_in(pos_in_tb),
        .clk(clk_tb),
        .pwm_out(pwm_out_tb)
    );

    initial begin
        clk_tb = 1;
        pos_in_tb = 8'd55;
        #20000; 
        // pos_in_tb = 8'd155;
        // #20000;
        // pos_in_tb = 8'd200;
        // #20000;
        // pos_in_tb = 8'd255;
        // #20000;
    end



    always #5 clk_tb = !clk_tb;


endmodule
