module top_module(
    input clk,
    input load,
    input ena,
    input [1:0] amount,
    input [63:0] data,
    output reg [63:0] q); 
    always@(posedge clk)
        begin
            if(load) q<=data;
            else if(ena)
                begin
                    case(amount)
                        2'b00: {q[63:1],q[0]}<={q[62:0],1'b0};
                        2'b01: {q[63:8],q[7:0]}<={q[55:0],8'd0};
                        2'b10: q[62:0]<=q[63:1];
                        2'b11: {q[63:56],q[55:0]}<={{8{q[63]}},q[63:8]};
                        default:q<=q;
                    endcase
                end
        end
endmodule
