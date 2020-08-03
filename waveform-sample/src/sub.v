module sub (clk);

input clk;

reg reset = 1;

reg bit_two_values=0;
reg bit_x_then_two_value;
reg bit_4_values;

reg [7:0] byte_random;

reg [31:0] counter  = 32'h0;
reg [31:0] counter_reverse  = 32'h0;

initial
    #($urandom_range(10,500)*1ns) reset <= 0;

always @(posedge clk)
    begin : COUNTERS
        counter <= counter+1;
        counter_reverse <= counter_reverse -1;
    end

always @(posedge clk)
    begin : BITS
        bit_two_values <= $random();    
        if (!reset) bit_x_then_two_value <= $random();

    end
    
always @(posedge clk)
    begin : BYTES
        byte_random <= $random();    
    end

endmodule
