







# <p align=center> Signed Sequential Multiplier </p>
### <p align=center> Youssef Elmahdy, Hussein Heggi, Ahmed Waseem, Ahmed Barbary
### <p align=center> Instructor: Mohamed Shalaan
### <p align=center> The American Univesity in Cairo 






 
## Introduction
<font size = "12">
Multiplication is a fundamental operation that is essential to many computing jobs in the world of digital arithmetic. A crucial strategy in circuit design for multiplying signed binary integers is the binary signed sequential multiplier. Signed multipliers use a sign bit to represent both positive and negative operands, in contrast to unsigned multipliers, which can only accept positive values. As a result, applications using signed arithmetic, such as digital signal processing, computer arithmetic, and error-correcting codes, require the binary signed sequential multiplier.
 
A binary signed sequential multiplier's main goal is to precisely and quickly calculate the product of two signed binary operands while considering their signatures. This multiplier uses a sequential processing mechanism to multiply bits one at a time while accounting for their locations and values to get the final output. Historically, techniques like Booth's algorithm have been used to create binary signed sequential multipliers. The Optimised Sequential Baugh-Wooley method, a modified version of the sequential multiplier, offers better effectiveness and performance. 
 
By lowering the quantity of partial products created during multiplication, the Optimised Sequential Baugh-Wooley algorithm improves on the conventional Baugh-Wooley method. This is accomplished by seeing and taking advantage of recurring patterns and symmetries in the multiplier and multiplicand. The approach reduces the computational complexity and resource use by effectively encoding and analysing these patterns, leading to a quicker and more effective multiplication. 
 
The multiplier outperforms conventional methods in terms of performance, power consumption, and hardware requirements by effectively using these components and the optimised algorithm. A binary signed sequential multiplier must be designed with efficiency and performance in mind. To fulfil the needs of contemporary digital systems, it is essential to strike a balance between speed, area utilisation, power consumption, and resource requirements. By using the Optimised Sequential Baugh-Wooley algorithm to speed up multiplication and enhance results overall, the Optimised Sequential Baugh-Wooley Multiplier provides an ideal solution for performance. In conclusion, the binary signed sequential multiplier is an essential method for designing circuits that multiple signed binary integers effectively. By lowering the amount of partial products and using patterns in the multiplier, the optimised version using the Optimised Sequential Baugh-Wooley algorithm improves efficiency and performance. 
 
