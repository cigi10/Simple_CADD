`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:29:56 PM
// Design Name: 
// Module Name: full_adder
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
  input [3:0] A,
  input [3:0] B,
  input C_in,
  output reg C_out,
  output reg [3:0] Sum
);

  always @(*) begin
    // performs addition of A, B, and C_in
    // the result is 5 bits long (4-bit sum + 1-bit carry)
    // the MSB of the result is assigned to C_out (carry-out)
    // the lower 4 bits are assigned to Sum
    {C_out, Sum} = A + B + C_in;
  end

endmodule
