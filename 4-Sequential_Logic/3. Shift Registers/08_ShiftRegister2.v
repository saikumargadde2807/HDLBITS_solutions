module top_module (
    input [3:0] SW,
    input [3:0] KEY,
    output [3:0] LEDR
); //
    always@(posedge KEY[0])
        begin
            LEDR[3]<=KEY[2]?SW[3]:(KEY[1]?KEY[3]:LEDR[3]);
            LEDR[2]<=KEY[2]?SW[2]:(KEY[1]?LEDR[3]:LEDR[2]);
            LEDR[1]<=KEY[2]?SW[1]:(KEY[1]?LEDR[2]:LEDR[1]);
            LEDR[0]<=KEY[2]?SW[0]:(KEY[1]?LEDR[1]:LEDR[0]);
        end
endmodule