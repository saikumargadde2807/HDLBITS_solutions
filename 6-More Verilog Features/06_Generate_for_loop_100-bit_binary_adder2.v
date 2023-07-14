module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
    wire [99:0] cout1;
    Fadd f1(a[0],b[0],cin,cout1[0],sum[0]);
    genvar i;
       generate for(i=1;i<100;i=i+1)
        begin: block
            Fadd f2(a[i],b[i],cout1[i-1],cout1[i],sum[i]);
        end
       endgenerate
    assign cout = cout1;
endmodule
module Fadd(a,b,cin,cout,sum);
    input a,b,cin;
    output cout,sum;
    assign sum = a^b^cin;
    assign cout = (a&b)|(b&cin)|(a&cin);
endmodule
