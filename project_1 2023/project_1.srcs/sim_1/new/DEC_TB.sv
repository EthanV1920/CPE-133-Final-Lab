`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/06/2023 01:10:56 PM
// Design Name: 
// Module Name: DEC_TB
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


module DEC_TB();
    // Inputs
    logic clk_tb;
    logic [1:0] fsm_in_tb;

    // Outputs
    reg [1:0] q_tb;
    logic clear_tb;

    DEC UUT (
        .fsm_in(fsm_in_tb),
        .clk(clk_tb),
        .q(q_tb),
        .clear(clear_tb)
        );

    initial begin
        clk_tb = 1;
        #10; 
        fsm_in_tb = 2'b00;
        #50;
        fsm_in_tb = 2'b01;
        #50;
        fsm_in_tb = 2'b11;
        #50;
    end

    // initial begin
    // end

    always #5 clk_tb = !clk_tb;
endmodule
