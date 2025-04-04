# Introduction

Hello there! If you're new to SystemVerilog, it's basically a way to tell circuit blocks how to behave. This is called an HDL or Hardware Description Language. SystemVerilog is one of the most widely used HDLs.

With Verilog, we take tiny logic blocks and combine them into something much bigger—like the electronic devices you use daily. In this repo, we'll be using Vivado to simulate and synthesize our code, meaning we'll analyze how our circuits behave.

## Coding Styles in Verilog
There are three main ways to write Verilog code:
- **Behavioral**
- **Structural**
- **Dataflow**

For simplicity, we'll be using **behavioral** style since it’s easier to understand as beginners.

---

# Files in SystemVerilog

## Design Files
- These are where you define your circuit and its functionality.
- This is written at the **Register Transfer Level (RTL)**, meaning it deals with gates, registers, and logic blocks.
- If you’re familiar with C, SystemVerilog’s syntax will feel somewhat familiar.

## Testbench Files
- These files help verify that your design works as expected.
- You provide test inputs, and they generate outputs based on your module.
- This is how you **simulate** hardware.

## Constraint Files
- These define rules to ensure a reliable and functional design.
- Constraints are necessary if you want a design that actually works without issues.

Every file will have comments explaining the chosen syntax, so don’t worry!

---

# Content of Code Blocks

## Basic Logic Gates (Combinational)
- [x] NOT Gate  
- [x] AND Gate  
- [x] OR Gate  
- [x] NAND Gate  
- [x] NOR Gate  
- [x] XOR Gate  
- [x] XNOR Gate  

## Basic Blocks (Combinational)
- [x] Multiplexer  
- [x] Decoder  
- [x] Encoder  
- [x] Priority Encoder  
- [x] Comparator  

## Arithmetic Units
- [x] Half Adder  
- [x] Full Adder  
- [x] Ripple Carry Adder  
- [x] Carry Lookahead Adder  
- [x] Subtractor  
- [x] Multiplier  
- [x] Divider  
- [x] ALU (Arithmetic Logic Unit)  

## Sequential Logic (Memory Elements)
- [x] SR Latch  
- [x] D Latch  
- [x] D Flip-Flop  
- [x] T Flip-Flop  
- [x] JK Flip-Flop  
- [x] Register  
- [x] Shift Register  
- [x] Counter  

## Memory Units
- [x] RAM  
- [x] FIFO Buffer  
- [x] Stack (LIFO) with Push/Pop  

## Control & Processing Units
- [x] Finite State Machine  
- [x] Instruction Decoder  
- [x] Program Counter  
- [x] Simple RISC-V CPU - https://github.com/cigi10/RISCV-Mini-1

## Advanced Blocks
- [x] Barrel Shifter  
- [x] Booth Multiplier  
- [x] Wallace Tree Multiplier  
- [x] Floating-Point Unit (FPU)  
- [x] Cache Controller  

