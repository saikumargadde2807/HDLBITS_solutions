module top_module (
    input [3:0] a,
    input [3:0] b,
    input [3:0] c,
    input [3:0] d,
    input [3:0] e,
    output [3:0] q );
    always@(*)
        begin
            case(c)
                3'd0:q<=b;
                3'd1:q<=e;
                3'd2:q<=a;
                3'd3:q<=d;
                default: q<=4'hf;
            endcase
        end
endmodule
