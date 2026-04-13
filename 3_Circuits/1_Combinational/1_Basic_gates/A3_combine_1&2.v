module top_module (input x, input y, output z);
 wire z1,z2,z3,z4;
    module1 m1(x,y,z1);
    module1 m2(x,y,z2);
    module2 m3(x,y,z3);
    module2 m4(x,y,z4);
    wire zA,zB;
    assign zA=z1|z2;
    assign zB=z3&z4;
    assign z=zA^zB;
endmodule
module module1 (input x, input y, output z);
    assign z = (x^y) & x;

endmodule
module module2 ( input x, input y, output z );
    assign z=~(x^y);
endmodule
