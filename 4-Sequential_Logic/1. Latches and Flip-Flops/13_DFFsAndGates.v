module top_module (
    input clk,
    input x,
    output z
); 
    wire [2:0] d;
    reg [2:0] q;
    assign d[0] = q[0]^x;
    assign d[1] = (~q[1])&x;
    assign d[2] = (~q[2])|x;
    always@(posedge clk)
        begin
            q<=d;
        end
    assign z = ~(q[0]|q[1]|q[2]);
endmodule
