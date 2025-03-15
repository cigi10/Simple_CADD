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

module comparator #(parameter WIDTH = 4) 
(
    input logic [WIDTH-1:0] a, b,
    output logic equal, lower, greater
);
    always_comb begin
        equal   = (a == b);
        lower   = (a < b);
        greater = (a > b);
    end
endmodule



