module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [2:0] cout1;
    bcd_fadd f1(a[3:0],b[3:0],cin,cout1[0],sum[3:0]);
    bcd_fadd f2(a[7:4],b[7:4],cout1[0],cout1[1],sum[7:4]);
    bcd_fadd f3(a[11:8],b[11:8],cout1[1],cout1[2],sum[11:8]);
    bcd_fadd f4(a[15:12],b[15:12],cout1[2],cout,sum[15:12]);
endmodule
