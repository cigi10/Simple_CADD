`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: 
// Project Name: pc
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


module pc
(
    input clk,
    input rst,
    input [7:0] immediate,
    input alu_output,
    output reg [7:0] pc
);

wire branch_taken;
wire [7:0] next_pc;

assign branch_taken = alu_output;
assign next_pc = branch_taken ? immediate : pc + 1;

always @(posedge clk) begin
    if (rst) begin
        pc <= 8'b0;
    end
    else begin
        pc <= next_pc;
    end
end

endmodule
