`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 05:27:12 PM
// Design Name: 
// Module Name: xnor_gate_tb
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


module xnor_gate_tb();
   reg a,b; 
   wire y; 
   xnor_gate dut (.a(a), .b(b), .y(y));
   initial begin
   a = 0; b = 0; #10;
   a = 0; b = 1; #10;
   a = 1; b = 0; #10;
   a = 1; b = 1; #10;
   end
endmodule
