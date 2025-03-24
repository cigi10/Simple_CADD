`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: 
// Project Name: divider
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



module divider #(parameter WIDTH=4) 
(
    input clk,
    input reset,
    input start,
    input [WIDTH-1:0] dividend,
    input [WIDTH-1:0] divisor,
    output reg [WIDTH-1:0] quotient,
    output reg [WIDTH-1:0] remainder,
    output reg done
);

reg [WIDTH-1:0] count;
reg [2*WIDTH-1:0] current_dividend;
reg [WIDTH-1:0] current_divisor;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        quotient <= 0;
        remainder <= 0;
        done <= 0;
        count <= 0;
    end 
    else if (start) begin
        // initialize values
        current_dividend = { {WIDTH{1'b0}}, dividend };
        current_divisor = divisor << (WIDTH-1);
        count <= 0;
        done <= 0;
    end
    else if (!done && count < WIDTH) begin
        // division step
        if (current_dividend >= current_divisor) begin
            current_dividend = current_dividend - current_divisor;
            quotient[WIDTH-1-count] <= 1'b1;  // set quotient bit
        end
        current_divisor = current_divisor >> 1;
        count <= count + 1;
        
        // final step
        if (count == WIDTH-1) begin
            remainder <= current_dividend[WIDTH-1:0];
            done <= 1;
        end
    end
end

endmodule

