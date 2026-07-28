module univ_sft_reg #(parameter N=8) 
  (input logic clk,rst_n,
   input logic [1:0] mode, //hold,left,right,load
   input logic [N-1:0] d,
   input logic sh_l,sh_r,
   output logic [N-1:0] q
  );
  
  always @(posedge clk or negedge rst_n)begin
    if(!rst_n)
      q<=0;
    
      else begin
        
        case(mode)
          
          0 : q <= q; //hold
          1 : q <= {q[N-2:0],sh_l}; //shift left
          2: q <= {sh_r, q[N-1:1]}; //shift right
          3: q <= d; //parellal load 
          default : q <= q;
          
                   endcase
                   end
                   endmodule
                   
    module adder #(parameter N=4)(
      input logic [N-1:0] a,b,
      input logic cin,
      output logic cout,
      output logic [N-1:0] sum
    );
      
      assign {cout,sum} = a+b+cin;
    endmodule
