// bit rotation (circular shift

`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: 
// Project Name: barrel_shifter
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


module barrel_shifter
(
    input logic [7:0] data,
    input logic [2:0] amt,
    output logic [7:0] out
);

    always_comb
    begin
        case (amt)
            3'o0: out = data;
            3'o1: out = {data[0], data[7:1]};
            3'o2: out = {data[1:0], data[7:2]};
            3'o3: out = {data[2:0], data[7:3]};
            3'o4: out = {data[3:0], data[7:4]};
            3'o5: out = {data[4:0], data[7:5]};
            3'o6: out = {data[5:0], data[7:6]};
            default  out = {data[6:0], data[7]};
        endcase
    end
endmodule
