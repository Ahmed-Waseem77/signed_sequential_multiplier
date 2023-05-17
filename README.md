







# <p align=center> Signed Sequential Multiplier </p>
### <p align=center> Youssef Elmahd, Hussein Heggi, Ahmed Wassem, Ahmed Barbary
### <p align=center> Instructor: Mohamed Shalaan
### <p align=center> The American Univesity in Cairo 






 
## Introduction
<font size = "12">
Multiplication is a fundamental operation that is essential to many computing jobs in the world of digital arithmetic. A crucial strategy in circuit design for multiplying signed binary integers is the binary signed sequential multiplier. Signed multipliers use a sign bit to represent both positive and negative operands, in contrast to unsigned multipliers, which can only accept positive values. As a result, applications using signed arithmetic, such as digital signal processing, computer arithmetic, and error-correcting codes, require the binary signed sequential multiplier. 
A binary signed sequential multiplier's main goal is to precisely and quickly calculate the product of two signed binary operands while considering their signatures. This multiplier uses a sequential processing mechanism to multiply bits one at a time while accounting for their locations and values to get the final output. Historically, techniques like Booth's algorithm have been used to create binary signed sequential multipliers. The Optimised Sequential Baugh-Wooley method, a modified version of the sequential multiplier, offers better effectiveness and performance. 
By lowering the quantity of partial products created during multiplication, the Optimised Sequential Baugh-Wooley algorithm improves on the conventional Baugh-Wooley method. This is accomplished by seeing and taking advantage of recurring patterns and symmetries in the multiplier and multiplicand. The approach reduces the computational complexity and resource use by effectively encoding and analysing these patterns, leading to a quicker and more effective multiplication. 
The multiplier outperforms conventional methods in terms of performance, power consumption, and hardware requirements by effectively using these components and the optimised algorithm. A binary signed sequential multiplier must be designed with efficiency and performance in mind. To fulfil the needs of contemporary digital systems, it is essential to strike a balance between speed, area utilisation, power consumption, and resource requirements. By using the Optimised Sequential Baugh-Wooley algorithm to speed up multiplication and enhance results overall, the Optimised Sequential Baugh-Wooley Multiplier provides an ideal solution for performance. In conclusion, the binary signed sequential multiplier is an essential method for designing circuits that multiple signed binary integers effectively. By lowering the amount of partial products and using patterns in the multiplier, the optimised version using the Optimised Sequential Baugh-Wooley algorithm improves efficiency and performance. 
The multiplier produces accurate and effective multiplication results while minimizing computing complexity and resource needs by using this optimized algorithm and making use of suitable circuit design approaches. The binary signed sequential multiplier plays a crucial role in contemporary digital systems due to the growing requirement for accurate and efficient signed multiplication.
 </font>
## Algorithm 
  <font size = "12">
  </font>
## Program design
 <font size = "12">
The program has been developed using 2 main subparts: The multiplier, and the display.
Multiplier subpart:





Display subpart:
Full_module
The Full_module is the top-level module that represents the complete system for binary multiplication. It takes several inputs, including the multiplier (mult), multiplicand (mcand), clock (clk), start signal (PB_start), and scroll signal (PB_scroll). It also has two outputs: the product (out) and an LED signal (LED).
Inside the module, there is a wire declaration wire [15:0] f_product that represents the intermediate product of the multiplication operation. Additionally, there are wires rst and start that are initially set to 0.
The module instantiates two sub-modules: pb_detector S and main M1. The pb_detector module detects the rising edges of the start signal (PB_start) and generates a new signal (start). The main module coordinates the main operations of the binary multiplication process, using the clock signal (clk), start signal (start), multiplier (mult), multiplicand (mcand), and intermediate product (f_product). It also controls the LED output (LED0).

Display module
Lastly, the module instantiates a display module, display M2, which is responsible for displaying the final result. It takes inputs such as the product (f_product[14:0]), an indicator signal (f_product[15]), clock (clk), scroll signal (PB_scroll), and generates the final output (out) and a reset signal (rst).
The display module handles the display of the output. It takes several inputs, including the product (product), reset signal (rst), indicator signal (N), clock (clk), sign bits (signbits), scroll signal (PB_signal), and generates the final output (out).
Inside the module, there are wire declarations for newClock, debounceSig, bcd, and muxsel1. The newClock wire is generated by a clock_divider module that divides the main clock (clk) to provide a slower clock for display purposes. The debounceSig wire represents the debounced signals obtained from the push-button detector modules (pb_detector A1 and pb_detector B1) for scroll signal debouncing.
There are also register declarations for state and nextState, which represent the current state and the next state of the state machine. The module uses a case statement to implement the state machine logic. Based on the current state, the next state is determined by evaluating the debounceSig signal values. This state machine controls the behavior of the display.
Another wire, muxsel1, is assigned the value of state. It is used as a selection signal for the subsequent multiplexer operation.
A register muxout1[15:0] is declared to hold the output of the multiplexer. It is assigned different values based on the N signal and the state selected by muxsel1. The multiplexer selects different segments of the bcd wire, which represents the binary-coded decimal representation of the product, based on the state and the N signal. The selected segments are assigned to muxout1[11:0] and the appropriate control signals are assigned to muxout1[15:12].
The module also includes another wire, muxsel2[1:0], and a register binValue[3:0] to hold the count value obtained from the bin_counter module. The bin_counter module is responsible for counting the values of muxsel2 based on the newClock signal. This counter allows the selection of different segments of the muxout1 signal.

