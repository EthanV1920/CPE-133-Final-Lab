`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: Cal Poly SLO   
// Engineer: Wyatt Tack
// 
// Create Date: 11/29/2023 01:59:28 PM
// Design Name: Robot Arm Test Bench
// Module Name: FSM_TB
// Project Name: Robotic Arm
// Target Devices: Basys 3 Development Board
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
logic PWM_0, PWM_1, PWM_2;

Robot_Arm UUT (.clk(clk), .IR(IR), .PWM_0(PWM_0), .PWM_1(PWM_1), .PWM_2(PWM_2));

always begin//100 MHz, 10ns Period
clk = 1;
#5;
clk = 0;
#5;
end

always begin
IR = 1;
#6287500;

IR = 0;
#6187500;

IR = 1;
#3937500;

IR = 0;
#600000; 

IR = 1; //0
#536000; 
IR = 0;
#600000; 

IR = 1; //0
#536000; 
IR = 0;
#600000; 

IR = 1; //0
#536000; 
IR = 0;
#600000; 

IR = 1; //0
#536000; 
IR = 0;
#600000; 

IR = 1; //0
#536000; 
IR = 0;
#600000; 

IR = 1; //0
#536000; 
IR = 0;
#600000; 

IR = 1; //0
#536000; 
IR = 0;
#600000; 

IR = 1; //0
#536000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

//initializer ^^^
IR = 1; //0
#536000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //0
#536000; 
IR = 0;
#600000;

IR = 1; //0
#536000; 
IR = 0;
#600000;

IR = 1; //0
#536000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //0
#536000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //0
#536000; 
IR = 0;
#600000;

IR = 1; //0
#536000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

IR = 1; //0
#536000; 
IR = 0;
#600000;

IR = 1; //1
#1644000; 
IR = 0;
#600000;

//end code^^^
IR=1;
#6187500;
end
endmodule
