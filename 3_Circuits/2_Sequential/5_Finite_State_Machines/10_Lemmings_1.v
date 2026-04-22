module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    output walk_left,
    output walk_right); //  

    parameter left=0,right=1;
    reg state, next;

    always @(*) begin
        next=state;
        case(state)
            left:next=bump_left?right:left;
            right:next=bump_right?left:right;
            default:next=left;
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset)
            state<=left;
        else
            state<=next;
    end

    // Output logic
    assign walk_left = (state == left);
    assign walk_right = (state == right);

endmodule
