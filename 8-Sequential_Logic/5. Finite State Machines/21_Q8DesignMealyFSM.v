module top_module (
    input clk,
    input aresetn,    // Asynchronous active-low reset
    input x,
    output z );
    parameter A=0, B=1, C=2;
    reg [1:0] state,next_state;
    always@(posedge clk or negedge aresetn)
        begin
            if(~aresetn) state<=A;
            else state<=next_state;
        end
    always@(*)
        begin
            case(state)
                A: begin next_state<=x?B:A;z<=x?1'b0:1'b0;end
                B: begin next_state<=x?B:C;z<=x?1'b0:1'b0;end
                C: begin next_state<=x?B:A;z<=x?1'b1:1'b0;end
                default: next_state<=A;
            endcase
        end
endmodule
