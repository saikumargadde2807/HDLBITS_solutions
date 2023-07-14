module top_module (
    input clk,
    input reset,     // synchronous reset
    input w,
    output z);
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
                A:next_state<=w?A:B;
                B:next_state<=w?D:C;
                C:next_state<=w?D:E;
                D:next_state<=w?A:F;
                E:next_state<=w?D:E;
                F:next_state<=w?D:C;
                default:next_state<=A;
            endcase
        end
    assign z = (state == E) || (state == F);
endmodule
