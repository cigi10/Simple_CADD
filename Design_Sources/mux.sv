`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/12/2025 06:39:49 PM
// Design Name: 
// Module Name: mux
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


module mux #(parameter WIDTH = 4) 
    (
        input  logic [WIDTH-1:0] select,   // one-hot select signal
        input  logic [WIDTH-1:0] data_in,  // input data
        output logic data_out              
    );
        
    always_comb 
    begin
        data_out = 0; // starting value we should put 0
        for (int i = 0; i < WIDTH; i++) 
        begin
            if (select[i])  // putting the respective data inside based on what select is chosen
                data_out = data_in[i];
        end
    end
endmodule

