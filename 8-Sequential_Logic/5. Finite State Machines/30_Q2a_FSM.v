module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    input w,
    output z
);
    parameter A=3'd0, B=3'd1, C=3'd2, D=3'd3, E=3'd4, F=3'd5;
    reg [2:0] state,next_state;
    always@(posedge clk)
        begin
            if(reset) state<=A;
            else state<=next_state;
        end
    always@(*)
        begin
            case(state)
                A:begin next_state<=w?B:A;z<=1'b0; end
                B:begin next_state<=w?C:D;z<=1'b0; end
                C:begin next_state<=w?E:D;z<=1'b0; end
                D:begin next_state<=w?F:A;z<=1'b0; end
                E:begin next_state<=w?E:D;z<=1'b1; end
                F:begin next_state<=w?C:D;z<=1'b1; end
                default:next_state<=A;
            endcase
        end
endmodule
