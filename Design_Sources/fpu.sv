`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: 
// Project Name: fpu
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

module fpu
(
    input [31:0] a, b,   
    input [1:0] op,    
    // operation :  
    // 00 - add, 
    // 01 - subtract,
    // 10 - multiply, 
    // 11 - divide
    output reg [31:0] result
);
    always @(*) begin
        case (op)
            2'b00: result = a + b;  // floating-point addition
            2'b01: result = a - b;  // floating-point subtraction
            2'b10: result = a * b;  // floating-point multiplication
            2'b11: result = a / b;  // floating-point division
            default: result = 32'h00000000;
        endcase
    end
endmodule
