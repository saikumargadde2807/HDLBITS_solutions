module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A=1'b0, B=1'b1;
    reg state, next_state;
    always@(posedge clk or posedge areset)
        begin
            if(areset) state<=A;
            else state<=next_state;
        end
    always@(*)
        begin
            case(state)
                A: begin next_state<=x?B:A; z<=x?1'b1:1'b0;end
                B: begin next_state<=x?B:B; z<=x?1'b0:1'b1; end
                default: next_state<=A;
            endcase
        end
endmodule
