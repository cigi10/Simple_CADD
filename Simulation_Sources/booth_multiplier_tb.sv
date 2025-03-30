`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 03:53:00 PM
// Design Name: 
// Module Name: booth_multiplier_tb
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



module booth_multiplier_tb;

    reg clk, rst, start;
    reg signed [3:0] X, Y;
    wire signed [7:0] Z;
    wire valid;

    booth_multiplier uut (
        .clk(clk),
        .rst(rst),
        .start(start),
        .X(X),
        .Y(Y),
        .Z(Z),
        .valid(valid)
    );

    always #5 clk = ~clk;

    initial begin
        $monitor($time, " X=%d, Y=%d, valid=%b, Z=%d", X, Y, valid, Z);
        
        // initialize
        clk = 1'b1;
        rst = 1'b0;
        start = 1'b0;
        X = 0;
        Y = 0;
        
        // reset
        #10 rst = 1'b1;
        
        // test case 1: 5 * 7
        #10 X = 5; Y = 7; start = 1'b1;
        #10 start = 1'b0;
        
        // wait for completion
        @(posedge valid);
        #20;
        
        // test case 2: -4 * 6
        X = -4; Y = 6; start = 1'b1;
        #10 start = 1'b0;
        
        // wait for completion
        @(posedge valid);
        #20;
        
        $finish;
    end
endmodule
