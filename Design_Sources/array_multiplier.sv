`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: array_multiplier
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



module half_adder(input A, B, output S0, C0);
  assign S0 = A ^ B;
  assign C0 = A & B;
endmodule

module full_adder(input A, B, CIN, output S0, C0);
  assign S0 = A ^ B ^ CIN;
  assign C0 = (A & B) | (B & CIN) | (A & CIN);
endmodule

module array_multiplier(input [3:0] A, B, output [7:0] Z);
  reg signed p[4][4];
  wire [10:0] C; 
  wire [5:0] S; 
  
  genvar i;
  
  generate
    for(i = 0; i < 4; i++) begin
      and a0(p[i][0], A[i], B[0]);
      and a1(p[i][1], A[i], B[1]);
      and a2(p[i][2], A[i], B[2]);
      and a3(p[i][3], A[i], B[3]);
    end
  endgenerate
  assign Z[0] = p[0][0];

  half_adder h0(p[0][1], p[1][0], Z[1], C[0]);
  half_adder h1(p[1][1], p[2][0], S[0], C[1]);
  half_adder h2(p[2][1], p[3][0], S[1], C[2]);
  
  full_adder f0(p[0][2], C[0], S[0], Z[2], C[3]);
  full_adder f1(p[1][2], C[1], S[1], S[2], C[4]);
  full_adder f2(p[2][2], C[2], p[3][1], S[3], C[5]);
  
  full_adder f3(p[0][3], C[3], S[2], Z[3], C[6]);
  full_adder f4(p[1][3], C[4], S[3], S[4], C[7]);
  full_adder f5(p[2][3], C[5], p[3][2], S[5], C[8]);
  
  half_adder h3(C[6], S[4], Z[4], C[9]);
  full_adder f6(C[9], C[7], S[5], Z[5], C[10]);
  full_adder f7(C[10], C[8], p[3][3], Z[6], Z[7]);
endmodule

