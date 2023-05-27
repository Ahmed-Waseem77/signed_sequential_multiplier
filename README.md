







# <p align=center> Signed Optimized Sequential Multiplier </p>
### <p align=center> Youssef Elmahdy, Hussein Heggi, Ahmed Waseem, Ahmed Elberbary
### <p align=center> Instructor: Mohamed Shalaan
### <p align=center> The American Univesity in Cairo 






 
## Introduction
<font size = "12">
Multiplicative operations play a pivotal role in various domains, such as arithmetic computations and signal processing techniques, particularly within the scope of digital circuit design. The swift progression of technology has prompted an escalating need for multiplication techniques that can provide maximum efficiency concerning velocity, energy effectiveness, and spatial exploitation. The Sequential Optimized Multiplier (SOM) has received considerable attention as a viable method to balance crucial performance metrics harmoniously.


The following report thoroughly examines the Sequential Optimized Multiplier, elucidating its fundamental principles, merits, and drawbacks. Moreover, our analysis will thoroughly investigate the various design methodologies and optimizations implemented to ameliorate the operational efficacy of the Sequential Optimized Multiplier  (SOM). Upon completing this investigation, the readers shall comprehensively comprehend this significant constituent in contemporary digital frameworks and apprehend its possible consequences for system configuration.

The attainment of an efficient means of multiplication is a paramount necessity in several applications, namely digital signal processing, encryption, and image processing. Although conventional multiplication techniques, such as the array multiplier or Booth's algorithm, can produce precise outcomes, they are often limited by their area and power consumption. As a result, scholars and professionals have explored diverse methodologies for achieving optimum equilibrium in performance metrics.

The Sequential Optimized Multiplier, commonly called the Sequential Multiplier, is a multiplication approach that achieves efficiency optimization through a combination of sequential and parallel processing techniques. In contrast to conventional multiplier designs, the Sequential Optimized Multiplier  (SOM) algorithm bifurcates the multiplication process into two discrete phases. By segmenting the multiplication process into sequential units, the latency of the critical path is reduced, resulting in a considerable improvement in the overall speed. Consequently, performance is enhanced.

The Sequential Optimized Multiplier  (SOM) primarily utilizes a divide-and-conquer strategy. To enhance operational efficiency, the input operands are partitioned into smaller sub-operations that can be easily processed. Consequently, these sub-operations are executed sequentially. Each sub-operation is responsible for generating and accumulating a specific component of the overall result, thereby ensuring precise and reliable execution of the entire multiplication process. By partitioning the undertaking into successive stages, the Sequential Optimized Multiplier  (SOM) substantially lessens the duration of the critical path, resulting in expedited multiplication processes.
</font>

 ## Block Structure 
  <font size = "12">
   
   ![image](https://github.com/Ahmed-Waseem77/signed_sequential_multiplier/assets/98818805/c507c35e-1e29-4c54-ac70-8f3b20b5cd12)
   
   
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
	
	
## Implementation Instructions
 <font size = "12">
	 
	 
1- Create a project file on ViVado
	 
2- Pull the Repository to your local machine
	 
3- Add directory to Vivado source files
	 
4- Add the constraint files
	 
5- Synthesize, Implement, generate Bit-stream, and program your basys 3 board.
	 
 </font>

 
## Conclusion
 <font size = "12">
The Sequential Optimised Multiplier (SOM), a promising technique that balances critical performance criteria, is used in digital circuit design. The SOM reduces necessary route time and boosts overall performance by splitting the multiplication activity into two distinct stages utilizing sequential and parallel processing techniques. The SOM uses the divide-and-conquer method to efficiently handle input operands in sequential sub-operations, leading to accurate multiplication execution.
	
Compared to conventional multiplier architectures, the SOM offers improved speed performance, operand size flexibility, reduced power consumption, and optimal space use. The SOM is a crucial component in digital circuit design since it can dramatically increase the efficiency and functionality of modern digital systems.
	
In contrast to conventional multiplier architectures, the Sequential Optimized Multiplier presents several noteworthy advantages. Due to the decrease in critical path delay attained through sequential processing, it offers enhanced speed capabilities. The Sequential Optimized Multiplier  (SOM) is equipped with operand size adaptability, rendering it apt for diverse use cases. Moreover, this multiplier exhibits decreased power consumption compared to specific conventional ones, thereby facilitating the progression of designs prioritizing energy efficiency. Ultimately, the Sequential Optimized Multiplier (SOM) optimizes the utilization of available space, thus fostering a seamless integration with other concomitant systems.

Conclusively, efficacious multiplication procedures are crucial in the design of digital circuits, exhibiting wide-ranging utilization in diverse fields, namely arithmetic calculations and signal manipulation. Given the ever-evolving nature of technology, there is a heightened need for multiplication methodologies that surpass conventional strategies in terms of velocity, energy efficacy, and space utilization.
 </font>

