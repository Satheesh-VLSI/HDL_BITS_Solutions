module top_module ( );
    reg clk;
    dut d1(clk);
    
    initial clk=0;
    always #5 clk=~clk;

endmodule
