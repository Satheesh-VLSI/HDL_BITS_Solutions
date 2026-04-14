/*Assume that you have two 8-bit 2's complement numbers, a[7:0] and b[7:0].
These numbers are added to produce s[7:0]. Also compute whether a (signed) overflow has occurred.

*/

module top_module (
    input [7:0] a,
    input [7:0] b,
    output [7:0] s,
    output overflow
);

    wire [8:0] c;

    assign c[0] = 0;
    genvar i;
    generate
        for(i=0;i<8;i=i+1) begin:adder
            assign {c[i+1],s[i]} = a[i] + b[i] + c[i];
        end
    endgenerate

    assign overflow = c[7] ^ c[8];

endmodule
