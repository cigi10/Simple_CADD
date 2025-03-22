`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: subtractor
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


module subtractor #(parameter WIDTH = 1) 
(
    input [WIDTH-1:0] a, b, Bin,
    output [WIDTH-1:0] D,
    output Bout
);

  assign D = a ^ b ^ Bin;                // difference
  assign Bout = (~a & b) | (~(a ^ b) & Bin); // borrow out
endmodule



// for Full Subtractor
//  assign D = a ^ b ^ Bin;
//  assign Bout = (~a & b) | (~(a ^ b) & Bin);

// for Half Subtractor
//  assign D = a ^ b;
//  assign B = ~a & b;

