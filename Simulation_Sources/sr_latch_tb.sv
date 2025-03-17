`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:30:38 PM
// Design Name: 
// Module Name: sr_latch_tb
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


module sr_latch_tb;
    logic S, R;  
    logic Q, Q_bar;  

    sr_latch uut ( .S(S), .R(R), .Q(Q), .Q_bar(Q_bar));

    initial begin
        S = 0; R = 0; #10; // hold
        S = 1; R = 0; #10; // set 
        S = 0; R = 0; #10; // hold
        S = 0; R = 1; #10; // reset
        S = 0; R = 0; #10; // hold
        S = 1; R = 1; #10; // invalid 
        S = 0; R = 0; #10; // hold
        S = 1; R = 0; #10; // set
        S = 0; R = 1; #10; // reset
        $finish;
    end
endmodule


