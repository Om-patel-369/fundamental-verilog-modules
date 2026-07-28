module mux2to1 (
  input logic a,b,sel,
  output logic y
);
  
  always@(*) begin   //option 1 
    if(sel) y=b;
      else  y=a;
        end
        
        assign y = sel ? b : a; //option 2
    
  always @(*) begin  //option 3
      
      case (sel)
        
        0: y=a;
          1: y=b;
          default:y=a;
      endcase
    end
  
endmodule
