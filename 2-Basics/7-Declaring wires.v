`default_nettype none
module top_module(
    input a,
    input b,
    input c,
    input d,
    output out,
    output out_n   ); 
    wire a1,a2,o1;
    assign a1 = a&b;
    assign a2 = c & d;
    assign o1 = a1 | a2;
    assign out = o1;
    assign out_n = !o1;
endmodule
