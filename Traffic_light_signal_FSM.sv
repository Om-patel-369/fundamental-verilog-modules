module traffic_light(
      input logic clk,rst_n,
      output logic red_on,green_on,yellow_on
    );
      
      typedef enum logic [1:0] {RED,GREEN,YELLOW} state_t;
      state_t cs,ns;
      logic [5:0] timer;
      
      always@(posedge clk or negedge rst_n) begin
        if(!rst_n) begin
          cs<=RED;
          timer <=6'd59; end
        else begin
          cs<=ns;
        if(timer==0)
          case(ns)
            RED : timer <=6'd59;
            YELLOW : timer <=6'd9;
            GREEN : timer<=6'd44;
            default:timer <= 6'd59;
          endcase
        else
          timer <= timer-1'b1;
        end
      end      
        
      //next state logic
      
      always@(*)begin
        ns = cs;
        
        if(timer==0) begin
        
        case(cs)
          
            RED : ns =GREEN;
            YELLOW: ns =RED;
            GREEN : ns=YELLOW;
            default:ns = RED;
        endcase
        end
      end
      
      //o/p logic
      
      assign red_on = (cs = RED);
      assign green_on = (cs = GREEN);
      assign yellow_on = (cs = YELLOW);
      
    endmodule
