module top_module (
    input clk,
    input x,
    output z
); 
   
    reg q1=0;
    reg q2=0;
    reg q3=0;
    dff d0((q1^x),clk,q1);
    dff d1((~q2&x),clk,q2);
    dff d2((~q3|x),clk,q3);
    assign z=~(q1 | q2 |q3);
    

endmodule

module dff(input d,clk,output q);
    
    always@(posedge clk)
        q<=d;
endmodule
