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
    carry_in[3] = carry_out[2];  
    carry_in[2] = carry_out[1];
    carry_in[1] = carry_out[0];
    carry_in[0] = 1'b0;
    
    
    
  end
  
  if (width == 2'b01) begin
	carry_in[3] = carry_out[2];  
    carry_in[2] = 1'b0;
    carry_in[1] = carry_out[0];
    carry_in[0] = 1'b0;
  end
  
  if (width == 2'b00) begin
    carry_in = 4'b0000;
  end
  
end
