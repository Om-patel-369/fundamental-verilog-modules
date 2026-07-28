module sync_fifo #(parameter DEPTH=256, parameter WIDTH = 8 )(
  input logic clk,rst,w_en,r_en
  input logic [WIDTH-1:0]wdata,
  output logic [WIDTH-1:0]rdata,
  output logic full,empty
);
  
  logic [WIDTH-1:0] fifo [DEPTH];
  logic [$clog2(DEPTH):0] w_pointer,r_pointer; // 1bit extra for empty flag
  
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      w_pointer<=0;
      r_pointer<=0;
    end
      
    else if (w_en && !full) begin
      fifo[w_pointer[$clog2(DEPTH)-1:0]]<=wdata;
    w_pointer++;end
        
    else  if (r_en && !empty) begin       
      rdata <= fifo[r_pointer[$clog2(DEPTH)-1:0]];
      r_pointer++; end
  end
  
  assign empty = (w_pointer == r_pointer);
  assign full = (w_pointer[$clog2(DEPTH)] != r_pointer[$clog2(DEPTH)]) && (w_pointer[$clog2(DEPTH)-1:0] == r_pointer [$clog2(DEPTH)-1:0];
  
endmodule
