`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:30:38 PM
// Design Name: 
// Module Name: d_flip_flop_tb
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


module d_flip_flop_tb;
    reg D, clock, reset;
    wire Q, Qb;
    
    d_flip_flop uut 
    (
        .Q(Q),
        .Qb(Qb),
        .D(D),
        .clock(clock),
        .reset(reset)
    );
    
    initial begin
        clock = 0;
        reset = 1;
        D = 0;
        #10 reset = 0;
        #10 D = 1;
        #10 clock = 1;
        #10 clock = 0;
        #10 D = 0;
        #10 clock = 1;
        #10 clock = 0;
        #10 reset = 1;
        #10 reset = 0;
        #10 D = 1;
        #10 clock = 1;
        #10 clock = 0;
        #10 $finish;
    end
    
    always #5 clock = ~clock;
    
endmodule

