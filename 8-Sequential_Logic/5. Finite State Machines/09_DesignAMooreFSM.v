module top_module (
    input clk,
    input reset,
    input [3:1] s,
    output fr3,
    output fr2,
    output fr1,
    output reg dfr
);
    reg [2:0] state,prev_state;
    parameter A=2'd0, B=2'd1, C=2'd2, D=2'd3;
    always@(posedge clk)
        begin
            if(reset) begin fr3=1'b1;fr2=1'b1;fr1=1'b1;dfr=1'b1;state=A; end
            else
                begin
                    prev_state=state;
        case(s)
            3'b000:begin fr3 =1'b1;fr2 =1'b1;fr1=1'b1;state=A; dfr = (prev_state>state)?1'b1:((prev_state==state)?dfr:1'b0); end
            3'b001:begin fr3 =1'b0;fr2 =1'b1;fr1=1'b1; state=B; dfr = (prev_state>state)?1'b1:((prev_state==state)?dfr:1'b0); end
            3'b011:begin fr3 =1'b0;fr2 =1'b0;fr1=1'b1; state=C; dfr = (prev_state>state)?1'b1:((prev_state==state)?dfr:1'b0); end
            3'b111:begin fr3 =1'b0;fr2 =1'b0;fr1=1'b0; state=D; dfr = (prev_state>state)?1'b1:((prev_state==state)?dfr:1'b0);end
            default:begin fr3 =1'b1;fr2 =1'b1;fr1 =1'b1;dfr =1'b1; state=A;end
        endcase
        end
        end
endmodule