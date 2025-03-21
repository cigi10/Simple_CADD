`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:30:38 PM
// Design Name: 
// Module Name: register_tb
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



module register_tb;
    reg clk, reset, load;
    reg [7:0] D;
    wire [7:0] Q;
    
    register #(8) uut (
        .clk(clk),
        .reset(reset),
        .load(load),
        .D(D),
        .Q(Q)
    );
    
    initial begin
        clk = 0;
        reset = 1;
        load = 0;
        D = 8'b00000000;
        #10 reset = 0;
        #10 load = 1; D = 8'b10101010;
        #10 clk = 1;
        #10 clk = 0;
        #10 load = 1; D = 8'b11001100;
        #10 clk = 1;
        #10 clk = 0;
        #10 reset = 1;
        #10 reset = 0;
        #10 $finish;
    end
    
    always #5 clk = ~clk;
    
endmodule
