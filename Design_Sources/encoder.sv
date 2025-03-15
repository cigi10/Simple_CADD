`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 09:48:12 PM
// Design Name: 
// Module Name: encoder
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


module encoder #(parameter decode_width = 16, parameter encode_width = $clog2(decode_width)) 
(
    input  wire [decode_width-1:0] in,
    output reg  [encode_width-1:0] out
);
    integer i;
    always @(*) begin
        out = 0;
        for (i = 0; i < decode_width; i = i + 1) begin
            if (in[i]) begin
                out = i;
            end
        end
    end
endmodule

