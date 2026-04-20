module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);
    reg [31:0] in_d;
    integer i;
    
    always@(posedge clk)begin
        if(reset)
            out<=32'd0;
        else begin
           for(i=0;i<32;i=i+1)begin 
               if(in[i]==0 && in_d[i]==1)
                   out[i]<=1;
           end
        end
        in_d<=in;
    end
endmodule
