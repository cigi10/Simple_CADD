`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:30:38 PM
// Design Name: 
// Module Name: t_flip_flop_tb
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



module t_flip_flop_tb;
    reg T, clock, reset;
    wire Q, Qb;
    
    t_flip_flop uut 
    (
        .T(T),
        .clock(clock),
        .reset(reset),
        .Q(Q),
        .Qb(Qb)
    );
    
    initial begin
        clock = 0;
        reset = 1;
        T = 0;
        #10 reset = 0;
        #10 T = 1;
        #10 clock = 1;
        #10 clock = 0;
        #10 T = 0;
        #10 clock = 1;
        #10 clock = 0;
        #10 T = 1;
        #10 clock = 1;
        #10 clock = 0;
        #10 reset = 1;
        #10 reset = 0;
        #10 T = 0;
        #10 clock = 1;
        #10 clock = 0;
        #10 $finish;
    end
    
    always #5 clock = ~clock;
    
endmodule
