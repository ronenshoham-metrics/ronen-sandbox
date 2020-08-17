module subA (clk, in_bit1, out_bit1);

input clk;
input in_bit1;
output out_bit1;

reg out_bit1;

wire reg_bit1, reg_bit2, reg_bit3, reg_bit4;
reg [7:0] reg_byte1, reg_byte2, reg_byte3, reg_byte4;

assign reg_bit1 = in_bit1;
assign reg_bit2 = reg_bit1;
assign reg_bit3 = reg_bit2;
assign reg_bit4 = ~reg_bit3;

assign out_bit1 = reg_bit4;

assign reg_byte1 = {reg_bit4, reg_bit3, reg_bit2, reg_bit2, reg_bit1, !reg_bit4, !reg_bit3, !reg_bit2, !reg_bit2, !reg_bit1};

always @(posedge clk)
    reg_byte2 = reg_byte1;

always @(posedge clk)
    reg_byte3 = reg_byte1;

endmodule
