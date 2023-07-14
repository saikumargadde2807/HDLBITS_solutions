module top_module(
    input clk,
    input reset,    // Synchronous reset
    input in,
    output disc,
    output flag,
    output err);
    parameter A=0, B=1, C=2, D=3, E=4, F=5, G=6, DISC=7, ERR=8, FLAG=9;
    reg [3:0] state,next_state;
    always@(posedge clk)
        begin
            if(reset) state<=A;
            else state<=next_state;
        end
    always@(*)
        begin
            case(state)
                A: next_state<=in?B:A;
                B: next_state<=in?C:A;
                C: next_state<=in?D:A;
                D: next_state<=in?E:A;
                E: next_state<=in?F:A;
                F: next_state<=in?G:DISC;
                DISC: next_state<=in?B:A;
                G: next_state<=in?ERR:FLAG;
                FLAG: next_state<=in?B:A;
                ERR: next_state<=in?ERR:A;
                default:next_state<=A;
            endcase
        end
    assign disc = (state == DISC);
    assign flag = (state == FLAG);
    assign err = (state == ERR);
endmodule
