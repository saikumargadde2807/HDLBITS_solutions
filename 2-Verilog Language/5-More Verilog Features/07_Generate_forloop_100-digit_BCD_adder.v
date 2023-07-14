module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [98:0] cout1;
    genvar i;
    bcd_fadd s1(a[3:0],b[3:0],cin,cout1[0],sum[3:0]);
        generate for(i=1;i<99;i=i+1)
        begin: block
            bcd_fadd inst(a[(4*(i)+3):(4*i)],b[(4*(i)+3):(4*i)],cout1[i-1],cout1[i],sum[(4*(i)+3):(4*i)]);
        end
            
        endgenerate
        bcd_fadd s2(a[399:396],b[399:396],cout1[98],cout,sum[399:396]);
endmodule
