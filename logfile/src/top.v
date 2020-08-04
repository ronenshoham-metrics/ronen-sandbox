`timescale 1ns/1ns

module top;
    
    reg clk;

    subA subA1(.clk (clk));
    subA subA2(.clk (clk));
    subA subA3(.clk (clk));


    initial 
    begin : CLOCK
        clk = 0;
        forever clk = #10 ~clk;
    end  
    
    initial 
    begin : RUN
        $display ("Running for 10,000ns");
        #10000; 
        $display ("Stoping run");
        $finish;
    end


endmodule
