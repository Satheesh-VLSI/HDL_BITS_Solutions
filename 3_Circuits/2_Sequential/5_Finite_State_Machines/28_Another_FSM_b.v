module top_module (
    input [6:1] y,
    input w,
    output Y2,
    output Y4);
    localparam  A=6'b000001,B=6'b000010,C=6'b000100,D=6'b001000,E=6'b010000,F=6'b100000;
    reg [6:1] next;
    always@(*)begin 
        next=6'b000000;
        case(1'b1)
            y[1]:next=w?A:B;
            y[2]:next=w?D:C;
            y[3]:next=w?D:E;
            y[4]:next=w?A:F;
            y[5]:next=w?D:E;
            y[6]:next=w?D:C;
            default:next=A;
        endcase    
    end
    assign Y2=next[2];
    assign Y4=next[4];

endmodule

