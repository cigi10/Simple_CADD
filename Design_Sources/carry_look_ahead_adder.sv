`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: cla
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


module cla #(parameter SIZE = 8) 
(
  input  [SIZE-1:0] A, B,
  input  Cin,
  output [SIZE-1:0] S,
  output Cout
);

  wire [SIZE:0] C;
  wire [SIZE-1:0] G, P;

  assign C[0] = Cin;

  genvar i;
  generate
    for (i = 0; i < SIZE; i = i + 1) begin
      assign G[i] = A[i] & B[i];
      assign P[i] = A[i] ^ B[i];
    end
  endgenerate

  generate
    for (i = 1; i <= SIZE; i = i + 1) begin
      assign C[i] = G[i-1] | (P[i-1] & C[i-1]);
    end
  endgenerate

  assign S = P ^ C[SIZE-1:0];
  assign Cout = C[SIZE];

endmodule


