`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 03:53:00 PM
// Design Name: 
// Module Name: wallace_tree_multiplier_tb
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



module wallace_tree_multiplier_tb;
  reg [3:0] A,B;
  wire [7:0] P;
  
  wallace_tree_multiplier wta(A,B,P);
  
  initial begin
    $monitor("A = %b: B = %b --> Product = %b", A, B, P);
    A = 1; B = 0; #3;  
    A = 7; B = 5; #3;  
    A = -5; B = 4; #3; 
    A = -3; B = 7; #3; 
    A = -9; B = 'h4; #3;  
    A = 7; B = 'hf;    
  end
endmodule
