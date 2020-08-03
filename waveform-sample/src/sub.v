module sub (clk);

input clk;

reg reset = 1;

reg bit_two_values=0;
reg bit_x_then_two_value;
reg bit_4_values;

reg [7:0] byte_random;
reg [7:0] byte_x_z;

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
        bit_4_values <= random_bit_four_values();
        if (!reset) bit_x_then_two_value <= $random();
    end
    
always @(posedge clk)
    begin : BYTES
        byte_random <= $random();   
        byte_x_z <= random_byte_x_and_z();
    end


function random_bit_four_values;
    case ($urandom_range(0,3))
        0 : random_bit_four_values = 1'b0;
        1 : random_bit_four_values = 1'b1;
        2 : random_bit_four_values = 1'bx;
        3 : random_bit_four_values = 1'bz;
    endcase
endfunction


function [3:0] random_nible_x_and_z;
    reg [2:0] data = $random();
    case ($urandom_range(0,3))
        0 : random_nible_x_and_z = 4'hx; //Full X
        1 : random_nible_x_and_z = {data,1'bx}; // Partial X
        2 : random_nible_x_and_z = 4'hz; // Full Z
        3 : random_nible_x_and_z = {data,1'bz}; // Partial Z
    endcase
endfunction

function random_byte_x_and_z;
    random_byte_x_and_z = {random_nible_x_and_z(), random_nible_x_and_z()};
endfunction


endmodule
