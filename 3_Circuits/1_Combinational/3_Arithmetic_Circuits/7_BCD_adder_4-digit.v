/*You are provided with a BCD (binary-coded decimal) one-digit adder named bcd_fadd that adds two BCD digits and carry-in, 
and produces a sum and carry-out.

module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
Instantiate 4 copies of bcd_fadd to create a 4-digit BCD ripple-carry adder.
Your adder should add two 4-digit BCD numbers (packed into 16-bit vectors) and a carry-in to produce a 4-digit sum and carry out.*/

module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [4:0] c;
    assign c[0]=cin;
    bcd_fadd (a[3:0],b[3:0],c[0],c[1],sum[3:0]);
    bcd_fadd (a[7:4],b[7:4],c[1],c[2],sum[7:4]);
    bcd_fadd (a[11:8],b[11:8],c[2],c[3],sum[11:8]);
    bcd_fadd (a[15:12],b[15:12],c[3],c[4],sum[15:12]);
    assign cout=c[4];

endmodule
