module top_module();
    reg [1:0] in;
    wire out;
    andgate DUT(in, out);
    initial begin
        {in[1],in[0]} = 2'b00;
        #10 {in[1],in[0]} = 2'b01;
        #10 {in[1],in[0]} = 2'b10;
        #10 {in[1],in[0]} = 2'b11;
    end
endmodule
