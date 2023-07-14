// Note the Verilog-1995 module declaration syntax here:
module top_module(clk, reset, in, out);
    input clk;
    input reset;    // Synchronous reset to state B
    input in;
    output out;//  
    reg out;

    parameter A=1'b0, B=1'b1;

    reg present_state, next_state;

    always @(posedge clk) begin
        if (reset) begin  
            present_state <= B;
        end 
        else begin
            present_state = next_state; 
        end
    end
            
     always@(*)
            begin
            case (present_state)
                A: begin next_state <= in?A:B; out<=1'b0; end
                B: begin next_state <= in?B:A; out<=1'b1; end
            endcase
    end

endmodule
