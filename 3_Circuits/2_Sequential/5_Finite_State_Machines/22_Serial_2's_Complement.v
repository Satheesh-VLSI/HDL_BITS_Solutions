module top_module(
    input clk,
    input areset,
    input x,
    output reg z
);

    parameter S0=1'b0,S1=1'b1;

    reg state,next;

    always @(posedge clk or posedge areset) begin
        if(areset)
            state<=S0;
        else
            state<=next;
    end

    always @(*) begin
        case(state)
            S0:next=x?S1:S0;
            S1:next=S1;
        endcase
    end

    // FIX: register output from NEXT state
    always @(posedge clk or posedge areset) begin
        if(areset)
            z<=0;
        else begin
            case(state)
                S0:z<=x;
                S1:z<=~x;
            endcase
        end
    end

endmodule
