// Code your testbench here
// or browse Examples


`timescale 1ns/1ns

module alu_tb;

//saturate is 0, width is 2, and the 32-bit addition overflows
in1 = 1'b0;
in2 = 2'b10;
in3 = 32'b01111111111111111111111111111111;
in4 = 32'b00000000000000000000000000000001;
#1;
  if (out1 != 32'b10000000000000000000000000000000) begin 
$display(“wrong output!”);
end

  
//saturate is 1, width is 2, and the 32-bit addition saturates
in1 = 1'b1;
in2 = 2'b10;
in3 = 32'b01111111111111111111111111111111;
in4 = 32'b00000000000000000000000000000001;
#1;
  if (out1 != 32'b01111111111111111111111111111111) begin 
$display(“wrong output!”);
end


//saturate is 0, width is 1, and at least one of the two 16-bit additions overflows
in1 = 1'b0;
in2 = 2'b01;
in3 = 32'b0000000000000000_1111111111111111;
in4 = 32'b0100000000000000_0000000000000001;
#1;
  if (out1 != 32'b10000000000000000000000000000000) begin
$display(“wrong output!”);
end
  
  
//saturate is 1, width is 1, and at least one of the two 16-bit additions saturates
in1 = 1'b1;
in2 = 2'b01;
in3 = 32'b0100000000000000_0000000000000001;
in4 = 32'b0000000000000000_0111111111111111;
#1;
  if (out1 != 32'b0100000000000000_011111111111111) begin 
$display(“wrong output!”);
end

  
//saturate is 0, width is 1, and at least one of the four 8-bit additions overflows
in1 = 1'b0;
in2 = 2'b01;
in3 = 32'b01000000_00000000_00000000_11111111;
in4 = 32'b00000000_00000000_00000000_00000001;
#1;
  if (out1 != 8'b01000000_00000000_00000000_00000000) begin 
$display(“wrong output!”);
end

  
//saturate is 1, width is 1, and at least one of the four 8-bit additions saturates
in1 = 1'b1;
in2 = 2'b01;
in3 = 32'b01000000_00000000_00000000_01111111;
in4 = 32'b00000000_00000000_00000000_00000001;
#1;
  if (out1 != 8'b01000000_00000000_00000000_01111111) begin 
$display(“wrong output!”);
end
  
endmodule
