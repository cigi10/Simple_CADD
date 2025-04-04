`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 06:42:58 PM
// Design Name: 
// Module Name: mux_tb
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



module mux_tb();

    reg [WIDTH-1:0] select;
    reg [WIDTH-1:0] data_in;
    wire data_out;
    
    parameter WIDTH = 4;
    
    mux #(WIDTH) dut (.select(select), .data_in(data_in), .data_out(data_out));
    
    
    initial begin
        select = 4'b0001; data_in = 4'b1010; #10;
        assert(data_out === data_in[0]);

        select = 4'b0010; data_in = 4'b1100; #10;
        assert(data_out === data_in[1]);

        select = 4'b0100; data_in = 4'b0111; #10;
        assert(data_out === data_in[2]);

        select = 4'b1000; data_in = 4'b0001; #10;
        assert(data_out === data_in[3]);

        select = 4'b0000; data_in = 4'b1111; #10;
        assert(data_out === 0);

        select = 4'b0110; data_in = 4'b1001; #10;
        assert(data_out === 0); // invalid case

        $finish;
    end
endmodule
