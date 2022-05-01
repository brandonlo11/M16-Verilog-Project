module alu(
    input [31:0] a, b,
    input [1:0] width,
    input saturate,
    output [31:0] c
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
  
  add8 add1(.a(a[7:0]), .b(b[7:0]), .carry_in(carry_in[0]), .c(d[7:0]), .sign(sign[0]), .overflow(overflow[0]), .carry_out(carry_out[0]));
  
  add8 add2(.a(a[15:8]), .b(b[15:8]), .carry_in(carry_in[1]), .c(d[15:8]), .sign(sign[1]), .overflow(overflow[1]), .carry_out(carry_out[1]));
  
  add8 add3(.a(a[23:16]), .b(b[23:16]), .carry_in(carry_in[2]), .c(d[23:16]), .sign(sign[2]), .overflow(overflow[2]), .carry_out(carry_out[2]));
            
  add8 add4(.a(a[31:24]), .b(b[31:24]), .carry_in(carry_in[3]), .c(d[31:24]), .sign(sign[3]), .overflow(overflow[3]), .carry_out(carry_out[3]));

  control c1(.saturate(saturate), .width(width), .sign(sign), .overflow(overflow), .carry_out(carry_out), .carry_in(carry_in), .sat_enable(sat_enable), .sat_sign(sat_sign), .sat_last(sat_last));
            
  saturation sat1(.a(d[7:0]), .sat_enable(sat_enable[0]), .sat_sign(sat_sign[0]), .sat_last(sat_last[0]), .out(c[7:0]));
            
  saturation sat2(.a(d[15:8]), .sat_enable(sat_enable[1]), .sat_sign(sat_sign[1]), .sat_last(sat_last[1]), .out(c[15:8]));
            
  saturation sat3(.a(d[23:16]), .sat_enable(sat_enable[2]), .sat_sign(sat_sign[2]), .sat_last(sat_last[2]), .out(c[23:16]));
  
  saturation sat4(.a(d[31:24]), .sat_enable(sat_enable[3]), .sat_sign(sat_sign[3]), .sat_last(sat_last[3]), .out(c[31:24]));
  
            
endmodule
