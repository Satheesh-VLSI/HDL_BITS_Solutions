module top_module (
    input clock,
    input a,
    output p,
    output q );
    always@(negedge clock)
        q<=a;
    always@(clock)begin
        if(clock)
            p<=a;
        else
            p<=p;
    end

endmodule
