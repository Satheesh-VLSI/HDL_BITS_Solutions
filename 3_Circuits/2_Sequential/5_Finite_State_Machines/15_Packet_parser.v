module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output reg done); 
    
    parameter idle=0,start2=1,start3=2;
    reg [1:0] state,next;
    
    // FSM State transitions remain the same
    always @(*) begin    
        next = state;
        case(state)
            idle:next=(in[3])?start2:idle;
            start2:next=start3;
            start3:next=idle;
        endcase
    end

    // Sequential logic
    always @(posedge clk) begin  
        if(reset) begin
            state<=idle;
            done<=0; // Reset done signal
        end else begin
            state<=next;
            done<=(state==start3);
        end
    end

endmodule