The multiplier produces accurate and effective multiplication results while minimizing computing complexity and resource needs by using this optimized algorithm and making use of suitable circuit design approaches. The binary signed sequential multiplier plays a crucial role in contemporary digital systems due to the growing requirement for accurate and efficient signed multiplication. </font>

 ## Block Structure 
  <font size = "12">
   
   ![image](https://github.com/Ahmed-Waseem77/signed_sequential_multiplier/assets/98818805/3afbbd28-e068-4ae4-8fa3-d28803a01e61)
   
   
   ![image](https://github.com/Ahmed-Waseem77/signed_sequential_multiplier/assets/98818805/386bbb3f-fd97-45c7-bae6-cc326326f9b7)


   
  </font>
 
## Program design
 <font size = "12">
The program has been developed using 2 main subparts: The multiplier, and the display.

### Multiplier subpart:
  
  
  #### <em> multiplier_main </em>
  
 

The module is defined with inputs and outputs.
Inputs: clk (clock), BTNC (button C), multiplier (8-bit input representing the multiplier value), multiplicand (8-bit input representing the multiplicand value).
Outputs: f_product (16-bit output representing the product), LED0 (single-bit output for an LED).


Several wire signals are declared to facilitate internal connections within the module.
adderOut, mult_out, w_multiplier, and w_multiplicand are 8-bit wires used for intermediate calculations.
sel, load_w, shift_w, and sign are single-bit wires used for control signals.
product_temp is a 16-bit wire used to store the intermediate product.


zero_8bit is an 8-bit wire initialized to all zeros (representing the value 0).
zero_1bit is a single-bit wire initialized to 0.


Two instances of the two_comp module (multiplier_comp and multiplicand_comp) are instantiated to perform two's complement conversion on the multiplier and multiplicand inputs, respectively.
These modules invert the most significant bit (MSB) of each input and produce the corresponding two's complement output (w_multiplier and w_multiplicand).


The mux_2x1_8bit module (mux_sel) is instantiated to select between w_multiplicand and zero_8bit based on the value of the sel signal.
The output mult_out is determined by the selected input.


The adder_8bit module (alu) is instantiated to perform an 8-bit addition operation between product_temp[15:8] (the upper 8 bits of the intermediate product) and mult_out (the output of the multiplexer).
The output adderOut represents the result of the addition.
Product Register:

The prod_reg module (product_reg) is instantiated to handle the control signals and operations related to the intermediate product.
It receives the clock signal clk, the reset signal BTNC, and control signals load_w, shift_w, sel, and sign.
It also takes inputs adderOut (the output of the adder), w_multiplier (the two's complement of the multiplier), and produces the output product_temp representing the intermediate product.


The CU module (control_unit) is instantiated to control the overall operation of the multiplier.
It receives the clock signal clk, the button C signal BTNC, and various control signals and inputs.
The control unit handles operations such as loading and shifting the product, determining the signs of the multiplier and multiplicand, and producing the final product and LED output.
  
Overall, this Verilog code implements an 8-bit multiplier that performs signed multiplication using two's complement representation. It utilizes modules for two's complement conversion, multiplexing, addition, product register, and a control unit to coordinate the operations. (Ahmed Waseem & Ahmed Barbary)



### Display subpart:
  
  #### <em> Full_module </em>
  
The Full_module is the top-level module that represents the complete system for binary multiplication. It takes several inputs, including the multiplier (mult), multiplicand (mcand), clock (clk), start signal (PB_start), and scroll signal (PB_scroll). It also has two outputs: the product (out) and an LED signal (LED).
Inside the module, there is a wire declaration wire [15:0] f_product that represents the intermediate product of the multiplication operation. Additionally, there are wires rst and start that are initially set to 0.
The module instantiates two sub-modules: pb_detector S and main M1. The pb_detector module detects the rising edges of the start signal (PB_start) and generates a new signal (start). The main module coordinates the main operations of the binary multiplication process, using the clock signal (clk), start signal (start), multiplier (mult), multiplicand (mcand), and intermediate product (f_product). It also controls the LED output (LED0).

  #### <em> Display module </em>
  
The module instantiates a display module, display M2, which is responsible for displaying the final result. It takes inputs such as the product (f_product[14:0]), an indicator signal (f_product[15]), clock (clk), scroll signal (PB_scroll), and generates the final output (out) and a reset signal (rst).
The display module handles the display of the output. It takes several inputs, including the product (product), reset signal (rst), indicator signal (N), clock (clk), sign bits (signbits), scroll signal (PB_signal), and generates the final output (out).
Inside the module, there are wire declarations for newClock, debounceSig, bcd, and muxsel1. The newClock wire is generated by a clock_divider module that divides the main clock (clk) to provide a slower clock for display purposes. The debounceSig wire represents the debounced signals obtained from the push-button detector modules (pb_detector A1 and pb_detector B1) for scroll signal debouncing.
There are also register declarations for state and nextState, which represent the current state and the next state of the state machine. The module uses a case statement to implement the state machine logic. Based on the current state, the next state is determined by evaluating the debounceSig signal values. This state machine controls the behavior of the display.
  
Another wire, muxsel1, is assigned the value of state. It is used as a selection signal for the subsequent multiplexer operation.
A register muxout1[15:0] is declared to hold the output of the multiplexer. It is assigned different values based on the N signal and the state selected by muxsel1. The multiplexer selects different segments of the bcd wire, which represents the binary-coded decimal representation of the product, based on the state and the N signal. The selected segments are assigned to muxout1[11:0] and the appropriate control signals are assigned to muxout1[15:12].
The module also includes another wire, muxsel2[1:0], and a register binValue[3:0] to hold the count value obtained from the bin_counter module. The bin_counter module is responsible for counting the values of muxsel2 based on the newClock signal. This counter allows the selection of different segments of the muxout1 signal.

The module also instantiates a bcd_to_7seg module, w1, which takes the binValue as input and generates the corresponding seven-segment display output for the out[6:0] segments. The anode_active output determines which digit of the display is active, while the segments output represents the seven-segment display segments for the active digit.

Finally, the module includes an always block that assigns values to binValue based on the selected value of muxsel2. The muxsel2 signal determines which part of the muxout1 signal is assigned to binValue by using a case statement.
Overall, the display module coordinates the display of the output by implementing a state machine to control the behavior of the display based on the input signals. It utilizes multiplexers and a binary counter to select the appropriate segments of the binary-coded decimal representation and generate the corresponding seven-segment display output.
(Youssef Elmahdy & Hussein Heggi)  
  </font>
## Problem Reporting
 <font size = "12">
  
 -Lack of Clear Signal Naming:
 The signal names used in the code are not self-explanatory, making it difficult to understand their intended purpose and behavior. Clear and descriptive signal names are essential for code readability and maintainability.
  
  
 -Lack of Proper Comments:
The code lacks comments to explain the purpose and functionality of individual modules, signals, and operations. Comments play a crucial role in code understanding, especially for complex designs. 
  
 -Possible Optimzations:
  We can improve upon the design by 'rolling' the Baugh Wooley algorithim into a sequential circuit, this can decrease LUT utilisation on the FPGA by eliminating the needs of twos complementors. The design below along with the datapath is a possible design for this implementation of the algorithim. We can see that the algorithim carries out the n - 1 additions of the Baugh Wooley algorithim on the product register then shift it to add the other partial products until the nth Baugh Wooley term in which we invert all bits except the last bit. We then add the Baugh Wooley carries at the end.
  
  ![image](https://github.com/Ahmed-Waseem77/signed_sequential_multiplier/assets/98818805/c4d53770-968d-4928-bc5e-0fa677da992c)
  
  
  ![image](https://github.com/Ahmed-Waseem77/signed_sequential_multiplier/assets/98818805/9956ab58-e943-44a0-8b10-9cc0dac43e7c)


  
 </font>

## Validation Activities
 <font size = "12">
  
  -Used Simulation:
By Creating testbenches to simulate the behavior of the design and verify its correctness. we also defined test cases that cover different scenarios and test all possible input combinations to ensure that the design functions as expected.
  
  
  -Used FPGA for confirmation:
  We Implemented the design on the basys 3, following the synthesis and place-and-route steps. Verify that the design operates correctly on the FPGA, using various test-cases including edge cases.
  
 </font>   
 
## Conclusion
 <font size = "12">
The optimised Baugh-Wooley sequential multiplier offers improved efficiency and performance in the multiplication of binary values, which is an important development in the field of digital arithmetic. This multiplier lowers the amount of incomplete products produced during the multiplication process by utilising the principles of pattern recognition and meticulous encoding, leading to quicker computation and better resource utilisation. The main goal of the optimised Baugh-Wooley sequential multiplier is to find and take use of symmetries and patterns that exist in both the multiplier and multiplicand.
  
The multiplier can speed up the production of partial products by carefully analysing and encoding these patterns, cutting down on pointless operations and improving how certain bit sequences are handled. In order to implement the optimised Baugh-Wooley sequential multiplier, multiplexers, adders, registers, and control circuitry are combined. The control logic is essential in coordinating the sequential execution of the algorithm, guaranteeing the appropriate input selection for multiplexers, setting up the adders and registers, and managing the order of operations. 
  
The optimised multiplier enhances performance, minimises power consumption, and reduces hardware complexity by effectively coordinating various components. In addition to being computationally efficient, the optimised Baugh-Wooley sequential multiplier has other advantages. Applications requiring high-speed arithmetic operations benefit from the reduction in the number of partial products since quicker multiplication results. 
  
In addition, less complicated hardware means less power and resource usage, which results in designs that are both more economical and energy-efficient. Digital signal processing, computer arithmetic, and error correction are just a few of the areas where the optimised Baugh-Wooley sequential multiplier is used. It is crucial for jobs involving signed arithmetic since it can multiply binary integers reliably and effectively while accounting for both positive and negative values. 
  
Future improvements are possible with the optimised Baugh-Wooley sequential multiplier. Further study and development in this field may result in even more effective encoding techniques, lowering the amount of incomplete products and enhancing performance. Additionally, improvements in semiconductor technology may make it possible to incorporate the optimised multiplier into bigger systems, which would progress digital circuits and architectures as a whole. 
  
The optimised Baugh-Wooley sequential multiplier, in comparison to earlier methods of binary multiplication, represents a considerable advancement. It simplifies the multiplication process, lowering the number of partial products and enhancing computing efficiency through pattern detection and intelligent encoding. The optimised multiplier is a useful tool in contemporary digital systems and contributes to the ongoing development of digital arithmetic thanks to its improved performance, decreased power consumption, and minimised hardware complexity.

 </font>

