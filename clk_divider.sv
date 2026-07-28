module clk_divider_by_2(
input logic clk_ip,rst_n,
output logic clk_op
);
                                                                             
                                                                             
always @(posedge clk_ip or negedge rst_n)begin
  if(!rst_n)
    clk_op <= 0;
  else
    clk_op <= ~ clk_out;
end
  
endmodule
