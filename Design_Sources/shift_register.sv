`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:29:56 PM
// Design Name: 
// Module Name: shift_register
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



module shift_register #(parameter N = 8) 
(
    input clock, reset, shift_en,
    input data_in,
    output reg [N-1:0] data_out
);
    always @(posedge clock or posedge reset) begin
        if (reset)
            data_out <= 0;
        else if (shift_en)
            data_out <= {data_out[N-2:0], data_in};
    end
endmodule


