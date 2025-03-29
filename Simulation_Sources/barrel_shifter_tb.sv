`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 03:53:00 PM
// Design Name: 
// Module Name: barrel_shifter_tb
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



module barrel_shifter_tb;
    logic [7:0] data;
    logic [2:0] amt;
    logic [7:0] out;

    barrel_shifter uut
    (
        .data(data),
        .amt(amt), 
        .out(out)
    );

    initial begin
        // alternating bits
        data = 8'b0101_0101;
        for (int i = 0; i < 8; i++) begin
            amt = i;
            #10;
        end

        // specific bit pattern
        data = 8'b1100_1100; 
        for (int i = 0; i < 8; i++) begin
            amt = i;
            #10;
        end

        // single bit set
        data = 8'b0000_0001;
        for (int i = 0; i < 8; i++) begin
            amt = i;
            #10;
        end

        $stop;
    end
endmodule
