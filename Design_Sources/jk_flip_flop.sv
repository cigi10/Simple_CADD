`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:29:56 PM
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



module jk_flip_flop 
(
    input logic J,
    input logic K,
    input logic clock,
    input logic reset,
    output logic Q,
    output logic Qb
);
    always_ff @(posedge clock or posedge reset) begin
        if (reset)
            Q <= 1'b0;
        else begin
            case ({J, K})
                2'b00: Q <= Q;   
                2'b01: Q <= 1'b0; 
                2'b10: Q <= 1'b1; 
                2'b11: Q <= ~Q;   
            endcase
        end
    end
assign Qb = ~Q; 
endmodule


