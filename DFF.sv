module dff (
  input logic din,reset_n,clk,
  output logic q);
  
  always@(posedge clk or negedge reset_n)begin
    if(!reset_n)
      q<=0;
    else
      q<=din;
  end
  
endmodule
