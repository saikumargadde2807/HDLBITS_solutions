module top_module (
    input clk,
    input areset,
    input x,
    output z
); 
    parameter A=0, B=1, C=2;
    reg [1:0] state, next_state;
    reg val;
    always@(posedge clk or posedge areset)
        begin
            if(areset) state<=A;
            else state<=next_state;
        end
    always@(*)
        begin
            case(state)
                A: begin next_state<=x?C:B; val<=x?1'b0:1'b1;end
                B: begin next_state<=x?(val?C:B):(val?B:C); val<=val; end
                C: begin next_state<=x?B:C; val<=1'b0; end
                default: next_state<=A;
            endcase
        end
    assign z = (state==C);
endmodule
