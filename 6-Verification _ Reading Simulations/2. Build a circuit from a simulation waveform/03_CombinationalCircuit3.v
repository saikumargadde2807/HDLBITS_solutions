module top_module (
    input a,
    input b,
    input c,
    input d,
    output q 
  );

    assign q = (a&c) | (b&c) | (a&d) | (b&d);

endmodule
