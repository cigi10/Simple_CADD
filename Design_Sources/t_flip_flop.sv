`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:29:56 PM
// Design Name: 
// Module Name: t_flip_flop
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



module t_flip_flop
(
    input T, clock, reset,
    output reg Q, Qb
);
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            Q <= 0;
            Qb <= 1;
        end else if (T) begin
            Q <= ~Q;
            Qb <= ~Qb;
        end
    end
endmodule


