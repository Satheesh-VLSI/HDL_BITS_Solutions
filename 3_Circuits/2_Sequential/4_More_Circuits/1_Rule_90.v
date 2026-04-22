module top_module(
    input clk,
    input load,
    input [511:0] data,
    output [511:0] q ); 
    
    reg [511:0] q1,q2;
    always@(posedge clk)begin 
        if(load)
            q<=data;
        else
            q<=q1^q2;
    end
    
    assign q1=q<<1;
    assign q2=q>>1;
endmodule
