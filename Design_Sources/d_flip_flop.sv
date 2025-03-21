`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:29:56 PM
// Design Name: 
// Module Name: d_flip_flop
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



module d_flip_flop(Q, Qb, D, clock, reset);

output reg Q;
output Qb;
input D, clock, reset;

always @(posedge clock or posedge reset) begin
    if (reset)
        Q <= 1'b0;
    else
        Q <= D;
end

assign Qb = ~Q;

endmodule


