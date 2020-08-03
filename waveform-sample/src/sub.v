module sub (clk);

input clk;

reg reset = 1;

reg bit_random=0;
reg bit_random_reset;
reg bit_special;
reg bit_full=0;
reg bit_full_reset=0;

reg [7:0] byte_random = 8'h0;
reg [7:0] byte_random_reset = 8'h0;
reg [7:0] byte_special;
reg [7:0] byte_full=8'h0;
reg [7:0] byte_full_reset;


reg [31:0] random = 32'h0;
reg [31:0] counter  = 32'h0;
reg [31:0] counter_reverse  = 32'h0;

initial
    #($urandom_range(100,1000)*1ns) reset <= 0;

always @(posedge clk)
    begin : COUNTERS
        counter <= counter+1;
        counter_reverse <= counter_reverse -1;
    end

always @(posedge clk)
    begin : BITS
        bit_random <= $random();    
        bit_special <= random_bit_x_and_z();
        bit_full <= random_bit_four_values();
        if (!reset) 
        begin
            bit_random_reset <= $random();
            bit_full_reset <= random_bit_four_values();
        end

    end
    
always @(posedge clk)
    begin : BYTES
        byte_random <= $random();   
        byte_special <= random_byte_x_and_z();
        byte_full <= random_byte_four_values();
        if (!reset) 
        begin
            byte_random_reset <= $random();
            byte_full_reset <= random_byte_four_values();
        end
    end


function random_bit_four_values;
    case ($urandom_range(0,3))
        0 : random_bit_four_values = 1'b0;
        1 : random_bit_four_values = 1'b1;
        2 : random_bit_four_values = 1'bx;
        3 : random_bit_four_values = 1'bz;
    endcase
endfunction

function random_bit_x_and_z;
    case ($urandom_range(0,1))
        0 : random_bit_x_and_z = 1'bx;
        1 : random_bit_x_and_z = 1'bz;
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

function [3:0] random_byte_four_values;
    reg [2:0] data = $random();
    case ($urandom_range(0,10))
        0 : random_byte_four_values = 4'hx; //Full X
        default: random_byte_four_values = $random();
    endcase
endfunction


endmodule
