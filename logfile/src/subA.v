module subA (clk);

input clk;

initial 
    $display ("I'm here!");
    //$display ("%t %m: I'm here!", $time);


always @(posedge clk)
    begin 
    if ($urandom_range(0,30) == 0)
        $display ("%t %m: Random message", $time);
    if ($urandom_range(0,100) == 0)
        $error ("Random error");
    end

endmodule
