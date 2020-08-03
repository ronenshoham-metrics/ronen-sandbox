`timescale 1ns/1ns

module top;

    reg only_0 = 1'b0;
    reg only_1 = 1'b1;
    reg only_x = 1'bx;
    reg only_z = 1'bz;

    reg fast_clk, medium_clk, slow_clk;

    sub sub_fast(.clk (fast_clk));
    sub sub_medium(.clk (medium_clk));
    sub sub_slow(.clk (slow_clk));


    initial 
    begin : CLOCKS
        fast_clk = 0; medium_clk = 0; slow_clk = 0;
        forever 
        begin
            fast_clk = #5 ~fast_clk;
            medium_clk = #500 ~medium_clk;
            slow_clk = #5000 ~slow_clk;
        end
    end

    initial 
    begin : RUN
        $display ("Running for 100,000ns");
        #100000; 
        $display ("Stoping run");
        $finish;
    end


endmodule
