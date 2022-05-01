module control(
  input saturate,
  input [1:0] width,
  input [3:0] sign,
  input [3:0] overflow,
  input [3:0] carry_out,
  output reg [3:0] carry_in,
  output reg [3:0] sat_enable,
  output reg [3:0] sat_sign,
  output reg [3:0] sat_last
);
  
always @(*) begin
  if (width == 2'b10) begin
    if ((carry_out == 4'b0000) && (overflow[0] == 1))
      carry_in = 4'b1001;
    if ((carry_out == 4'b0000) && (overflow[0] == 0))
      carry_in = 4'b0001;
    if (((carry_out == 4'b1001)|(carry_out == 4'b0001)) && (overflow[0] == 1))
      carry_in = 4'b1011;
    if (((carry_out == 4'b1001)|(carry_out == 4'b0001)) && (overflow[0] == 0))
      carry_in = 4'b0011;
    if (((carry_out == 4'b1011)|(carry_out == 4'b0011)) && (overflow[0] == 1))
      carry_in = 4'b1111;
    if (((carry_out == 4'b1011)|(carry_out == 4'b0011)) && (overflow[0] == 1))
      carry_in = 4'b1111;
    if (((carry_out == 4'b1011)|(carry_out == 4'b0011)) && (overflow[0] == 0))
      carry_in = 4'b0111;
  end
  
  if (width == 2'b01) begin
    if ((carry_out == 4'b0000) && (overflow[0] == 1))
      carry_in = 4'b1001;
    if ((carry_out == 4'b0000) && (overflow[0] == 0))
      carry_in = 4'b0001;
    if ((carry_out == 4'b1001)|(carry_out == 4'b0001))
      carry_in = 4'b0011;
    if (((carry_out == 4'b1011)|(carry_out == 4'b0011)) && (overflow[0] == 1))
      carry_in = 4'b1111;
    if (((carry_out == 4'b1011)|(carry_out == 4'b0011)) && (overflow[0] == 0))
      carry_in = 4'b0111;
  end
  
  if (width == 2'b00) begin
    carry_in = 0000;
  end
  
end
  
