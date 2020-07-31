`timescale 1ns/1ns

module top;

    reg fast_clk, medium_clk, slow_clk;

    sub sub_fast(.clk (fast_clk));
    sub sub_medium(.clk (medium_clk));
    sub sub_slow(.clk (slow_clk));


    initial 
    begin : FAST_CLOCK
        fast_clk = 0; medium_clk = 0; slow_clk = 0;
        forever fast_clk = #5 ~fast_clk;
    end  
    
    initial 
    begin : MEDIUM_CLOCK
        forever medium_clk = #500 ~medium_clk;
    end

    initial 
    begin : SLOW_CLOCK
        forever slow_clk = #5000 ~slow_clk;
    end

    initial 
    begin : RUN
        $display ("Running for 100,000ns");
        #100000; 
        $display ("Stoping run");
        $finish;
    end


endmodule
