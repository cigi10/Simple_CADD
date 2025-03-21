`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:30:38 PM
// Design Name: 
// Module Name: d_latch_tb
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


module d_latch_tb;
    logic D, en;
    logic Q;

    d_latch uut (D, en, Q);

    initial begin
        D = 0; en = 0;
        #10 D = 1; en = 0;
        #10 D = 0; en = 1;
        #10 D = 1; en = 1;
        #10 en = 0;
    end
endmodule

