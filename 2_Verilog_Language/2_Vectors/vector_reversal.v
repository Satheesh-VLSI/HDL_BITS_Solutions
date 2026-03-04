/*Given an 8-bit input vector [7:0], reverse its bit ordering. */
module top_module( 
    input [7:0] in,
    output reg [7:0] out
);   
    integer i;
    always @(*) begin
        for(i=0;i<8;i=i+1)
            out[i]=in[7-i];
    end

endmodule
