## Behind the Code 
- #### Timescale
  - Have you ever seen the top line of the vivado code which says time something something? well here is what it does :
  - this is what we usually see when we open it to a sv file : `timescale 1ns / 1ps
  - its basically telling us what unit of time we're using for the 1) delays and 2) the precison of the time -> that is the smallest amount of time that can be used for seeing any change in the boolean expression
  - this affects the performance and simulation accuracy -> you want a fast and good working circuit and to ensure that your delays should be low and it should be accurate 
