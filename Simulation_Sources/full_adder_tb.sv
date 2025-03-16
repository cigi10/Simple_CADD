`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:30:38 PM
// Design Name: 
// Module Name: full_adder_tb
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


module full_adder_tb;
  reg [3:0] A, B;
  reg C_in;
  wire C_out;
  wire [3:0] Sum;

  fulladd uut (
    .A(A),
    .B(B),
    .C_in(C_in),
    .C_out(C_out),
    .Sum(Sum)
  );

  initial begin
    A = 4'b0000; B = 4'b0000; C_in = 0; #10;
    A = 4'b0001; B = 4'b0010; C_in = 0; #10;
    A = 4'b0100; B = 4'b0011; C_in = 1; #10;
    A = 4'b1001; B = 4'b0110; C_in = 0; #10;
    A = 4'b1111; B = 4'b1111; C_in = 1; #10;
    $finish;
  end
endmodule
