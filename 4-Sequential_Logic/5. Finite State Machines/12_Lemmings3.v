module top_module(
    input clk,
    input areset,    // Freshly brainwashed Lemmings walk left.
    input bump_left,
    input bump_right,
    input ground,
    input dig,
    output walk_left,
    output walk_right,
    output aaah,
    output digging ); 
    parameter LEFT=3'd0, RIGHT=3'd1, GROUND_LEFT=3'd2,  GROUND_RIGHT=3'd3, DIG_LEFT=3'd4, DIG_RIGHT=3'd5;
    reg [2:0] state,next_state;
    always@(posedge clk or posedge areset)
        begin
            if(areset) state<=LEFT;
            else state<=next_state;
        end
    always@(*)
        begin
            case(state)
                3'd0: begin next_state<=(!ground)?GROUND_LEFT:(dig?DIG_LEFT:(bump_left?RIGHT:LEFT));end
                3'd1: begin next_state<=(!ground)?GROUND_RIGHT:(dig?DIG_RIGHT:(bump_right?LEFT:RIGHT)); end
                3'd2:next_state<=ground?LEFT:GROUND_LEFT;
                3'd3:next_state<=ground?RIGHT:GROUND_RIGHT;
                3'd4:next_state<=(!ground)?GROUND_LEFT:DIG_LEFT;
                3'd5:next_state<=(!ground)?GROUND_RIGHT:DIG_RIGHT;
                default:next_state<=LEFT;
            endcase
        end
    assign walk_left = (state == LEFT)?1'b1:1'b0;
    assign walk_right = (state == RIGHT)?1'b1:1'b0;
    assign aaah = ((state == GROUND_LEFT) || (state == GROUND_RIGHT))?1'b1:1'b0;
    assign digging = ((state == DIG_LEFT) || (state == DIG_RIGHT))?1'b1:1'b0;
endmodule