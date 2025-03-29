`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 03:53:00 PM
// Design Name: 
// Module Name: instructiondecoder_tb
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




/**
 * testbench for instructiondecoder module
 * verifies correct control signal generation
 */
module instructiondecoder_tb();

// //////////////////////////////////////////////////////////////////////////////////
// test parameters
// //////////////////////////////////////////////////////////////////////////////////
parameter CLK_PERIOD = 10;     // clock period in ns
parameter PH2_OFFSET = 2;      // phase 2 clock offset

// //////////////////////////////////////////////////////////////////////////////////
// dut signals
// //////////////////////////////////////////////////////////////////////////////////
logic sys_clock;               // system clock
logic rst;                     // active-low reset
logic clk_ph2;                 // phase 2 clock
logic [2:0] cycle;             // instruction cycle
logic [7:0] ir;                // instruction register
logic [7:0] ctrl_sig1;         // control signals

// //////////////////////////////////////////////////////////////////////////////////
// instantiate dut
// //////////////////////////////////////////////////////////////////////////////////
instructiondecoder dut 
(
    .sys_clock(sys_clock),
    .rst(rst),
    .clk_ph2(clk_ph2),
    .cycle(cycle),
    .ir(ir),
    .ctrl_sig1(ctrl_sig1)
);

// //////////////////////////////////////////////////////////////////////////////////
// clock generation
// //////////////////////////////////////////////////////////////////////////////////
initial begin
    sys_clock = 0;
    forever #(CLK_PERIOD/2) sys_clock = ~sys_clock;
end

// //////////////////////////////////////////////////////////////////////////////////
// phase 2 clock generation
// //////////////////////////////////////////////////////////////////////////////////
initial begin
    clk_ph2 = 0;
    #PH2_OFFSET;               // offset from main clock
    forever #(CLK_PERIOD/2) clk_ph2 = ~clk_ph2;
end

// //////////////////////////////////////////////////////////////////////////////////
// test stimulus
// //////////////////////////////////////////////////////////////////////////////////
initial begin
    // initialize inputs
    rst = 0;
    cycle = 0;
    ir = 0;
    
    // reset sequence
    #(CLK_PERIOD*1.5) rst = 1;
    
    // test case 1: opcode1 at cycle 0
    #CLK_PERIOD;
    ir = 8'h01;                // opcode1
    cycle = 0;
    #CLK_PERIOD;
    
    // test case 2: opcode1 at cycle 1
    ir = 8'h01;                // opcode1
    cycle = 1;
    #CLK_PERIOD;
    
    // test case 3: opcode2 at cycle 0
    ir = 8'h02;                // opcode2
    cycle = 0;
    #CLK_PERIOD;
    
    // test case 4: opcode3 at cycle 0
    ir = 8'h03;                // opcode3
    cycle = 0;
    #CLK_PERIOD;
    
    // test case 5: undefined opcode
    ir = 8'hFF;                // undefined
    cycle = 0;
    #CLK_PERIOD;
    
    // end simulation
    #(CLK_PERIOD*2) $finish;
end

// //////////////////////////////////////////////////////////////////////////////////
// monitoring and verification
// //////////////////////////////////////////////////////////////////////////////////
initial begin
    $monitor("time=%0t, cycle=%d, ir=0x%h, ctrl_sig1=0x%h", 
             $time, cycle, ir, ctrl_sig1);
    
    // automatic checking
    fork
        // check reset behavior
        begin
            @(negedge rst);
            if (ctrl_sig1 !== 8'b0)
                $display("error: reset failed to clear ctrl_sig1");
        end
        
        // check opcode1 cycle 0
        begin
            @(posedge sys_clock iff (ir == 8'h01 && cycle == 0 && rst && clk_ph2));
            #1;
            if (ctrl_sig1[0] !== 1'b1 || ctrl_sig1[1] !== 1'b0)
                $display("error: opcode1 cycle 0 failed");
        end
        
        // check opcode1 cycle 1
        begin
            @(posedge sys_clock iff (ir == 8'h01 && cycle == 1 && rst && clk_ph2));
            #1;
            if (ctrl_sig1[3] !== 1'b1 || ctrl_sig1[4] !== 1'b1)
                $display("error: opcode1 cycle 1 failed");
        end
        
        // check opcode3 cycle 0
        begin
            @(posedge sys_clock iff (ir == 8'h03 && cycle == 0 && rst && clk_ph2));
            #1;
            if (ctrl_sig1[0] !== 1'b0 || ctrl_sig1[2] !== 1'b1)
                $display("error: opcode3 cycle 0 failed");
        end
    join_none
end

endmodule
