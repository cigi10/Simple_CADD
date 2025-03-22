`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: rca
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


module full_adder
(
  input A, B, C_in,  
  output C_out,      
  output Sum        
);

assign {C_out, Sum} = A + B + C_in; 

endmodule

module rca #(parameter SIZE = 8)
(
  input [SIZE-1:0] A, B, 
  input Cin,
  output [SIZE-1:0] S, 
  output Cout
);
  
  wire [SIZE:0] carry; 
  
  assign carry[0] = Cin;  

  genvar i;
  generate
    for (i = 0; i < SIZE; i = i + 1) begin : generate_fa
      full_adder fa 
      (
        .A(A[i]), 
        .B(B[i]), 
        .C_in(carry[i]), 
        .C_out(carry[i+1]), 
        .Sum(S[i])
      );
    end
  endgenerate

  assign Cout = carry[SIZE]; 
endmodule


