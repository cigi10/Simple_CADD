`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: 
// Project Name: sync_fifo
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



module sync_fifo #(
  parameter DEPTH = 8,    
  parameter DWIDTH = 16
)
(
  input rstn,     // active-low reset
  input clk,     
  input wr_en,    // write enable
  input rd_en,    // read enable
  input [DWIDTH-1:0]   din,      // data input
  output reg [DWIDTH-1:0] dout,  // data output
  output empty,    // FIFO empty flag
  output full      // FIFO full flag
);

  // Pointers
  reg [$clog2(DEPTH):0] wptr;   // MSB is wrap bit 
  reg [$clog2(DEPTH):0] rptr;   // MSB is wrap bit
  
  // memory array
  reg [DWIDTH-1:0] fifo [0:DEPTH-1];

  // full/empty logic
  assign full  = (wptr[$clog2(DEPTH)-1:0] == rptr[$clog2(DEPTH)-1:0]) && 
                 (wptr[$clog2(DEPTH)] != rptr[$clog2(DEPTH)]);
  
  assign empty = (wptr == rptr);

  // write 
  always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
      wptr <= 0;
    end else if (wr_en && !full) begin
      fifo[wptr[$clog2(DEPTH)-1:0]] <= din;
      wptr <= wptr + 1;
    end
  end

  // read
  always @(posedge clk or negedge rstn) begin
    if (!rstn) begin
      rptr <= 0;
      dout <= 0;
    end else if (rd_en && !empty) begin
      dout <= fifo[rptr[$clog2(DEPTH)-1:0]];
      rptr <= rptr + 1;
    end
  end

  // debug
  initial begin
    $monitor("[%0t] wr=%b din=0x%h rd=%b dout=0x%h empty=%b full=%b",
             $time, wr_en, din, rd_en, dout, empty, full);
  end
endmodule
