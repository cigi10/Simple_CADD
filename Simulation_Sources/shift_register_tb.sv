`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/16/2025 02:30:38 PM
// Design Name: 
// Module Name: shift_register_tb
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



module shift_register_tb;
    reg clock, reset, shift_en, data_in;
    wire [7:0] data_out;
    
    shift_register #(8) uut 
    (
        .clock(clock),
        .reset(reset),
        .shift_en(shift_en),
        .data_in(data_in),
        .data_out(data_out)
    );
    
    initial begin
        clock = 0;
        reset = 1;
        shift_en = 0;
        data_in = 0;
        #10 reset = 0;
        #10 shift_en = 1; data_in = 1;
        #10 clock = 1;
        #10 clock = 0;
        #10 data_in = 0;
        #10 clock = 1;
        #10 clock = 0;
        #10 data_in = 1;
        #10 clock = 1;
        #10 clock = 0;
        #10 $finish;
    end
    
    always #5 clock = ~clock;
    
endmodule
