`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 09:47:15 PM
// Design Name: 
// Module Name: encoder_tb
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


module priority_encoder_tb;
  parameter N = 8;
  // $clog2(N) computes the minimum number of bits required to encode N states
  parameter M = $clog2(N);
  
  reg [N-1:0] D;
  wire [M-1:0] y;
  reg error;
  
  priority_encoder #(N, M) uut (.D(D), .y(y));
  
  initial begin
    error = 0;
    for (int i = 0; i < N; i = i + 1) begin
      D = 1 << i; // shifting 1 to position i
      #10;
      if (y !== i[M-1:0]) // checking if the output matches the expected index
        error = 1;
    end
    
    D = 0; // test with all bits low
    #10;
    if (y !== 0)
      error = 1;
    
    #10;
    $finish;
  end
endmodule

