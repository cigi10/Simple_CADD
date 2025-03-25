`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: 
// Project Name: alu
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



module alu #(
    parameter width = 32
) 
(
    input [width-1:0] a, b,
    input [3:0] alu_op,
    output reg [width-1:0] result,
    output zero,
    output carry,
    output overflow,
    output negative
);

    localparam ADD  = 4'b0000;
    localparam SUB  = 4'b0001;
    localparam AND  = 4'b0010;
    localparam OR   = 4'b0011;
    localparam XOR  = 4'b0100;
    localparam NOR  = 4'b0101;
    localparam NOT  = 4'b0110;
    localparam SLL  = 4'b0111;
    localparam SRL  = 4'b1000;
    localparam SRA  = 4'b1001;
    localparam SLT  = 4'b1010;
    localparam SLTU = 4'b1011;
    localparam EQ   = 4'b1100;
    localparam NE   = 4'b1101;
    localparam GE   = 4'b1110;
    localparam GEU  = 4'b1111;

    wire [width:0] add_result = {1'b0, a} + {1'b0, b};
    wire [width:0] sub_result = {1'b0, a} - {1'b0, b};

    always @(*) begin
        case(alu_op)
            ADD:  result = add_result[width-1:0];
            SUB:  result = sub_result[width-1:0];
            AND:  result = a & b;
            OR:   result = a | b;
            XOR:  result = a ^ b;
            NOR:  result = ~(a | b);
            NOT:  result = ~a;
            SLL:  result = a << b[4:0];
            SRL:  result = a >> b[4:0];
            SRA:  result = $signed(a) >>> b[4:0];
            SLT:  result = ($signed(a) < $signed(b)) ? 1 : 0;
            SLTU: result = (a < b) ? 1 : 0;
            EQ:   result = (a == b) ? 1 : 0;
            NE:   result = (a != b) ? 1 : 0;
            GE:   result = ($signed(a) >= $signed(b)) ? 1 : 0;
            GEU:  result = (a >= b) ? 1 : 0;
            default: result = 0;
        endcase
    end

    assign zero = (result == 0);
    assign carry = (alu_op == ADD) ? add_result[width] : 
                 (alu_op == SUB) ? sub_result[width] : 1'b0;
    
    assign overflow = (alu_op == ADD) ? 
                     (~a[width-1] & ~b[width-1] & result[width-1]) |
                     (a[width-1] & b[width-1] & ~result[width-1]) :
                    (alu_op == SUB) ?
                     (~a[width-1] & b[width-1] & result[width-1]) |
                     (a[width-1] & ~b[width-1] & ~result[width-1]) : 1'b0;
    
    assign negative = result[width-1];

endmodule
