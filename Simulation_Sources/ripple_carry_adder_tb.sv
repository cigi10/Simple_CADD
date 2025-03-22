`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:02:06 AM
// Design Name: 
// Module Name: rca_tb
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



module rca_tb;
  parameter SIZE = 8;
  
  reg [SIZE-1:0] A, B;
  reg Cin;
  wire [SIZE-1:0] S;
  wire Cout;
  
  rca #(SIZE) uut (A, B, Cin, S, Cout);

  initial begin
    A = 8'b00000000; B = 8'b00000000; Cin = 1'b0; #10;
    A = 8'b00000101; B = 8'b00001010; Cin = 1'b0; #10;
    A = 8'b01100100; B = 8'b00110010; Cin = 1'b0; #10;
    A = 8'b11111111; B = 8'b11111111; Cin = 1'b0; #10;
    A = 8'b01111111; B = 8'b00000001; Cin = 1'b1; #10;
      $finish;
  end
endmodule

