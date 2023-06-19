module top_module( 
    input a, 
    input b, 
    output out );
    wire t;
    xnor (t,a,b);
assign out = t;
endmodule