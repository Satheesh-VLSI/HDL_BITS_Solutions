`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire ab,cd,ab_cd;
    assign ab=a&b;
    assign cd=c&d;
    assign ab_cd=ab|cd;
    assign out=ab_cd;
    assign out_n=~ab_cd;

endmodule
