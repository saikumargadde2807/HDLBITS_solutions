module top_module(
    input [31:0] a,
    input [31:0] b,
    input sub,
    output [31:0] sum
);
    wire [31:0] b_bar;
    wire c1,x;
    assign b_bar = sub?(b^{32{sub}})+1:b;
    add16 a1(a[15:0],b_bar[15:0],1'b0,sum[15:0],c1);
    add16 a2(a[31:16],b_bar[31:16],c1,sum[31:16],x);
endmodule
