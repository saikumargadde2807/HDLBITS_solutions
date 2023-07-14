module top_module ();
    reg clk,reset,t;
    wire q;
    tff DUT(clk,reset,t,q);
    initial clk=1'b0;
    always #5 clk=~clk;
    initial begin
        reset = 1'b0;
        #5;
        reset = 1'b1;
        #10;
        reset = 1'b0;   
    end
    
    always@(posedge clk)begin
        if(reset)begin
            t <= 1'b0;
        end
        else begin
            t <= 1'b1;
        end
    end
endmodule
