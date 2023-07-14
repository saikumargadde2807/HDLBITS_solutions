module top_module(
    input in,
    input [3:0] state,
    output [3:0] next_state,
    output out); //

    parameter A=0, B=1, C=2, D=3;

    // State transition logic: Derive an equation for each state flip-flop.
    assign next_state[A] = state[0]&(~in) | state[2]&(~in);
    assign next_state[B] = (state[0]&in) | (state[1]&in) | (state[3]&in);
    assign next_state[C] = (~in&state[1]) | (~in&state[3]);
    assign next_state[D] = in&state[2];

    // Output logic: 
    assign out = (state >= 4'd8)?1'b1:1'b0;

endmodule
