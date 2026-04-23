module top_module(
    input clk,
    input in,
    input reset,
    output [7:0] out_byte,
    output reg done
);
    localparam IDLE=0,DATA=1,STOP=2,WAIT=3;
    reg [1:0] state,next;
    reg [7:0] bytes;
    reg [3:0] count;
    wire odd;

    wire p_reset;
    assign p_reset=(state==IDLE);
    parity p1(clk,p_reset,in,odd);

    always@(posedge clk)begin
        if(reset)begin
            state<=IDLE;
            count<=0;
            bytes<=0;
            done<=0;
        end else begin
            state<=next;
            done<=(state==STOP && next==IDLE && odd==1);
            if(state==DATA)begin
                if(count<8)begin
                    bytes<={in,bytes[7:1]};
                end
                count<=count+1;
            end else begin
                count<=0;
            end
        end
    end

    always@(*)begin
        next=state;
        case(state)
            IDLE:next=(!in)?DATA:IDLE;
            DATA:next=(count==8)?STOP:DATA;
            STOP:next=(in)?IDLE:WAIT;
            WAIT:next=(in)?IDLE:WAIT;
            default:next=IDLE;
        endcase
    end

    assign out_byte=bytes;
endmodule
