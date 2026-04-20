module top_module (
    input clk,
    input slowena,
    input reset,
    output [3:0] q);

    always@(posedge clk)begin 
        if(reset)
            q<=0;
        else if((q<9) && slowena==1)
            q<=q+1;
        else if(q==9 && slowena==1)
            q<=0;
        else
            q<=q;
    
    end

endmodule
