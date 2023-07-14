module top_module (
    input clk,
    input reset,
    input enable,
    output [3:0] Q,
    output c_enable,
    output c_load,
    output [3:0] c_d
);
    reg e;
    always@(enable)
        begin e<=enable; end
    always@(posedge clk)
        begin
            if(reset) Q<=4'd1;
            else if(Q == 4'd12 && enable) Q<=4'd1;
            else if(enable) Q<=Q+4'd1;
        end
    assign c_d = c_load?1'b1:1'b0;
    assign c_enable = enable;
    assign c_load = reset|(enable && Q == 4'd12);
    count4 the_counter (clk, c_enable, c_load, c_d /*, ... */ );

endmodule
