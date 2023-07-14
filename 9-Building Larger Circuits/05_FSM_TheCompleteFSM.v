module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output shift_ena,
    output counting,
    input done_counting,
    output done,
    input ack );
    parameter A=0, B=1, C=2, D=3, E=4, F=5, G=6, H=7, I=8,DONE=9;
    reg [3:0] state,next_state;
    always@(posedge clk)
        begin
            if(reset) state<=A;
            else state<=next_state;
        end
    always@(*)
        begin
            case(state)
                A:begin next_state<=data?B:A;shift_ena<=1'b0;end
                B:begin next_state<=data?C:A;shift_ena<=1'b0;end
                C:begin next_state<=data?C:D;shift_ena<=1'b0;end
                D:begin next_state<=data?E:A;shift_ena<=1'b0;end
                E:begin next_state<=F;shift_ena<=1'b1;end
                F:begin next_state<=G; shift_ena<=1'b1;end
                G:begin next_state<=H; shift_ena<=1'b1;end
                H:begin next_state<=I; shift_ena<=1'b1;end
                I:begin next_state<=(done_counting)?DONE:I;shift_ena<=1'b0;end
                DONE:begin next_state<=ack?A:DONE;shift_ena<=1'b0;end
                default:next_state<=A;
            endcase
        end
    assign counting = (state == I);
    assign done = (state == DONE);
endmodule
