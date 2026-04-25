module top_module ();
    reg clk,reset,t;
    wire q;
    tff t1(clk,reset,t,q);
    initial clk=0;
    always #5 clk=~clk;
    
    initial begin 
        t=0;reset=1;
        #10 reset=0; #20 t=1;
    end


endmodule
