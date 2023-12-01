`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2023 01:59:28 PM
// Design Name: 
// Module Name: FSM_TB
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


module FSM_TB();
logic clk;
logic IR;
logic [7:0] PWM_0, PWM_1, PWM_2;
logic PWR, GND;

IR_Test UUT (.clk(clk), .IR(IR), .PWM_0(PWM_0), .PWM_1(PWM_1), .PWM_2(PWM_2), .PWR(PWR), .GND(GND));

always begin//100 MHz, 10ns Period
clk = 1;
#5;
clk = 0;
#5;
end

always begin
#26316; //38Khz Frequency, 26315.78947 ns period





end
endmodule
