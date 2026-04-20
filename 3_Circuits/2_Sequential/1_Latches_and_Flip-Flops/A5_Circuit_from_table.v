module top_module (
    input clk,
    input j,
    input k,
    output Q); 
    wire in;
    reg q=0;
    assign in=(q&~k)|(~q&j);
    dff jk(in,clk,q);
    assign Q=q;

endmodule

module dff(input d,clk,output reg q);
    always@(posedge clk) q<=d;
endmodule
