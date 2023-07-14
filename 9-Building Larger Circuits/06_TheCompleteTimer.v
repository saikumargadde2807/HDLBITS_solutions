module top_module (
    input clk,
    input reset,      // Synchronous reset
    input data,
    output [3:0] count,
    output counting,
    output done,
    input ack );
    parameter A=0, B=1, C=2, D=3, E=4, F=5, G=6, H=7;
    reg [3:0] delay;
    reg [9:0] timer;
    reg [3:0] state, next_state;
    always@(*)
        begin
            case(state)
                A:next_state<=data?B:A;
                B:next_state<=data?C:A;
                C:next_state<=data?C:D;
                D:next_state<=data?E:A;
                E:next_state<=(timer == 10'd0)?F:E;
                F:next_state<=G;
                G:next_state<=(timer==10'd0 && delay==4'd0)?H:G;
                H:next_state<=ack?A:H;
                default: next_state<=A;
            endcase
        end
    always@(posedge clk)
        begin
            if(reset)  begin state<=A; delay<=4'd0; timer<=10'd0; end
            else
                begin
                    if(state == D) timer<=10'd3;
                    else if(state == E) begin timer<=timer-10'd1; delay<={delay[2:0],data}; end
                    else if(state == F) timer<=10'd999-10'd1;
                    else if(state == G) begin if(timer ==10'd0) 
                        begin
                            timer<=10'd999; 
                            delay<=delay-4'd1; 
                        end
                        else timer<=timer-10'd1;
                    end
                    state<=next_state;
                end
        end
    assign done = (state==H);
    assign counting = (state==F | state == G);
    assign count = delay;
endmodule
