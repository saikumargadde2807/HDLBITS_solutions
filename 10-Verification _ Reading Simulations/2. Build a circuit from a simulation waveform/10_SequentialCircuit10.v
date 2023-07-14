module top_module (
    input clk,
    input a,
    input b,
    output q,
    output state  );
    wire [1:0] s;
    //reg x,y;
    assign s = {a,b};
    always@(posedge clk)
        begin
            if(s == 2'd0) state<=1'b0;
            else if(s==2'd3) state<=1'b1;
        end
    always@(*)
        begin
       case(state)
                1'b0: q<=a^b;
           1'b1:q<=~(a^b);
       endcase  
        end
endmodule