module top_module (
    input clk,
    input in, 
    output out);
    wire exor;
    reg q;
    assign exor=in^q;
    assign out=q;
    
    always@(posedge clk)begin 
        q<=exor;
    end
    
    

endmodule
