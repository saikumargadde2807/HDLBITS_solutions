module top_module (
    input clk,
    input a,
    output [3:0] q );
    always@(posedge clk)
        begin
            if(!a) 
            begin 
                if(q == 4'd6) q<=4'd0;
                else q<=q+4'd1;
            end
            else q<=4'd4;
        end
endmodule
