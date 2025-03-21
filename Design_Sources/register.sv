`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:29:56 PM
// Design Name: 
// Module Name: register
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



module register #(parameter N = 8) 
(
    input wire clk,
    input wire reset,
    input wire load,
    input wire [N-1:0] D,
    output reg [N-1:0] Q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            Q <= 0;
        else if (load)
            Q <= D;
    end
endmodule


