module top_module(
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output dfr
);

    localparam below_s1=3'b000,
               s1_s2_IC=3'b001,
               s2_s3_IC=3'b010,
               s1_s2_DC=3'b011,
               s2_s3_DC=3'b100,
               above_s3=3'b101;

    reg [2:0] state,next;

    always @(posedge clk) begin
        if(reset)
            state<=below_s1;
        else
            state<=next;
    end

    always @(*) begin
        case(state)

            below_s1:next=(s==3'b001)?s1_s2_IC:below_s1;

            s1_s2_IC:if(s==3'b011) next=s2_s3_IC;
                     else if(s==3'b000) next=below_s1;
                     else next=s1_s2_IC;

            s1_s2_DC:if(s==3'b011) next=s2_s3_IC;
                     else if(s==3'b000) next=below_s1;
                     else next=s1_s2_DC;

            s2_s3_IC:if(s==3'b111) next=above_s3;
                     else if(s==3'b001) next=s1_s2_DC;
                     else next=s2_s3_IC;

            s2_s3_DC:if(s==3'b111) next=above_s3;
                     else if(s==3'b001) next=s1_s2_DC;
                     else next=s2_s3_DC;

            above_s3:next=(s==3'b011)?s2_s3_DC:above_s3;

            default:
                next=below_s1;

        endcase
    end

    assign fr3=(state==below_s1);

    assign fr2=(state==below_s1)||(state==s1_s2_IC)||(state==s1_s2_DC);

    assign fr1=(state==below_s1)||(state==s1_s2_IC)||(state==s1_s2_DC)||(state==s2_s3_IC)||(state==s2_s3_DC);

    assign dfr=(state==s1_s2_DC)||(state==s2_s3_DC)||(state==below_s1);

endmodule
