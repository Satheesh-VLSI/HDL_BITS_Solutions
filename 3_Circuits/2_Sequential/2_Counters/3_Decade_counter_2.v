module top_module (
    input clk,
    input reset,        // Synchronous active-high reset
    output [3:0] q);
    
    always@(posedge clk)begin 
        if(reset)
            q<=1;
        else if(q<10)
            q<=q+1;
        else
            q<=1;  
    
    end

endmodule
