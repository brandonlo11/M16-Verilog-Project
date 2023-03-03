# M16-Verilog-Project

In this project, I implemented the arithmetic logic unit (ALU) of a simple processor capable of performing any of the following arithmetic operations:  
– one signed 32-bit wrapping addition  
– two parallel signed 16-bit wrapping additions  
– four parallel signed 8-bit wrapping additions    
– one signed 32-bit saturating addition  
– two parallel signed 16-bit saturating additions  
– four parallel signed 8-bit saturating additions

My ALU is implemented in a Verilog module called alu, in a file called alu.v. The module must has the following ports:  
– a : the first 32-bit operand  
– b : the second 32-bit operand  
– saturate : a boolean signal that is high when saturating addition is requested  
– width : a 2-bit signal that is 0 when 8-bit mode is requested, 1 when 16-bit mode is requested, and 2 when 32-bit mode is requested  
– c : the 32-bit result

My alu module is implemented using three submodules: add8, saturation, and control. The add8 module is used to perform 8-bit wrapping additions, and to detect overflow conditions. The saturation module is used to optionally saturate the resulting 8-bit values. Lastly, the control module is used to generate the proper control signals for the requested operation. 

Therefore, my alu module has the following structure:

<img width="869" alt="Screen Shot 2023-03-03 at 3 29 42 PM" src="https://user-images.githubusercontent.com/103808636/222854962-a4a32db6-0fa3-48c6-9a16-bf4b2b01500a.png">
