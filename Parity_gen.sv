module parity_gen #(parameter N=8) (
  input logic [N-1:0] data,
  output logic parity
);
  
  assign parity = ^data;
endmodule
