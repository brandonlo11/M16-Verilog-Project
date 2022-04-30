module saturation(
  input [7:0] a,
  input sat_enable,
  input sat_sign,
  input sat_last,
  output reg [7:0] out
);
  
always @(*) begin
  out = 8'b00000000;
  if (!sat_enable) begin
    out = a;
  end else if (sat_enable && !sat_sign && !sat_last) begin
    out = 8'b11111111;
  end else if (sat_enable && sat_sign && !sat_last) begin
    out = 8'b00000000;
  end else if (sat_enable && !sat_sign && sat_last) begin
    out = 8'b01111111;
  end else if (sat_enable && sat_sign && sat_last) begin
    out = 8'b10000000;
  end
end
  
  
  
  
endmodule
