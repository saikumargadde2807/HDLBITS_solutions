module top_module(
    input clk,
    input areset,    // Asynchronous reset to state B
    input in,
    output out);//  

    parameter A=1'b0, B=1'b1; 
    reg state, next_state;

    always @(*) begin    // This is a combinational always block
        case(state)
            A:next_state = in?A:B;
            B:next_state = in?B:A;
        endcase
    end

    always @(posedge clk, posedge areset) begin    // This is a sequential always block
        if(areset) state<=B;
        else state<=next_state;
    end

    // Output logic
    assign out = (state == B)?1'b1:1'b0;

endmodule
