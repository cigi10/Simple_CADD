`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 09:47:15 PM
// Design Name: 
// Module Name: encoder_tb
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


module comparator_tb;
    parameter WIDTH = 4;
    reg [WIDTH-1:0] a, b;
    wire eq, lw, gr;
    reg error;

    comparator #(WIDTH) uut 
    (.a(a), .b(b), .equal(eq), .lower(lw), .greater(gr));

    initial begin
        error = 0;
        for (int i = 0; i < (1 << WIDTH); i++) begin
            a = i;
            for (int j = 0; j < (1 << WIDTH); j++) begin
                b = j;
                #10;
                if ((a == b && eq != 1) || (a > b && gr != 1) || (a < b && lw != 1)) begin
                    error = 1;
                end
            end
        end
        $finish;
    end
endmodule

