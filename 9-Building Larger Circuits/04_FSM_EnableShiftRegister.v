module top_module (
    input clk,
    input reset,      // Synchronous reset
    output shift_ena);
    parameter A=0, B=1, C=2, D=3, E=4;
    reg [2:0] s,ns;
    always@(posedge clk)
        begin
            if(reset) s<=A;
            else s<=ns;
        end
    always@(*)
        begin
            case(s)
                A:begin ns<=B; shift_ena<=1'b1;end
                B:begin ns<=C; shift_ena<=1'b1;end
                C:begin ns<=D; shift_ena<=1'b1;end
                D:begin ns<=E; shift_ena<=1'b1;end
                E:begin ns<=E; shift_ena<=1'b0;end
                default: ns<=A;
            endcase
        end
endmodule
