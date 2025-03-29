`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: 
// Project Name: instructiondecoder
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


// https://hackaday.io/project/21496-fpga-nes/log/58971-instruction-decoder -> reference 
/**
 * instruction decoder - decodes machine instructions and generates control signals
 * for a cpu's execution pipeline. operates synchronously with the system clock.
 * 
 * features:
 * - multi-cycle instruction support
 * - phase-aligned operation (using clk_ph2)
 * - fully synchronous design with reset
 * - detailed per-cycle, per-opcode control signal generation
 */
module instructiondecoder
(
    // system control signals
    input logic sys_clock,        // primary system clock (synchronous operations)
    input logic rst,              // active-low reset (0 = reset, 1 = normal operation)
    
    // timing signals
    input logic clk_ph2,          // clock phase 2 (used for precise timing alignment)
    
    // execution state
    input logic [2:0] cycle,      // current instruction cycle (0-7 possible cycles)
    input logic [7:0] ir,         // instruction register (holds current opcode)
    
    // control outputs
    output logic [7:0] ctrl_sig1  // primary control signal output (8-bit wide)
    // note: in practice, you might have multiple control signals bundled here
);

// //////////////////////////////////////////////////////////////////////////////////
// opcode definitions
// //////////////////////////////////////////////////////////////////////////////////
// these should match the cpu's instruction set architecture
typedef enum logic [7:0] {
    opcode1 = 8'h01,        // example opcode 1 (load instruction)
    opcode2 = 8'h02,        // example opcode 2 (store instruction)
    opcode3 = 8'h03         // example opcode 3 (branch instruction)
} opcodes_t;

// //////////////////////////////////////////////////////////////////////////////////
// control signal decoding logic
// //////////////////////////////////////////////////////////////////////////////////
always_ff @(posedge sys_clock) begin
    // reset condition (active-low)
    if (!rst) begin
        // reset all control signals to default (inactive) state
        ctrl_sig1 <= '0;
        // note: in a real implementation, you might have multiple signals to reset
    end
    
    // normal operation (only during clock phase 2)
    else if (clk_ph2) begin
        // default: clear all control signals at start of each cycle
        // this ensures no signals remain accidentally asserted
        ctrl_sig1 <= '0;
        
        /**
         * instruction decoding strategy:
         * 1. first level case: current execution cycle
         * 2. second level case: specific opcode being executed
         * 
         * this structure allows for multi-cycle instructions where each
         * cycle might require different control signals.
         */
        case (cycle)
            // ------------------------------------------------------------
            // cycle 0: instruction fetch and initial decode
            // ------------------------------------------------------------
            0: begin
                case (opcodes_t'(ir))
                    opcode1, opcode2: begin
                        // common setup for opcode1 and opcode2
                        ctrl_sig1[0] <= 1'b1;    // example: enable pc increment
                        ctrl_sig1[1] <= 1'b0;    // example: disable memory write
                        // additional control signals as needed...
                    end
                    
                    opcode3: begin
                        // special handling for opcode3
                        ctrl_sig1[0] <= 1'b0;    // example: hold pc
                        ctrl_sig1[2] <= 1'b1;    // example: prepare alu input a
                    end
                    
                    default: begin
                        // handle undefined opcodes (could trigger an exception)
                        ctrl_sig1 <= '0;         // safe default
                    end
                endcase
            end
            
            // //////////////////////////////////////////////////////////////////////////////////
            // cycle 1: first execution stage
            // //////////////////////////////////////////////////////////////////////////////////
            1: begin
                case (opcodes_t'(ir))
                    opcode1: begin
                        // cycle 1 operations for opcode1
                        ctrl_sig1[3] <= 1'b1;    // example: enable register read
                        ctrl_sig1[4] <= 1'b1;    // example: select alu operation
                    end
                    
                    opcode2: begin
                        // cycle 1 operations for opcode2
                        ctrl_sig1[5] <= 1'b1;    // example: memory address setup
                    end
                    
                    default: begin
                        // default case for cycle 1
                        ctrl_sig1 <= '0;
                    end
                endcase
            end
            
            // //////////////////////////////////////////////////////////////////////////////////
            // default case for unexpected cycle numbers
            // //////////////////////////////////////////////////////////////////////////////////
            default: begin
                ctrl_sig1 <= '0;
            end
        endcase
    end
end

endmodule
