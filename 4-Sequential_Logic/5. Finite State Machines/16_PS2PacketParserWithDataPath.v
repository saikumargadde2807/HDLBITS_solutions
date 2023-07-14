module top_module(
    input clk,
    input [7:0] in,
    input reset,    // Synchronous reset
    output [23:0] out_bytes,
    output done); //
    // FSM from fsm_ps2
    parameter Byte1=2'd0,Byte2=2'd1,Byte3=2'd2,Done=2'd3;
    reg [1:0] state,next_state;
    //reg [23:0] out;
    // State transition logic (combinational)
    always@(*)
        begin
            case(state)
                2'd0: next_state<=(in[3] == 1'b1)?Byte2:Byte1;
                2'd1: next_state<=Byte3;
                2'd2: next_state<=Done;
                2'd3: next_state<=(in[3] == 1'b1)?Byte2:Byte1;
                default: next_state<=Byte1;
            endcase
        end
    // State flip-flops (sequential)
    always@(posedge clk)
        begin
            if(reset) state<=Byte1;
            else state<=next_state;
        end 
    // Output logic
    assign done = (state == Done)?1'b1:1'b0;
    // New: Datapath to store incoming bytes.
    always@(posedge clk)
        begin
            case(state)
                2'd0: out_bytes[23:16]<=in;
                2'd1: out_bytes[15:8]<=in;
                2'd2: out_bytes[7:0]<=in;
                2'd3: out_bytes[23:16]<=in;
                default: out_bytes[23:16]<=in;
            endcase
        end 
endmodule
