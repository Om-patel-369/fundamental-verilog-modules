module mod_n_counter #(parameter N=8)(
  input logic clk,rst_n,
  output logic [$clog2(N)-1:0] count
);
  
  always@(posedge clk or negedge rst_n)begin
    if(!rst_n)
      count<=0;
    else if(count==N-1)
      count<=0;
    else
      count<=count+1;
  end
  
endmodule
