module top_module(
    input clk,
    input reset,
    input ena,
    output pm,
    output [7:0] hh,
    output [7:0] mm,
    output [7:0] ss); 
    always@(posedge clk)
        begin
            if(reset) begin hh[3:0]<=4'd2;hh[7:4]<=4'd1; mm<=8'h00; ss<=8'h00; pm<=1'b0; end
            else if(ena)
                begin
                    if(ss[3:0] != 4'd9) ss[3:0]<=ss[3:0]+4'd1;
                    else
                        begin
                            ss[3:0]<=4'd0;
                            ss[7:4]<=ss[7:4]+4'd1;
                            if(ss[7:4]== 4'd5) 
                                begin
                                    ss[7:4]<=4'd0;
                                    mm[3:0]<=mm[3:0]+4'd1;
                                    if(mm[3:0] == 4'd9)
                                        begin
                                            mm[3:0]<=4'd0;
                                            mm[7:4]<=mm[7:4]+4'd1;
                                            if(mm[7:4] == 4'd5)
                                                begin
                                                    mm[7:4]<=4'd0;
                                                    hh[3:0]<=hh[3:0]+4'd1;
                                                    if(hh[3:0] == 4'd9)
                                                        begin
                                                            hh[3:0]<=4'd0;
                                                            hh[7:4]<=hh[7:4]+4'd1;
                                                        end
                                                    if(hh[3:0] == 4'd1 && hh[7:4]==4'd1)
                                                        begin
                                                            pm<=~pm;
                                                            hh[3:0]<=4'd2;
                                                            hh[7:4]<=4'd1;
                                                        end
                                                    if(hh[3:0] == 4'd2 && hh[7:4]==4'd1)
                                                        begin
                                                            hh[3:0]<=4'd1;
                                                            hh[7:4]<=4'd0;
                                                        end
                                                end
                                        end
                                end
                        end
                end
        end
endmodule
