module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output reg done
); 
    localparam idle=0,data=1,waiting=2;
    
    reg [1:0] state,next;
    reg [3:0] count;
    always@(posedge clk)begin 
        if(reset)begin
            state<=idle;
            done<=0;
            count<=0;
        end
        else begin
            state<=next;
            done<=(state==data && next==idle) ;
            if(state==data)
                count<=count+1;
            else 
                count<=0;
        end
    end
    
    always@(*)begin
      next=state;
        case(state)
            idle:
                begin 
                    next=(!in)?data:idle;
                end
            data:
                begin
                    if(count<8)
                        next=data;
                    else
                        next=in?idle:waiting;
                end
            waiting:next=in?idle:waiting;
            default:next=idle;
        endcase
    end

endmodule
