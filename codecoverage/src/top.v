`timescale 1ns/1ns

module top;
    
    reg clk;
    reg in_bit1;
    wire out_bit1;


    subA subA1(
        .clk (clk),
        .in_bit1 (in_bit1),
        .out_bit1 (out_bit1)
              );

    initial 
    begin : CLOCK
        clk = 0;
        forever clk = #10 ~clk;
    end  

    initial
        begin
            in_bit1 = 0;
            #100 in_bit1 = 1;
            #100 in_bit1 = 0;
            #100 in_bit1 = 1;
        end


    always @(out_bit1)
        $display ("out_bit1 changed");
    
    initial 
    begin : RUN
        $display ("Running for 1,000ns");
        #1000; 
        $display ("Stoping run");
        $finish;
    end


endmodule
