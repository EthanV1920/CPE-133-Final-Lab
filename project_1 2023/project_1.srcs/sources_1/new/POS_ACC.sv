`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 12/05/2023 10:14:50 PM
// Design Name: 
// Module Name: POS_ACC
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


module POS_ACC(
    input [1:0] fsm_in,
    input clk, ld, clear,
    output logic [7:0] q = 8'd55
    );
    
    always_ff @ (posedge clk)
    begin
        if (clear)
            q <= 8'd56;
        else if (ld)
            $display("q = %d", q);
            if ((q >= 8'd55) && (q <= 8'd245))
                if (fsm_in == 2'b01)
                    q <= q + 8'd10;
            
            if ((q >= 8'd65) && (q <= 8'd255))
                if (fsm_in == 2'b11)
                    q <= q - 8'd10;
    end

endmodule
