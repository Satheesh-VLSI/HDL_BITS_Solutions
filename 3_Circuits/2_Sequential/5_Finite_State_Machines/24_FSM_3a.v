module top_module(
    input clk,
    input reset,
    input s,
    input w,
    output reg z
);
    localparam A=0,B=1;
    reg state,next;
    reg[1:0]count;
    reg[2:0]data;
    reg[2:0]next_data;

    always@(posedge clk)begin
        if(reset)begin
            state<=A;
            count<=0;
            data<=0;
            z<=0;
        end
        else begin
            state<=next;
            if(state==B)begin
                next_data={w,data[2:1]};
                if(count<2'd2)begin
                    count<=count+1;
                    data<=next_data;
                    z<=0;
                end
                else begin
                    count<=0;
                    data<=next_data;
                    z<=((next_data[0]+next_data[1]+next_data[2])==2);
                end
            end
            else begin
                z<=0;
            end
        end
    end

    always@(*)begin
        case(state)
            A:next=s?B:A;
            B:next=B;
        endcase
    end
endmodule
