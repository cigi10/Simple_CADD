`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: 
// Project Name: lifo
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



module lifo #(
    parameter WIDTH = 32,
    parameter DEPTH = 16
)
(
    input wire clk,
    input wire rst,
    input wire push,
    input wire pop,
    input wire [WIDTH-1:0]  data_in,
    output reg [WIDTH-1:0]  data_out,
    output reg empty,
    output reg full
);

    reg [WIDTH-1:0]        stack [0:DEPTH-1];
    reg [$clog2(DEPTH):0]  stack_ptr;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            stack_ptr <= 0;
            empty <= 1;
            full <= 0;
            data_out <= 0;
        end else begin
            if (push && !full) begin
                stack[stack_ptr] <= data_in;
                stack_ptr <= stack_ptr + 1;
                empty <= 0;
                full  <= (stack_ptr == DEPTH - 1);
            end else if (pop && !empty) begin
                stack_ptr <= stack_ptr - 1;
                full <= 0;
                empty <= (stack_ptr == 1);
                data_out <= stack[stack_ptr - 1];
            end else if (push && pop && !empty) begin
                stack[stack_ptr - 1] <= data_in; 
            end
        end
    end
endmodule