The module also instantiates a bcd_to_7seg module, w1, which takes the binValue as input and generates the corresponding seven-segment display output for the out[6:0] segments. The anode_active output determines which digit of the display is active, while the segments output represents the seven-segment display segments for the active digit.

Finally, the module includes an always block that assigns values to binValue based on the selected value of muxsel2. The muxsel2 signal determines which part of the muxout1 signal is assigned to binValue by using a case statement.
Overall, the display module coordinates the display of the output by implementing a state machine to control the behavior of the display based on the input signals. It utilizes multiplexers and a binary counter to select the appropriate segments of the binary-coded decimal representation and generate the corresponding seven-segment display output.
  </font>
## Problem Reporting
 <font size = "12">
-The main issue with the program is its complexity. It takes up a large space in the memory due to the large number of nested loops in the program and the maximum number of variables the program can handle ,which is ten variables. This can lead to huge truth tables which is very costly in terms of memory and time

-The naming convention of variables is not consistent throughout the code, which can lead to confusion. This is due to the fact that two people wrote the code so Inconsistency was bound to happen and also due to the lack of time that we can’t change them. 

-The code does not handle exceptions, which can cause the program to terminate abruptly. This is also due to the lack of time to enhance the program.

-There may exist code redundancy, where the same code is executed multiple times for different inputs. This is due to the fact that two people wrote the code.

-There is no destructor in the code, which can lead to memory leaks if the object of the class is dynamically allocated.

-Another problem with the program is that it can't handle the expression if it isnot in alphabetical order. To clarify, a problem can handle "ac + b" but can't handle "ca + b".
 </font>

## Program Build
 <font size = "12">
After the user opens the Git-Hub repo he will download both the .h and .cpp QM files in addition to the main. The user then runs it in a c++ compiler. The program is user friendly, when you run the program you have two options either to perform a Quine-McCluskey operation or to exit the program if you press the first option a new menu appears with three options the first of which is to choose one of the ten hard-coded examples to perform the operation on. We tried to make each example as unique as possible to further test our program, but if the user isn’t satisfied there’s always the option to input your example with the desired number of variables but in a correct SoP form and in an alphabetical order starting from the first literal as shown in the problems’ section. A remark to ensure the most experience from the program when manually entering your example please end your example with a “$” sign . In this menu there also exists an exit option just like the previous menu. After you choose your desired option the program prints the truth table of the function with both SoP and PoS in their canonical form. Moreover, the program displays the prime implicants of the function with the minterms that each prime implicant covers in addition to the essential prime implicants showing which minterms are covered by them and which are not. The program then asks the user either to make another operation in the same way simply by pressing any key except “e”. By pressing “e”, this will take the user back to the previous menu to choose a new way to test the program or to simply exit. The program will always keep running unless you exit from the main menu. </font>   
 
## Conclusion
 <font size = "12">
The Quine-McCluskey algorithm is an effective instrument for minimizing boolean functions. This algorithm is particularly helpful for condensing big boolean expressions that would take a long time and effort to do so manually. In order to create expressions that are logically equivalent to the original expressions, the algorithm first compares groups of binary numbers to find common patterns. It then combines these patterns. The Quine-McCluskey algorithm's guarantee of locating the smallest sum-of-products expression is one of its primary benefits. This means that, in terms of the number of terms and the number of literals, the algorithm's output will always be the simplest and most effective representation of the original boolean statement. Scalability is another benefit of the Quine-McCluskey method. It is appropriate for use in complicated digital circuit design and other boolean algebraic applications because it can handle boolean expressions with a lot of variables and terms. The Quine-McCluskey method has some drawbacks despite its benefits. One drawback is that, particularly for expressions with a lot of variables, it can be computationally costly. This can be reduced by utilizing cutting-edge software and hardware optimization methods, but it is still difficult. Another drawback is that the algorithm does not account for the physical restrictions and limitations of the hardware that will be used to execute the boolean expression. Because of this, even though the minimized expression may be ideal in terms of its logical structure, it might not be the most effective or economical application from a hardware standpoint. The Quine-McCluskey algorithm is a useful instrument for reducing the complexity of boolean expressions, but it should be used in conjunction with other design factors and optimization strategies. It can help simplify digital circuits and boost their performance, but it's essential to take into account the constraints and trade-offs that come with actually putting this algorithm to use. Engineers and designers can choose when and how to use the Quine-McCluskey algorithm in their creations by being aware of its advantages and disadvantages. </font>

