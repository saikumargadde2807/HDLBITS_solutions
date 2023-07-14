module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output reg [15:0] q);
    always@(posedge clk)
        begin
            if(reset) q<=16'd0;
            else
                begin
                    if(q[3:0]!=4'd9) q[3:0]<=q[3:0]+4'd1;
                    else
                        begin
                            q[3:0]<=4'd0;
                            q[7:4]<=q[7:4]+4'd1;
                            if(q[7:4]==4'd9)
                                begin
                                    q[7:4]<=4'd0;
                                    q[11:8]<=q[11:8]+4'd1;
                                    if(q[11:8] == 4'd9)
                                        begin
                                            q[11:8]<=4'd0;
                                            q[15:12]<=q[15:12]+4'd1;
                                            if(q[15:12] == 4'd9) q<=16'd0;
                                        end
                                end
                        end
                end
        end
            assign ena[1] = (q[3:0]==4'd9)?1'b1:1'b0;
            assign ena[2] = (q[7:4]==4'd9 && q[3:0]==4'd9)?1'b1:1'b0;
            assign ena[3] = (q[11:8]==4'd9 && q[7:4]==4'd9 && q[3:0]==4'd9)?1'b1:1'b0;
endmodule
