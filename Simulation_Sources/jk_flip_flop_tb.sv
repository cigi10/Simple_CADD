`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:30:38 PM
// Design Name: 
// Module Name: jk_flip_flop
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



module jk_flip_flop_tb;
    reg J, K, clock, reset;
    wire Q, Qb;
    
    jk_flip_flop uut 
    (
        .J(J),
        .K(K),
        .clock(clock),
        .reset(reset),
        .Q(Q),
        .Qb(Qb)
    );
    
    initial begin
        clock = 0;
        reset = 1;
        J = 0;
        K = 0;
        #10 reset = 0;
        #10 J = 1; K = 0;
        #10 clock = 1;
        #10 clock = 0;
        #10 J = 0; K = 1;
        #10 clock = 1;
        #10 clock = 0;
        #10 J = 1; K = 1;
        #10 clock = 1;
        #10 clock = 0;
        #10 reset = 1;
        #10 reset = 0;
        #10 J = 0; K = 0;
        #10 clock = 1;
        #10 clock = 0;
        #10 $finish;
    end
    
    always #5 clock = ~clock;
    
endmodule
