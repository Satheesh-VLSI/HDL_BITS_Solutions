module top_module (
    input clk,
    input [2:0] y,
    input x,
    output Y0,
    output z
);

 
    
    reg [2:0] next;
    
    always@(*)begin
    
        next=y;
        case(y)
            3'b000:next=x?3'b001:3'b000;
            3'b001:next=x?3'b100:3'b001;
            3'b010:next=x?3'b001:3'b010;
            3'b011:next=x?3'b010:3'b001;
            3'b100:next=x?3'b100:3'b011;
        endcase
    
    end
    assign z= (y==3'b011 || y==3'b100);
    assign Y0= next[0];

endmodule

