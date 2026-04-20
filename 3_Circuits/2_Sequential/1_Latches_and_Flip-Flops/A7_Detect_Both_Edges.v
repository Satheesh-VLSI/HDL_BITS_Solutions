module top_module (
    input clk,
    input [7:0] in,
    output [7:0] anyedge
); 
    reg [7:0] in_d;
        always@(posedge clk)begin 
            in_d<=in;
            anyedge[0]=((in[0]==1) && (in_d[0]==0))|((in[0]==0) && (in_d[0]==1));
            anyedge[1]=((in[1]==1) && (in_d[1]==0))|((in[1]==0) && (in_d[1]==1));
            anyedge[2]=((in[2]==1) && (in_d[2]==0))|((in[2]==0) && (in_d[2]==1));
            anyedge[3]=((in[3]==1) && (in_d[3]==0))|((in[3]==0) && (in_d[3]==1));
            anyedge[4]=((in[4]==1) && (in_d[4]==0))|((in[4]==0) && (in_d[4]==1));
            anyedge[5]=((in[5]==1) && (in_d[5]==0))|((in[5]==0) && (in_d[5]==1));
            anyedge[6]=((in[6]==1) && (in_d[6]==0))|((in[6]==0) && (in_d[6]==1));
            anyedge[7]=((in[7]==1) && (in_d[7]==0))|((in[7]==0) && (in_d[7]==1));
        end

endmodule
