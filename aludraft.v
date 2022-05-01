module alu(
    input [31:0] a, b,
    input [1:0] width,
    input saturate,
    output reg [31:0] c
);

  wire [3:0] carry_out;
  wire [3:0] carry_in;
  wire [3:0] sign;
  wire [3:0] overflow;
  wire [3:0] sat_enable;
  wire [3:0] sat_sign;
  wire [3:0] sat_last;
  wire [31:0] d;
  wire [31:0] e;
  wire [3:0]
  
  add8 add1(.a([7:0]a), .b([7:0]b), .carry_in(carry_in[0]), .c([7:0]d), .sign(sign[0]), .overflow(overflow[0]), .carry_out(carry_out[0]));
  
  add8 add2(.a([15:8]a), .b([15:8]b), .carry_in(carry_in[1]), .c([15:8]d), .sign(sign[1]), .overflow(overflow[1]), .carry_out(carry_out[1]));
  
  add8 add3(.a([23:16]a), .b([23:16]b), .carry_in(carry_in[2]), .c([23:16]d), .sign(sign[2]), .overflow(overflow[2]), .carry_out(carry_out[2]);
            
  add8 add4(.a([31:24]a), .b([31:24]b), .carry_in(carry_in[3]), .c([31:24]d), .sign(sign[3]), .overflow(overflow[3]), .carry_out(carry_out[3]));

  control c1(.saturate(saturate), .width(width), .sign(sign), .overflow(overflow), .carry_out(carry_out), .carry_in(carry_in), .sat_enable(sat_enable), .sat_sign(sat_sign), .sat_last(sat_last));
            
saturation sat1(.a([7:0]d), .sat_enable(sat_enable[0]), .sat_sign(sat_sign[0]), .sat_last(sat_last[0]), .out([7:0]e));
            
saturation sat1(.a([15:8]d), .sat_enable(sat_enable[1]), .sat_sign(sat_sign[1]), .sat_last(sat_last[1]), .out([15:8]e));
            
saturation sat1(.a([23:16]d), .sat_enable(sat_enable[2]), .sat_sign(sat_sign[2]), .sat_last(sat_last[2]), .out([23:16]e));
  
saturation sat1(.a([31:24]d), .sat_enable(sat_enable[3]), .sat_sign(sat_sign[3]), .sat_last(sat_last[3]), .out([31:24]e));
            
endmodule
