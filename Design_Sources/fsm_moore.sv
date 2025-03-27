`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: 
// Project Name: fsm_moore
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



module fsm_moore 
(
    input  wire clk,
    input  wire resetn,       
    input  wire input_signal,
    output reg  output_signal
);

typedef enum logic [1:0] 
{
    IDLE,     // 2'b00
    STATE_1,  // 2'b01
    STATE_2   // 2'b10
} state_t;

state_t cur_state, next_state;

always @(posedge clk or negedge resetn) begin
    if (!resetn) begin
        cur_state <= IDLE;    
    end else begin
        cur_state <= next_state;
    end
end

always @(*) begin
    next_state = cur_state;  
    
    case (cur_state)
        IDLE: begin
            if (input_signal)
                next_state = STATE_1;
        end

        STATE_1: begin
            if (!input_signal)
                next_state = STATE_2;
        end

        STATE_2: begin
            next_state = IDLE;  
        end

        default: next_state = IDLE;  
    endcase
end


always @(*) begin
    output_signal = 1'b0;  
    
    case (cur_state)
        STATE_1: output_signal = 1'b1;  
        STATE_2: output_signal = 1'b0;
        default: output_signal = 1'b0;
    endcase
end

endmodule
