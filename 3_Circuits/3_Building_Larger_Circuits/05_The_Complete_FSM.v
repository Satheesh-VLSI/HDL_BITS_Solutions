module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    
    localparam D1=4'd1,D2=4'd2,D3=4'd3,D4=4'd4,
               S1=4'd5,S2=4'd6,S3=4'd7,S4=4'd8,
               count=4'd9,Done=4'd10;
    reg[3:0]state,next;

    always@(posedge clk)begin
        if(reset)
            state<=D1;
        else
            state<=next;
    end

    always@(*)begin 
        next=state;
        case(state)
            D1:next=data?D2:D1;
            D2:next=data?D3:D1;
            D3:next=data?D3:D4;
            D4:next=data?S1:D1;
            S1:next=S2;
            S2:next=S3;
            S3:next=S4;
            S4:next=count;
            count:next=done_counting?Done:count;
            Done:next=ack?D1:Done;
            default:next=D1;
        endcase    
    end

    assign shift_ena=(state==S1 || state==S2 || state==S3 || state==S4 );
    assign counting=state==count;
    assign done=state==Done;

endmodule

