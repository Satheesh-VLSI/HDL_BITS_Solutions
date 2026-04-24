module top_module (
    input [5:0] y,
    input w,
    output Y1,
    output Y3
);
    localparam  A=6'b000001,B=6'b000010,C=6'b000100,D=6'b001000,E=6'b010000,F=6'b100000;
    reg [5:0] next;
    always@(*)begin 
        next=6'b000000;
        case(1'b1)
            y[0]:next=w?B:A;
            y[1]:next=w?C:D;
            y[2]:next=w?E:D;
            y[3]:next=w?F:A;
            y[4]:next=w?E:D;
            y[5]:next=w?C:D;
            default:next=A;
        endcase    
    end
    assign Y1=next[1];
    assign Y3=next[3];


endmodule

