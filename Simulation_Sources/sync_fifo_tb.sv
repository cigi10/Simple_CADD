`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 03:53:00 PM
// Design Name: 
// Module Name: sync_fifo_tb
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



module sync_fifo_tb();
parameter DEPTH=8;
parameter DWIDTH=16;
reg clk,rstn,wr_en,rd_en;
reg [DWIDTH-1:0] din;
wire [DWIDTH-1:0] dout;
wire empty,full;

sync_fifo uut(.clk(clk),.rstn(rstn),.wr_en(wr_en),.rd_en(rd_en),
             .din(din),.dout(dout),.empty(empty),.full(full));

always #5 clk=~clk;

initial begin
clk=0;rstn=0;wr_en=0;rd_en=0;din=0;
#20 rstn=1;

for(int i=0;i<DEPTH;i++) begin
@(posedge clk); wr_en=1; din=$random; end
wr_en=0;

for(int i=0;i<DEPTH;i++) begin
@(posedge clk); rd_en=1; end
rd_en=0;

fork
begin for(int i=0;i<DEPTH*2;i++) begin
@(posedge clk iff !full); wr_en=1; din=$random; end
wr_en=0; end
begin for(int i=0;i<DEPTH*2;i++) begin
@(posedge clk iff !empty); rd_en=1; end
rd_en=0; end
join

#100 $finish;
end
endmodule
