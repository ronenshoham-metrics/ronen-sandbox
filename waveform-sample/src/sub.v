module sub (clk);

input clk;

reg [31:0] counter1  = 32'h0;

always @(posedge clk)
    counter1 <= counter1 +1;



endmodule
