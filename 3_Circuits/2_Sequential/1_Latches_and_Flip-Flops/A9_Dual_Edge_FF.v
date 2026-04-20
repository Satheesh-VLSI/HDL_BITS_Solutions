module top_module (
    input clk,
    input d,
    output q
);  
    reg pclk,nclk;
    
    always@(posedge clk) pclk<=d;
    always@(negedge clk) nclk<=d;
    
    assign q =clk?pclk:nclk;

endmodule
