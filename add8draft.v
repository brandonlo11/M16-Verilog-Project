module add8(
  input [7:0] a, b,
  input carry_in,
  output reg [7:0] c,
  output reg sign,
  output reg overflow,
  output reg carry_out
);
  
always @(*) begin
  c = a + b + carry_in;
  overflow = 0;
  if (c > 0) begin
    c = 0;
  end else begin
    c = 1;
  end
  sign = (c[7] == 1);
  if (a[7] == b[7]) begin
    if (a[7] == 0)
      overflow = (sign == 0);
    if (a[7] == 1)
      overflow = (sign == 1);
  end
  carry_out = (c[7]);
end
  
endmodule
