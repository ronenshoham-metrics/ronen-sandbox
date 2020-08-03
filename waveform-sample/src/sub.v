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


reg [31:0] dword_random = 32'h0;
reg [31:0] dword_random_reset;
reg [31:0] dword_counter  = 32'h0;
reg [31:0] dword_counter_reverse  = 32'hFFFF;
reg [31:0] dword_full = 32'h0;
reg [31:0] dword_full_reset;


initial
    #($urandom_range(100,1000)*1ns) reset <= 0;

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

always @(posedge clk)
    begin : DWORD
        dword_random <= $random();
        dword_counter <= dword_counter+1;
        dword_counter_reverse <= dword_counter_reverse -1;
        dword_full <= random_dword_four_values();
        if (!reset) 
        begin
            dword_random_reset <= $random();
            dword_full_reset <= random_dword_four_values();
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

function [7:0] random_byte_x_and_z;
    case ($urandom_range(0,9))
        0 : random_byte_x_and_z = 8'hxx; //Full X
        1 : random_byte_x_and_z = 8'hzz; // Full Z
        default : random_byte_x_and_z = {random_nible_x_and_z(), random_nible_x_and_z()};
    endcase
    
endfunction

function [7:0] random_byte_four_values;
    case ($urandom_range(0,9))
        0 : random_byte_four_values = random_byte_x_and_z();
        default: random_byte_four_values = $random();
    endcase
endfunction

function [31:0] random_dword_four_values;
    case ($urandom_range(0,19))
        0 : random_dword_four_values = 32'hxxxx;
        1 : random_dword_four_values = 32'hzzzz;
        2,3,4,5 : random_dword_four_values = {random_byte_four_values(),random_byte_four_values(),random_byte_four_values(),random_byte_four_values()};
        default: random_dword_four_values = $random();
    endcase
endfunction

endmodule
