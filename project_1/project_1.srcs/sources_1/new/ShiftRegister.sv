`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Bridget Benson 
// Create Date: 10/26/2018 01:04:29 PM
// Description: 8 bit shift register 
// SEL: 0 - HOLD
//      1 - LOAD
//      2 - LEFT SHIFT
//      3 - RIGHT SHIFT
//////////////////////////////////////////////////////////////////////////////////


module ShiftRegister(

    input clk, CLR ,
    input [1:0] D,
    input [1:0] SEL,
    output logic [1:0] Q

    );
    
    always_ff @ (posedge clk)
    begin
    
        if (CLR)
            Q <= 0;
        else  
            case (SEL)
                1: Q <= D;
                2: Q <= {Q[0:0] , 1'b0};
                3: Q <= {1'b0, Q[1:1]};
                //option zero means hold               
             endcase
             
     end
             
       
    
endmodule
