`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 09:48:12 PM
// Design Name: 
// Module Name: priority_encoder
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


module priority_encoder #(parameter N = 8, parameter M = $clog2(N)) 
(
  input [N-1:0] D,
  output reg [M-1:0] y
);
  
  always @(D) begin
    y = {M{1'b0}}; 
    for (int i = N-1; i >= 0; i = i - 1) begin
      if (D[i]) begin
        y = i[M-1:0];
        break;
      end
    end
  end
endmodule

