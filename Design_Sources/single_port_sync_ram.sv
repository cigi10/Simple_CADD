`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: 
// Project Name: single_port_sync_ram
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



module single_port_sync_ram
  #(parameter ADDR_WIDTH = 4,
    parameter DATA_WIDTH = 32,
    parameter DEPTH = 16
   )
   
   (input clk,
    input [ADDR_WIDTH-1:0] address,
    inout [DATA_WIDTH-1:0] data_bus,
    input chip_select,
    input write_enable,
    input output_enable
   );

  reg [DATA_WIDTH-1:0]    output_buffer;
  reg [DATA_WIDTH-1:0]    memory [0:DEPTH-1];

  // write operation
  always @(posedge clk) begin
    if (chip_select && write_enable)
      memory[address] <= data_bus;
  end

  // read operation
  always @(posedge clk) begin
    if (chip_select && !write_enable)
      output_buffer <= memory[address];
  end

  // tri-state output
  assign data_bus = (chip_select && output_enable && !write_enable) ? 
                   output_buffer : {DATA_WIDTH{1'bz}};

endmodule
