`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/26/2025 03:53:00 PM
// Design Name: 
// Module Name: cache_controller_tb
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



module cache_controller_tb;

reg clk;
reg rst_n;
reg [31:0] cpu_req_addr;
reg [127:0] cpu_req_datain;
wire [31:0] cpu_req_dataout;
reg cpu_req_rw; //1=write, 0=read
reg cpu_req_valid;

wire [31:0] mem_req_addr;
reg [127:0] mem_req_datain;
wire [127:0] mem_req_dataout;
wire mem_req_rw;
wire mem_req_valid;
reg mem_req_ready;

cache_controller dut (
    .clk	       (clk),
    .rst_n             (rst_n),
    .cpu_req_addr      (cpu_req_addr),  
    .cpu_req_datain    (cpu_req_datain),
    .cpu_req_dataout   (cpu_req_dataout),
    .cpu_req_rw        (cpu_req_rw),
    .cpu_req_valid     (cpu_req_valid),
    .cache_ready       (cache_ready),   
    .mem_req_addr      (mem_req_addr),  
    .mem_req_datain    (mem_req_datain),
    .mem_req_dataout   (mem_req_dataout),
    .mem_req_rw        (mem_req_rw),
    .mem_req_valid     (mem_req_valid),
    .mem_req_ready     (mem_req_ready)
	);
	
always #5 clk = ~clk;

task reset_values ();
begin
  clk = 1'b1; rst_n = 1'b0;
  cpu_req_addr = 32'd0; cpu_req_datain = 128'd0; cpu_req_rw = 1'b0; cpu_req_valid = 1'b0; 
  mem_req_datain = 128'd0; mem_req_ready = 1'b1;
  #20 rst_n = 1'b1;
end
endtask

task write_cpu (input [31:0]addr, input [127:0]data);
begin
  #20 cpu_req_addr = addr; cpu_req_rw = 1'b1; cpu_req_valid = 1'b1; cpu_req_datain = data; //write to cache (AB)
  #10 cpu_req_addr = 32'd0; cpu_req_rw = 1'b0; cpu_req_valid = 1'b0; cpu_req_datain = 128'd0;
end
endtask

task read_cpu (input [31:0]addr);
begin
  #20 cpu_req_addr = addr; cpu_req_rw = 1'b0; cpu_req_valid = 1'b1;  
  #10 cpu_req_addr = 32'd0; cpu_req_rw = 1'b0; cpu_req_valid = 1'b0; 
end 
endtask

initial begin
  reset_values();
  write_cpu (332'hAB00,128'h1122);  //write 
  read_cpu  (32'hAB00);		    //read hit (same tag, same index)
  read_cpu  (32'hBB00);		    //read miss, clean (same tag, diff index)
  @(negedge mem_req_valid) mem_req_ready = 1'b0;
  #20 mem_req_datain = 128'h3344; mem_req_ready = 1'b1;  

  read_cpu  (32'hEB00);		   //read miss, dirty (diff tag, same index)
  @(negedge mem_req_valid) mem_req_ready = 1'b0;
  #20 mem_req_ready = 1'b1; 
  @(negedge mem_req_valid) mem_req_ready = 1'b0;
  #30 mem_req_datain = 128'h5566; mem_req_ready = 1'b1; 
end
endmodule
