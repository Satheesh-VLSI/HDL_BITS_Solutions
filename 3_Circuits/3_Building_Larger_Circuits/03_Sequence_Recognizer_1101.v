module top_module (
    input clk,
    input reset,
    input data,
    output start_shifting
);
    localparam A=0,B=1,C=2,D=3,E=4;
    reg[2:0]state,next;

    always@(posedge clk)begin
        if(reset)
            state<=A;
        else
            state<=next;
    end

    always@(*)begin 
        next=state;
        case(state)
            A:next=data?B:A;
            B:next=data?C:A;
            C:next=data?C:D;
            D:next=data?E:A;
            E:next=E;
            default:next=A;
        endcase    
    end

    assign start_shifting=(state==E);

endmodule
