`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:02:06 AM
// Design Name: 
// Module Name: divider_tb
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



module _tb;
    parameter WIDTH = 4;
    
    reg clk;
    reg reset;
    reg start;
    reg [WIDTH-1:0] dividend;
    reg [WIDTH-1:0] divisor;
    wire [WIDTH-1:0] quotient;
    wire [WIDTH-1:0] remainder;
    wire done;
    
    divider #(WIDTH) uut 
    (
        .clk(clk),
        .reset(reset),
        .start(start),
        .dividend(dividend),
        .divisor(divisor),
        .quotient(quotient),
        .remainder(remainder),
        .done(done)
    );
    
    always #5 clk = ~clk;
    
    initial begin
        clk = 0;
        reset = 1;
        start = 0;
        dividend = 0;
        divisor = 0;
        #10 reset = 0;
        #10;
        
        dividend = 6; divisor = 2; start = 1; #10 start = 0; wait(done); #20;
        dividend = 9; divisor = 4; start = 1; #10 start = 0; wait(done); #20;
        dividend = 15; divisor = 3; start = 1; #10 start = 0; wait(done); #20;
        dividend = 7; divisor = 3; start = 1; #10 start = 0; wait(done); #20;
        dividend = 8; divisor = 8; start = 1; #10 start = 0; wait(done); #20;
        dividend = 4; divisor = 5; start = 1; #10 start = 0; wait(done); #20;
        dividend = 0; divisor = 3; start = 1; #10 start = 0; wait(done);
        
        $finish;
    end
endmodule




