`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:02:06 AM
// Design Name: 
// Module Name: cla_tb
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



module cla_tb;
  parameter SIZE = 8;
  
  reg [SIZE-1:0] A, B;
  reg Cin;
  wire [SIZE-1:0] S;
  wire Cout;
  
  cla #(SIZE) uut (A, B, Cin, S, Cout);

  initial begin
    A = 4'b0000; B = 4'b0000; Cin = 1'b0; #10;
    A = 4'b0101; B = 4'b1010; Cin = 1'b0; #10;
    A = 4'b1100; B = 4'b0110; Cin = 1'b0; #10;
    A = 4'b1111; B = 4'b1111; Cin = 1'b0; #10;
    A = 4'b0111; B = 4'b0001; Cin = 1'b1; #10;
    $finish;
  end
endmodule


