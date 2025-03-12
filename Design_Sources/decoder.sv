`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 09:48:12 PM
// Design Name: 
// Module Name: decoder
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


module decoder #(
  parameter encode_width = 4,
  parameter decode_width = (1 << encode_width) 
) (
  input  logic [encode_width-1:0] in,
  output logic [decode_width-1:0] out
);

  always_comb begin
    out = '0; // initialize output to zero
      out[in] = 1'b1;
  end

endmodule

