`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 10:39:56 PM
// Design Name: 
// Module Name: POS_ACC_TB
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


module POS_ACC_TB();

    // Inputs
    logic clk_tb;
    logic ld_tb;
    logic clear_tb;
    logic [1:0] fsm_in_tb;

    // Outputs
    reg [7:0] q_tb;

    POS_ACC UUT (
        .fsm_in(fsm_in_tb),
        .clk(clk_tb),
        .ld(ld_tb),
        .clear(clear_tb),
        .q(q_tb)
        );

    initial begin
        clk_tb = 1;
        ld_tb = 1;
        clear_tb = 0;
        #10; 
        fsm_in_tb = 2'b00;
        #50;
        fsm_in_tb = 2'b01;
        #250;
        fsm_in_tb = 2'b11;
        #250;
    end

    always #5 clk_tb = !clk_tb;

endmodule
