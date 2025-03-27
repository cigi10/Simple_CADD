`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 03:53:00 PM
// Design Name: 
// Module Name: fsm_moore_tb
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



module fsm_moore_tb;
    reg clk = 0, resetn = 0, input_signal = 0;
    wire output_signal;

    fsm_moore uut (clk, resetn, input_signal, output_signal);

    always #5 clk = ~clk;

    initial begin

        #10 resetn = 1;

        #10 input_signal = 1;
        #10 input_signal = 0; 
        
        #30 $finish;
    end
endmodule
