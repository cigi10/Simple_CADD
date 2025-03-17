Just as an introduction

- I will be using Vivado to be implementing all of the programs
- I will be providing a synthesis and a simulation of all the above 

## Basics 
- Hello there! So if you do not know what system verilog is in the first place, its basically something we use to command some circuit blocks to behave in a particular way; 
this is called HDL or hardware descriptive language. System verilog is a very popular HDL. 
- So with the help of verilog we basically command and make tiny blocks into something huge into like the devices you use in day to day life. 
- Alright! So we are going to use Vivado to simulate and synthesize our code ie see the behaviour of the electronic circuits that we have made.
- There are 3 types of styles ie writing code : Behavioural, Structural and Dataflow
In this repo, ill be using behaviour since its just simpler that way for us as beginners to know what we are doing :)

- - - 

## Files in SV

### Design Files 
- So these files are where you will "type" out your circuit and its functionality ie what you want it to do; just a note this on a register transfer level so when u hear RTL this and that its just things related to gates, registers, logic blocks that type of stuff
- this is basically synthesizing/producing the code, whatever you want to call it
- very similar to software coding and you might be able to understand and implement it pretty quick if you know C well cause its syntax is similar to that

### Testbench Files 
- These are the files you use to confirm if what youve coded is done as intended
- you provide it with test input values and they give the outputs its gotten using your module
- this essentially helps you to simulate your hardware if you put it in fancy words

### Constraint Files
- like the name, by putting these files, they give or set the rules one must follow to ensure a good healthy design which works without any issues
- this is very necessary if you want to produce something useable XD

every file will have comment so do not worry my friend you will get to know the reason of the chosen syntax :)

- - - 

### Content of Code Blocks

#### Basic Logic Gates (Combinational)
| Block | Status |
|--------|--------|
| NOT Gate | [x] |
| AND Gate | [x] |
| OR Gate | [x] |
| NAND Gate | [x] |
| NOR Gate | [x] |
| XOR Gate | [x] |
| XNOR Gate | [x] |

#### Basic Blocks (Combinational)
| Block | Status |
|--------|--------|
| Multiplexer | [x] |
| Decoder | [x] |
| Encoder | [x] |
| Priority Encoder | [x] |
| Comparator | [x] |

#### Arithmetic Units
| Block | Status |
|--------|--------|
| Half Adder | [x] |
| Full Adder | [x] |
| Ripple Carry Adder | [ ] |
| Carry Lookahead Adder | [ ] |
| Subtractor | [ ] |
| Multiplier | [ ] |
| Divider | [ ] |
| ALU (Arithmetic Logic Unit) | [ ] |

#### Sequential Logic (Memory Elements)
| Block | Status |
|--------|--------|
| SR Latch | [x] |
| D Latch | [ ] |
| D Flip-Flop | [ ] |
| T Flip-Flop | [ ] |
| JK Flip-Flop | [ ] |
| Register (N-bit) | [ ] |
| Shift Register | [ ] |
| Counter | [ ] |

#### Memory Units
| Block | Status |
|--------|--------|
| RAM | [ ] |
| FIFO Buffer | [ ] |
| Stack (LIFO) with Push/Pop | [ ] |

#### Control & Processing Units
| Block | Status |
|--------|--------|
| Finite State Machine | [ ] |
| Instruction Decoder | [ ] |
| Program Counter (PC) | [ ] |
| Simple RISC-V CPU (Single-cycle or Pipelined) | [ ] |

#### Advanced Blocks
| Block | Status |
|--------|--------|
| Barrel Shifter | [ ] |
| Booth Multiplier | [ ] |
| Wallace Tree Multiplier | [ ] |
| Floating-Point Unit (FPU) | [ ] |
| Cache Controller | [ ] |
