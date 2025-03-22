`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:02:06 AM
// Design Name: 
// Module Name: subtractor_tb
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



module tb_subtractor;
  parameter WIDTH = 1;
  
  reg [WIDTH-1:0] a, b, Bin;
  wire [WIDTH-1:0] D;
  wire Bout;
  
  subtractor #(WIDTH) uut (
    .a(a), 
    .b(b), 
    .Bin(Bin), 
    .D(D), 
    .Bout(Bout)
  );

  initial begin
    a = 0; b = 0; Bin = 0; #10;
    a = 0; b = 0; Bin = 1; #10;
    a = 0; b = 1; Bin = 0; #10;
    a = 0; b = 1; Bin = 1; #10;
    a = 1; b = 0; Bin = 0; #10;
    a = 1; b = 0; Bin = 1; #10;
    a = 1; b = 1; Bin = 0; #10;
    a = 1; b = 1; Bin = 1; #10;
    
    $finish;
  end
endmodule




