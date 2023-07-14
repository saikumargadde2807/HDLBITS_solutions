module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire c1,c2,c3;
    wire [15:0] s1,s2;
    add16 a1(a[15:0],b[15:0],1'b0,sum[15:0],c1);
    add16 a2(a[31:16],b[31:16],1'b0,s1,c2);
    add16 a3(a[31:16],b[31:16],1'b1,s2,c3);
    assign sum[31:16] = c1?s2:s1;
endmodule
