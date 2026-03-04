/*Given five 1-bit signals (a, b, c, d, and e), compute all 25 pairwise one-bit comparisons in the 25-bit output vector. 
The output should be 1 if the two bits being compared are equal.

out[24] = ~a ^ a;   // a == a, so out[24] is always 1.
out[23] = ~a ^ b;
out[22] = ~a ^ c;
...
out[ 1] = ~e ^ d;
out[ 0] = ~e ^ e;
*/

module top_module (
    input a, b, c, d, e,
    output [24:0] out );//

    // The output is XNOR of two vectors created by 
    // concatenating and replicating the five inputs.
    assign out[24:20] = ~{a,a,a,a,a} ^ {a,b,c,d,e};
    assign out[19:15] = ~{b,b,b,b,b} ^ {a,b,c,d,e};
    assign out[14:10] = ~{c,c,c,c,c} ^ {a,b,c,d,e};
    assign out[9:5] = ~{d,d,d,d,d} ^ {a,b,c,d,e};
    assign out[4:0] = ~{e,e,e,e,e} ^ {a,b,c,d,e};

endmodule
