`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 03:53:00 PM
// Design Name: 
// Module Name: pc_tb
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



module tb_pc();

reg clk, rst, alu_output;
reg [7:0] immediate;
wire [7:0] pc;

pc dut 
(
    .clk(clk),
    .rst(rst),
    .immediate(immediate),
    .alu_output(alu_output),
    .pc(pc)
);

initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

initial begin
    rst = 1;
    immediate = 0;
    alu_output = 0;
    #10 rst = 0;
    #30;
    immediate = 8'h20;
    alu_output = 1;
    #10 alu_output = 0;
    #30;
    $finish;
end
endmodule
