`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:30:38 PM
// Design Name: 
// Module Name: counter_tb
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



module counter_tb;
    logic clk;
    logic rst;
    logic [3:0] count;
    
    counter uut (
        .clk(clk),
        .rst(rst),
        .count(count)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        rst = 1;
        #10 rst = 0;
        #100 $stop;
    end
endmodule

