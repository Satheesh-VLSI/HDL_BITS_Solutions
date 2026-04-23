module top_module (
    input clk,
    input areset,
    input x,
    output z
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
        next=state;

        case(state)
            S0:begin
                z=x;              // output depends on input
                next=x?S1:S0;
            end

            S1:begin
                z=~x;             // output depends on input
                next=S1;
            end
        endcase
    end

endmodule
