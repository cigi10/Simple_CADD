`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 03:53:00 PM
// Design Name: 
// Module Name: fpu_tb
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



module fpu_tb;
    reg [31:0] a, b;
    reg [1:0] op;
    wire [31:0] result;
    
    fpu uut 
    (
        .a(a),
        .b(b),
        .op(op),
        .result(result)
    );
    
    initial begin       
    
        // test addition
        a = 32'h41403100; 
        b = 32'h40830011; 
        op = 2'b00;
        #10;
        
        // subtraction
        a = 32'h40A00000; 
        b = 32'h40000000; 
        op = 2'b01;
        #10;
        
        // multiplication
        a = 32'h3F800300; 
        b = 32'h42023100; 
        op = 2'b10;
        #10;
        
        // division
        a = 32'h40800100;
        b = 32'h40000200;
        op = 2'b11;
        #10;
        
         // addition
        a = 32'h7F800000; // +infinity
        b = 32'hFF800000; // -infinity
        op = 2'b00;
        #10;
        
        // subtraction
        a = 32'h7FC00000; // NaN
        b = 32'h3F800000; // 1.0
        op = 2'b01;
        #10;
        
        // multiplication
        a = 32'h00000001; // smallest denormal number
        b = 32'h3F800000; // 1.0
        op = 2'b10;
        #10;
        
        // division
        a = 32'h80000000; // -0.0
        b = 32'h3F800000; // 1.0
        op = 2'b11;
        #10;
        
        // multiplication
        a = 32'h4EFFFFFF; // large positive float
        b = 32'h3F800000; // 1.0
        op = 2'b10;
        #10;
        
        // division
        a = 32'h00000002; // very small float
        b = 32'h7F7FFFFF; // largest finite float
        op = 2'b11;
        #10;
        
        $finish;
    end
endmodule
