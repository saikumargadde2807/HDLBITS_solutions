module top_module(
    input clk,
    input in,
    input reset,    // Synchronous reset
    output done
); 
    parameter start = 2'd0,data = 2'd1,stop = 2'd2,error = 2'd3;
    reg [1:0] state,next_state;
    reg [3:0] count;
    always @(*) begin
        case (state)
            start:next_state <= in?start:data;
            data:next_state <= count<8?data:(in?stop:error);
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
        if(reset)
            count <= 4'd0;
        else if (state == data)
            count <= count+1'b1;
        else count <= 4'd0;
    end
    assign done = (state == stop);
endmodule
