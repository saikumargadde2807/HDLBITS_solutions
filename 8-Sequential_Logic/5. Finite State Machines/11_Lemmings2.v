module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    output walk_left,
    output walk_right,
    output aaah ); 
    parameter LEFT=2'd0, RIGHT=2'd1, GROUND=2'd2;
    reg [1:0] state, next_state, prev_state;

    always @(*) begin
        case(state)
            2'd0:begin next_state<=(!ground)?GROUND:(bump_left?RIGHT:LEFT);prev_state<=LEFT; end
            2'd1:begin next_state<=(!ground)?GROUND:(bump_right?LEFT:RIGHT);prev_state<=RIGHT; end
            2'd2:next_state<=(!ground)?GROUND:prev_state;
            default:begin next_state<=(!ground)?GROUND:(bump_left?RIGHT:LEFT);prev_state<=LEFT; end
        endcase
    end

    always @(posedge clk, posedge areset) begin
        if(areset) state<=LEFT;
        else state<=next_state;
    end

    // Output logic
    assign walk_left = (state == LEFT)?1'b1:1'b0;
    assign walk_right = (state == RIGHT)?1'b1:1'b0;
    assign aaah = (state == GROUND)?1'b1:1'b0;
endmodule
