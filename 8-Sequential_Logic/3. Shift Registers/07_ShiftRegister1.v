module top_module (
    input clk,
    input resetn,   // synchronous reset
    input in,
    output out);
    reg [2:0] q;
    always@(posedge clk)
        begin
            if(!resetn) begin q[2:0]<=3'b000;out<=1'd0; end
            else
                begin
                    q[2]<=in;
                    q[1]<=q[2];
                    q[0]<=q[1];
                    out<=q[0];
                end
        end
endmodule
