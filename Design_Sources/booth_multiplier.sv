`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: 
// Project Name: booth_multiplier
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


// https://electrobinary.blogspot.com/2020/08/booth-multiplier-verilog-code.html -> reference

module booth_multiplier
(
    input clk,
    input rst,
    input start,
    input signed [3:0] X,
    input signed [3:0] Y,
    output reg signed [7:0] Z,
    output reg valid
);

    reg [1:0] count;
    reg [1:0] temp;
    reg state;
    reg signed [7:0] Z_temp;
    
    parameter IDLE = 1'b0;
    parameter START = 1'b1;

    always @(posedge clk or negedge rst) begin
        if (!rst) begin
            Z <= 8'd0;
            valid <= 1'b0;
            state <= IDLE;
            temp <= 2'd0;
            count <= 2'd0;
        end
        else begin
            case (state)
                IDLE: begin
                    if (start) begin
                        state <= START;
                        temp <= {X[0], 1'b0};
                        Z <= {4'd0, X};
                        count <= 2'd0;
                        valid <= 1'b0;
                    end
                    else begin
                        Z <= 8'd0;
                        valid <= 1'b0;
                    end
                end
                
                START: begin
                    case (temp)
                        2'b10: Z_temp = {Z[7:4] - Y, Z[3:0]};
                        2'b01: Z_temp = {Z[7:4] + Y, Z[3:0]};
                        default: Z_temp = Z;
                    endcase
                    
                    temp <= {X[count+1], X[count]};
                    count <= count + 1'b1;
                    Z <= Z_temp >>> 1;
                    
                    if (&count) begin
                        valid <= 1'b1;
                        state <= IDLE;
                    end
                    else begin
                        valid <= 1'b0;
                    end
                end
            endcase
        end
    end
endmodule
