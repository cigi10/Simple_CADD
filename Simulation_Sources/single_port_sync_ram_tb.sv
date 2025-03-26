`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 03:53:00 PM
// Design Name: 
// Module Name: single_port_sync_ram_tb
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



module single_port_sync_ram_tb;
  parameter ADDR_WIDTH = 4;
  parameter DATA_WIDTH = 32;
  parameter DEPTH = 16;

  reg clk = 0;
  reg chip_select;
  reg write_enable;
  reg output_enable;
  reg [ADDR_WIDTH-1:0] address;
  wire [DATA_WIDTH-1:0] data_bus;
  reg [DATA_WIDTH-1:0] tb_data;

  // instantiate RAM
  single_port_sync_ram uut (
    .clk(clk),
    .address(address),
    .data_bus(data_bus),
    .chip_select(chip_select),
    .write_enable(write_enable),
    .output_enable(output_enable)
  );

  // clock generation (100MHz)
  always #5 clk = ~clk;

  // bidirectional bus control
  assign data_bus = (!output_enable && chip_select && write_enable) ? tb_data : {DATA_WIDTH{1'bz}};

  // test sequence
  initial begin
    // Initialize
    chip_select = 0;
    write_enable = 0;
    output_enable = 0;
    address = 0;
    tb_data = 0;
    
    // wait 2 clocks
    repeat(2) @(posedge clk);
    
    // write test pattern
    for (int i=0; i<DEPTH; i=i+1) begin
      @(posedge clk);
      chip_select <= 1;
      write_enable <= 1;
      output_enable <= 0;
      address <= i;
      tb_data <= $random;
    end
    
    // read back
    for (int i=0; i<DEPTH; i=i+1) begin
      @(posedge clk);
      chip_select <= 1;
      write_enable <= 0;
      output_enable <= 1;
      address <= i;
    end
    
    #100 $finish;
  end
endmodule
