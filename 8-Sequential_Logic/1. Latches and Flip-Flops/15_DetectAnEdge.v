module top_module (
    input clk,
    input [7:0] in,
    output [7:0] pedge
);
    reg [7:0] q;
    always@(posedge clk)
        begin
            q<=in;
            pedge<=(in&(~q));
        end
endmodule
