`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/22/2025 08:01:41 AM
// Design Name: 
// Module Name: 
// Project Name: cache_controller
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

// https://electrobinary.blogspot.com/2021/05/cache-controller-design-verilog-code.html <- reference 

module cache_controller (
	clk,
	rst_n,
	cpu_req_addr,
	cpu_req_datain,
	cpu_req_dataout,
	cpu_req_rw,
	cpu_req_valid,
	cache_ready,
	mem_req_addr,
	mem_req_datain,
	mem_req_dataout,
	mem_req_rw,
	mem_req_valid,
	mem_req_ready
);

parameter IDLE = 2'b00;
parameter COMPARE_TAG = 2'b01;
parameter ALLOCATE = 2'b10;
parameter WRITE_BACK = 2'b11;

input clk;
input rst_n;
input [31:0] cpu_req_addr;
input [127:0] cpu_req_datain;
output reg [31:0] cpu_req_dataout;
input cpu_req_rw;
input cpu_req_valid;
output reg [31:0] mem_req_addr;
input [127:0] mem_req_datain;
output reg [127:0] mem_req_dataout;
output reg mem_req_rw;
output reg mem_req_valid;
input mem_req_ready;
output reg cache_ready;

reg [23:0] tag_mem [1023:0];
reg [127:0] data_mem [1023:0];
reg [1:0] present_state, next_state;
reg [31:0] next_cpu_req_dataout;
reg [31:0] cache_read_data;
reg next_cache_ready;
reg [31:0] next_mem_req_addr;
reg next_mem_req_rw;
reg next_mem_req_valid;
reg [127:0] next_mem_req_dataout;
reg write_datamem_mem;
reg write_datamem_cpu;
reg tagmem_enable;
reg valid_bit, dirty_bit;
reg [31:0] cpu_req_addr_reg, next_cpu_req_addr_reg;
reg [127:0] cpu_req_datain_reg, next_cpu_req_datain_reg;
reg cpu_req_rw_reg, next_cpu_req_rw_reg;

wire [17:0] cpu_addr_tag;
wire [9:0] cpu_addr_index;
wire [1:0] cpu_addr_blk_offset;
wire [1:0] cpu_addr_byte_offset;
wire [19:0] tag_mem_entry;
wire [127:0] data_mem_entry;
wire hit;

assign cpu_addr_tag = cpu_req_addr_reg[31:14];
assign cpu_addr_index = cpu_req_addr_reg[13:4];
assign cpu_addr_blk_offset = cpu_req_addr_reg[3:2];
assign cpu_addr_byte_offset = cpu_req_addr_reg[1:0];
assign tag_mem_entry = tag_mem[cpu_addr_index];
assign data_mem_entry = data_mem[cpu_addr_index];
assign hit = tag_mem_entry[19] && (cpu_addr_tag == tag_mem_entry[17:0]);

initial $readmemh("tag_memory.mem", tag_mem);
initial $readmemh("data_memory.mem", data_mem);

always @ (posedge clk or negedge rst_n) begin
  if (!rst_n) begin
	present_state <= IDLE;
	cpu_req_dataout <= 32'd0;
	cache_ready <= 1'b0;
	mem_req_addr <= 32'd0;
	mem_req_rw <= 1'b0;
	mem_req_valid <= 1'b0;
	mem_req_dataout <= 128'd0;
	cpu_req_addr_reg <= 1'b0;
	cpu_req_datain_reg <= 128'd0;
	cpu_req_rw_reg <= 1'b0;
  end else begin
	present_state <= next_state;
	cpu_req_dataout <= next_cpu_req_dataout;
	cache_ready <= next_cache_ready;
	mem_req_addr <= next_mem_req_addr;
	mem_req_rw <= next_mem_req_rw;
	mem_req_valid <= next_mem_req_valid;
	mem_req_dataout <= next_mem_req_dataout;
	cpu_req_addr_reg <= next_cpu_req_addr_reg;
	cpu_req_datain_reg <= next_cpu_req_datain_reg;
	cpu_req_rw_reg <= next_cpu_req_rw_reg;
  end
end

always @ (*) begin
    write_datamem_mem = 1'b0;
    write_datamem_cpu = 1'b0;
    valid_bit = 1'b0;
    dirty_bit = 1'b0;
    tagmem_enable = 1'b0;
    next_state = present_state;
    next_cpu_req_dataout = cpu_req_dataout;
    next_cache_ready = 1'b1;
    next_mem_req_addr = mem_req_addr;
    next_mem_req_rw = mem_req_rw;
    next_mem_req_valid = mem_req_valid;
    next_mem_req_dataout = mem_req_dataout;
    next_cpu_req_addr_reg = cpu_req_addr_reg;
    next_cpu_req_datain_reg = cpu_req_datain_reg;
    next_cpu_req_rw_reg = cpu_req_rw_reg;

    case (cpu_addr_blk_offset)
	2'b00: cache_read_data = data_mem_entry[31:0];
	2'b01: cache_read_data = data_mem_entry[63:32];
	2'b10: cache_read_data = data_mem_entry[95:64];
	2'b11: cache_read_data = data_mem_entry[127:96];
    endcase

    case(present_state)
      IDLE:
        if (cpu_req_valid) begin
          next_cpu_req_addr_reg = cpu_req_addr;
          next_cpu_req_datain_reg = cpu_req_datain;
          next_cpu_req_rw_reg = cpu_req_rw;
          next_cache_ready = 1'b0;
          next_state = COMPARE_TAG;
        end
      COMPARE_TAG:
        if (hit & !cpu_req_rw_reg) begin
          next_cpu_req_dataout = cache_read_data;
          next_state = IDLE;
        end
      ALLOCATE:
        if (!mem_req_valid && mem_req_ready) begin
          write_datamem_mem = 1'b1;
          valid_bit = 1'b1;
          dirty_bit = 1'b0;
          tagmem_enable = 1'b1;
          next_state = COMPARE_TAG;
        end
      WRITE_BACK:
        if (!mem_req_valid && mem_req_ready) begin
          valid_bit = 1'b1;
          dirty_bit = 1'b0;
          tagmem_enable = 1'b1;
          next_mem_req_addr = cpu_req_addr_reg;
          next_mem_req_rw = 1'b0;
          next_mem_req_valid = !cpu_req_rw_reg;
          next_state = cpu_req_rw_reg ? COMPARE_TAG : ALLOCATE;
        end
    endcase
end
endmodule
