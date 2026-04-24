module top_module(
    input clk,
    input resetn,
    input x,
    input y,
    output f,
    output reg g
);
    localparam A=0,B=1,C=2,D=3,E=4,C1=5,C2=6,F=7,G=8;
    reg[3:0]state,next;

    always@(posedge clk)begin
        if(!resetn)
            state<=A;
        else 
            state<=next;
    end

    always@(*)begin
        next=state;
        case(state)
            A:next=B;
            B:next=C;  //f
            C:next=x?D:C; //1
            D:next=~x?E:D; //10
            E:next=x?C1:C; //101
            C1:next=y?F:C2; //1st clock
            C2:next=y?F:G;  //2nd clock
            F:next=F;
            G:next=G;
            default:next=A;
        endcase
    end

    assign f=(state==B);
    assign g= (state==F || state==C1 ||state==C2);

endmodule
