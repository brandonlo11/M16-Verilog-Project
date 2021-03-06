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
  
  reg [3:0] i;
  
always @(*) begin
  
  sat_sign = sign;
  sat_last = 4'b1111;
  sat_enable = 4'b0000;
  carry_in = 4'b0000;
  
  if (width == 2'b10) begin
    carry_in[3] = carry_out[2];  
    carry_in[2] = carry_out[1];
    carry_in[1] = carry_out[0];
    carry_in[0] = 1'b0;
    
    sat_last = 4'b1000;
    
    if (overflow[3] && saturate)begin
      sat_enable = 4'b1111;
    end
    
    if(overflow[3]) begin
      if(!sign[3]) begin
        sat_sign = 4'b1111;
      end else begin
        sat_sign = 4'b0000;
      end
    end
    
  end
  
  if (width == 2'b01) begin
	carry_in[3] = carry_out[2];  
    carry_in[2] = 1'b0;
    carry_in[1] = carry_out[0];
    carry_in[0] = 1'b0;
    
    sat_last = 4'b1010;
    
    if (overflow[3] && saturate) begin
      sat_enable[3] = 1;
      sat_enable[2] = 1;
    end
    
    if (overflow[1] && saturate) begin
      sat_enable[1] = 1;
      sat_enable[0] = 1;
    end
    
    if(overflow[3]) begin 
      if(!sign[3]) begin
        sat_sign[3] = 1;
        sat_sign[2] = 1;
      end else begin
        sat_sign[3] = 0;
        sat_sign[2] = 0;
      end
    end
    
    if(overflow[1]) begin 
      if(!sign[1]) begin
        sat_sign[1] = 1;
        sat_sign[0] = 1;
      end else begin
        sat_sign[1] = 0;
        sat_sign[0] = 0;
      end
    end
    
  end
  
  if (width == 2'b00) begin
    carry_in = 4'b0000;
    
    sat_last = 4'b1111;
    if(overflow[3]) begin
      if(!sign[3]) begin
        sat_sign[3] = 1;
      end else begin
        sat_sign[3] = 0;
      end
    end
    
    if(overflow[2]) begin
      if(!sign[2]) begin
        sat_sign[2] = 1;
      end else begin
        sat_sign[2] = 0;
      end
    end
    
    if(overflow[1]) begin
      if(!sign[1]) begin
        sat_sign[1] = 1;
      end else begin
        sat_sign[1] = 0;
      end
    end
    
    if(overflow[0]) begin
      if(!sign[0]) begin
        sat_sign[0] = 1;
      end else begin
        sat_sign[0] = 0;
      end
    end
    
    for (i=0;i<4;i= i+1) begin
      if ((overflow[i] == 1) && saturate)
        sat_enable[i]=1;
    end
    
    
  end
  
end
  
endmodule
