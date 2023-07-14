module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output [7:0] out_byte,
    output done
); //
    integer i;
    // Use FSM from Fsm_serial
    parameter start = 2'd0,data = 2'd1,stop = 2'd2,error = 2'd3;
    reg [1:0] state,next_state;
    reg [3:0] count;
    reg [7:0] out_byte1;
    always @(*) begin
        case (state)
            start:next_state <= in?start:data;
            data:begin next_state <= count<8?data:(in?stop:error);end
            stop:next_state <= in?start:data;
            error:next_state <= in?start:error;
            default:next_state <= start;
        endcase
    end
    always @(posedge clk) begin
        if (reset)
            state <= start;
        else
            state <= next_state;
    end
    always @(posedge clk) begin
        if(reset)begin
            count <= 4'd0;
            i<=0;
        end
            else if (state == data)begin
            count <= count+1'b1;
                out_byte1[i]<=in;
                i<=i+1;
            end
        else begin count <= 4'd0; i<=0; end
    end
    assign done = (state == stop);

    // New: Datapath to latch input bits.
     assign out_byte = done?out_byte1:8'd0;     

endmodule
