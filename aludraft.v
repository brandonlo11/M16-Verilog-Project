module alu(
    input [31:0] a, b,
    input [1:0] width,
    input saturate,
    output reg [31:0] c
);

wire d, e, f, g, h, i, j;
wire [3:0] carry = 4'b0000;
  wire [3:0] reverse = 4'b0000;
  
  add8 add1(.a([7:0]a), .b([7:0]b), .carry_in(reverse[0]), .c(d), .sign(e), .overflow(f), .carry_out(g));
  carry[0] = g;
  //control c1(.saturate(saturate), .width(width), .sign(e), .overflow(f), .carry out(carry), .carry in(g), .sat enable(), .sat sign(), .sat last());
  
  add8 add2(.a([15:8]a), .b([15:8]b), .carry_in(reverse[1]), .c(d), .sign(e), .overflow(f), .carry_out(g));
  carry[1] = g;
 // control c2(.saturate(saturate), .width(width), .sign(e), .overflow(f), .carry out(carry), .carry in(g), .sat enable(), .sat sign(), .sat last());
  
  add8 add3(.a([23:16]a), .b([23:16]b), .carry_in(reverse[2]), .c(d), .sign(e), .overflow(f), .carry_out(g);
  carry[2] = g;
 // control c3(.saturate(saturate), .width(width), .sign(e), .overflow(f), .carry out(carry), .carry in(g), .sat enable(), .sat sign(), .sat last());
            
            add8 add4(.a([31:24]a), .b([31:24]b), .carry_in(reverse[3]), .c(d), .sign(e), .overflow(f), .carry_out(g));
  carry[3] = g;
 // control c4(.saturate(saturate), .width(width), .sign(e), .overflow(f), .carry out(carry), .carry in(g), .sat enable(), .sat sign(), .sat last());

  control c1(.saturate(saturate), .width(width), .sign(e), .overflow(f), .carry out(carry), .carry in(reverse), .sat enable(), .sat sign(), .sat last());

  
  
endmodule



module alu(
  input [31:0] a, b,
  input saturate,
  input [1:0] width,
  output reg [31:0] c
);
  
  saturation sat1(.a(), .sat_enable(), .sat_sign(), .sat_last(), .out());
  add8 add1(.a(), .b(), .carry_in(), .c(), .sign(), .overflow(), .carry_out());
  
  
always @(*) begin
  
