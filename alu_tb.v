// Code your testbench here
// or browse Examples


`timescale 1ns/1ns

module alu_tb;
  
  reg in1; 
  reg [1:0] in2;
  reg [31:0]in3, in4;
  wire [31:0] out1;
  
  alu tested(.a(in3), .b(in4), .width(in2), .saturate(in1), .c(out1));

  initial begin
//saturate is 0, width is 2, and the 32-bit addition overflows
in1 = 1'b0;
in2 = 2'b10;
in3 = 32'b01111111111111111111111111111111;
in4 = 32'b00000000000000000000000000000001;
#1;
    if (out1 != 32'b10000000000000000000000000000000)
      $display("wrong output!1");

  
//saturate is 1, width is 2, and the 32-bit addition saturates
in1 = 1'b1;
in2 = 2'b10;
in3 = 32'b01111111111111111111111111111111;
in4 = 32'b00000000000000000000000000000001;
#1;
  if (out1 != 32'b01111111111111111111111111111111)
    $display("wrong output!2 + %b", out1);


//saturate is 0, width is 1, and at least one of the two 16-bit additions overflows
in1 = 1'b0;
in2 = 2'b01;
in3 = 32'b0000000000000000_1111111111111111;
in4 = 32'b0100000000000000_0000000000000001;
#1;
    if (out1 != 32'b0100000000000000_0000000000000000)
      $display("wrong output!3");
  
  
//saturate is 1, width is 1, and at least one of the two 16-bit additions saturates
in1 = 1'b1;
in2 = 2'b01;
in3 = 32'b0100000000000000_0000000000000001;
in4 = 32'b0000000000000000_0111111111111111;
#1;
  if (out1 != 32'b0100000000000000_0111111111111111) 
    $display("wrong output!4 + %b", out1);

  
//saturate is 0, width is 0, and at least one of the four 8-bit additions overflows
in1 = 1'b0;
in2 = 2'b00;
in3 = 32'b01000000_00000000_00000000_11111111;
in4 = 32'b00000000_00000000_00000000_00000001;
#1;
    if (out1 != 32'b01000000_00000000_00000000_00000000) 
      $display("wrong output!5 + %b", out1);

  
//saturate is 1, width is 0, and at least one of the four 8-bit additions saturates
in1 = 1'b1;
in2 = 2'b00;
in3 = 32'b01000000_00000000_00000000_01111111;
in4 = 32'b00000000_00000000_00000000_00000001;
#1;
    if (out1 != 32'b01000000_00000000_00000000_01111111)
      $display("wrong output!6");
  
  end
    
endmodule
