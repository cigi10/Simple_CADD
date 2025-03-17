`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:29:56 PM
// Design Name: 
// Module Name: sr_latch
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



module sr_latch 
(
    input logic S,
    input logic R,
    output logic Q,
    output logic Q_bar
);
    always_comb begin
        if (S && !R) begin
            Q = 1;
            Q_bar = 0;
        end else if (!S && R) begin
            Q = 0;
            Q_bar = 1;
        end else if (!S && !R) begin
            Q = Q;       
            Q_bar = Q_bar;
        end else begin
            Q = 1'bx;    
            Q_bar = 1'bx;
        end
    end
endmodule


