module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
     parameter left=0,right=1,fall_left=2,fall_right=3,dig_left=4,dig_right=5,dead=6;
    reg [2:0] state, next;
    integer count;
    always @(*) begin
        next=state;
        case(state)
            left:next=ground?(dig?dig_left:(bump_left?right:left)):fall_left;
            right:next=ground?(dig?dig_right:(bump_right?left:right)):fall_right;
            fall_left:next=(ground?(count>=20?dead:left):fall_left);
            fall_right:next=(ground?(count>=20?dead:right):fall_right);
            dig_left:next=ground?dig_left:fall_left;
            dig_right:next=ground?dig_right:fall_right;
            dead:next=dead;
            default:next=left;
        endcase
    end 

    always @(posedge clk, posedge areset) begin
        if(areset)begin
            state<=left;
            count<=0;
        end
        
        else begin
            state<=next;
            if(state== fall_left || state==fall_right)
              count<=count+1;
            else
                count<=0;
        end
    end

    // Output logic
    assign walk_left = (state == left) && (state!=dead);
    assign walk_right = (state == right) && (state!=dead);
    assign aaah = ((state == fall_left) || (state == fall_right)) ;
    assign digging = ((state == dig_left) || (state == dig_right)) && (state!=dead);
   

endmodule
