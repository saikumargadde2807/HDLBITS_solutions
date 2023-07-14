module top_module (
    input clk,
    input reset,
    input [31:0] in,
    output reg [31:0] out
);
  reg [31:0] previous_state;
  always @(posedge clk) begin
      previous_state <= in;
      if (reset)
      out <= 32'd0;
      else out <= out | (~in & previous_state);
  end
endmodule