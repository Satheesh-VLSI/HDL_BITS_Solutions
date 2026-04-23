module top_module(
    input clk,
    input reset,
    input in,
    output disc,
    output flag,
    output err);
    localparam S0=0,S1=1,S2=2,S3=3,S4=4,S5=5,S6=6,SD=7,SF=8,SE=9;
    reg [3:0] state,next;

    always@(posedge clk) begin
        if(reset) 
            state<=S0;
        else 
            state<=next;
    end

    always@(*) begin
        next=state;
        case(state)
            S0:next=in?S1:S0;
            S1:next=in?S2:S0;
            S2:next=in?S3:S0;
            S3:next=in?S4:S0;
            S4:next=in?S5:S0;
            S5:next=in?S6:SD; 
            S6:next=in?SE:SF; 
            SD:next=in?S1:S0; 
            SF:next=in?S1:S0; 
            SE:next=in?SE:S0;
            default:next=S0;
        endcase
    end

    assign disc=(state==SD);
    assign flag=(state==SF);
    assign err=(state==SE);
endmodule
