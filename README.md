







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
   



   
  </font>
  
Optimzations:
  We improve upon the design by 'rolling' the Baugh Wooley algorithim into a sequential circuit, this can decrease LUT utilisation on the FPGA by eliminating the needs of twos complementors. The design below along with the datapath is a possible design for this implementation of the algorithim. We can see that the algorithim carries out the n - 1 additions of the Baugh Wooley algorithim on the product register then shift it to add the other partial products until the nth Baugh Wooley term in which we invert all bits except the last bit. We then add the Baugh Wooley carries at the end.
  
  ![image](https://github.com/Ahmed-Waseem77/signed_sequential_multiplier/assets/98818805/c4d53770-968d-4928-bc5e-0fa677da992c)
  
  
  ![image](https://github.com/Ahmed-Waseem77/signed_sequential_multiplier/assets/98818805/9956ab58-e943-44a0-8b10-9cc0dac43e7c)


 </font>

## Validation Activities
 <font size = "12">
  
  -Used Simulation:
By Creating testbenches to simulate the behavior of the design and verify its correctness.
we defind various testcases, normal testcases, and edge cases. which yeilded correct results.
  
  
  -FPGA:
FPGA output yeilds unexpected results, awaiting troubleshooting.
  
 </font>   
