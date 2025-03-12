`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 09:47:15 PM
// Design Name: 
// Module Name: decoder_tb
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


module decoder_tb;
  
  parameter encode_width = 4;
  parameter decode_width = (1 << encode_width);
  
  reg [encode_width-1:0] in;
  wire [decode_width-1:0] out;
  
  decoder #(encode_width, decode_width) dut (.in(in), .out(out));
  
  initial begin
    for (int i = 0; i < decode_width; i++) begin
      in = i;
      #10;
      assert(out == (1 << i));
    end
    $finish;
  end
  
endmodule

