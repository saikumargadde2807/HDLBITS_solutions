module top_module (
    input clk,
    input shift_ena,
    input count_ena,
    input data,
    output [3:0] q);
    reg [3:0] q1;
    always@(posedge clk)
        begin
            if(shift_ena == 1'b1) q1<={q[2:0],data};
           else if(count_ena == 1'b1) q1<=q1-4'd1;
        end
    assign q = q1;
endmodule
