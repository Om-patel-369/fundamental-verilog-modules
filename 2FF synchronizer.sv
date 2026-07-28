module two_ff_sync (
  input logic din,reset_n,clk,
  output logic q);
  
  logic temp_ff;
  
  always@(posedge clk or negedge reset_n)begin
    if(!reset_n)begin
      q<=0;
      temp_ff<=0;end
    else begin
      temp_ff<=din;
      q<=temp_ff;end
  end
  
endmodule
