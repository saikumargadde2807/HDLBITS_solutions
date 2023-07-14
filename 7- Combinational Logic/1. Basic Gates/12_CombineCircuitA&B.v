module top_module (input x, input y, output z);
    wire z1,z2;
    q1 IA1(x,y,z1);
    q2 IA2(x,y,z2);
    assign z = (z1|z2) ^ (z1&z2);
endmodule
module q1( input x, input y, output z );
    assign z = ~(x^y);
endmodule
module q2(input x, input y, output z);
    assign z = (x^y) & x;
endmodule