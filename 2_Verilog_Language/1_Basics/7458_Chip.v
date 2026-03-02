module top_module ( 
    input p1a, p1b, p1c, p1d, p1e, p1f,
    output p1y,
    input p2a, p2b, p2c, p2d,
    output p2y );
  wire P1A,P1B,P2A,P2B;
    
    assign P1A=p1a&p1b&p1c;
    assign P1B=p1d&p1e&p1f;
    assign p1y=P1A|P1B;
    
    assign P2A=p2a&p2b;
    assign P2B=p2d&p2c;
    assign p2y=P2A|P2B;

endmodule
