/*  Implement the following circuit:NOR
           ______
in1--------\     \
            )     )o---- out
in2--------/_____/
*/
module top_module (
    input in1,
    input in2,
    output out);
    assign out=~(in1|in2);

endmodule
