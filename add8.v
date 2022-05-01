module add8(
  input [7:0] a, b,
  input carry_in,
  output [7:0] c,
  output reg sign,
  output reg overflow,
  output carry_out
);
  
wire [8:0] tmp = a + b + carry_in;

assign c = tmp[7:0];
assign carry_out = tmp[8];
  
always @(*) begin
  overflow = 0;
  sign = (c[7] == 1);
  if (a[7] == b[7]) begin
    if (a[7] == 0)
      overflow = (sign == 0);
    if (a[7] == 1)
      overflow = (sign == 1);
  end
end
  
endmodule
