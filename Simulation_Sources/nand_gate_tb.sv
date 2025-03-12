`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 04:46:20 PM
// Design Name: 
// Module Name: nand_gate_tb
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


module nand_gate_tb();
   reg a,b; 
   wire y; 
   nand_gate dut (.a(a), .b(b), .y(y));
   initial begin
   a = 0; b = 0; #10;
   a = 0; b = 1; #10;
   a = 1; b = 0; #10;
   a = 1; b = 1; #10;
   end
endmodule
