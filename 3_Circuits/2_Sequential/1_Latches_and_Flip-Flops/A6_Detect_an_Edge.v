module top_module (
    input clk,
    input [7:0] in,
    output reg [7:0] pedge
);
    reg [7:0] in_d;
        always@(posedge clk)begin 
            in_d<=in;
             pedge[0]=(in[0]==1) && (in_d[0]==0);
    pedge[1]=(in[1]==1) && (in_d[1]==0);
   pedge[2]=(in[2]==1) && (in_d[2]==0);
   pedge[3]=(in[3]==1) && (in_d[3]==0);
    pedge[4]=(in[4]==1) && (in_d[4]==0);
    pedge[5]=(in[5]==1) && (in_d[5]==0);
    pedge[6]=(in[6]==1) && (in_d[6]==0);
    pedge[7]=(in[7]==1) && (in_d[7]==0);
        end

endmodule
