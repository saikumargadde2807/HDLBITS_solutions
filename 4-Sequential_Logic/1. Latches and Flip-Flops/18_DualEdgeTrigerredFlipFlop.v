module top_module (
    input clk,
    input d,
    output q
);
    
     reg temp1, temp2;
	 always @(posedge clk)
         begin temp1 <= d;end
	 
	 always @(negedge clk)
		begin temp2 <= d;end
	 
	 always @(clk) begin
		if(clk)
			q = temp1;
		else
			q = temp2;
	 end

endmodule