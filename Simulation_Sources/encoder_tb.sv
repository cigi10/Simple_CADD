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


module encoder_tb;
  
  parameter decode_width = 16;
  parameter encode_width = $clog2(decode_width);
  
  reg [decode_width-1:0] in;
  wire [encode_width-1:0] out;
  
  encoder #(decode_width, encode_width) dut (.in(in), .out(out));
  
  initial begin
    for (int i = 0; i < decode_width; i++) begin
      in = (1 << i);
      #10;
      assert(out == i) else $error("Mismatch: Expected %d, Got %d", i, out);
    end
    $finish;
  end
  
endmodule


