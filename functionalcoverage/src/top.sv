module top;
typedef enum { RED = 65, GREEN = 35, BLUE = 42, YELLOW = 99 } Color;
Color c = GREEN;

covergroup color_cg;
  option.per_instance = 1;
  type_option.merge_instances = 0;
  color_type: coverpoint c {ignore_bins my_ignore = {RED};}
endgroup

color_cg color_cg_inst1 = new();
color_cg color_cg_inst2 = new();

initial begin
  color_cg_inst1.sample();
  c = BLUE;
  color_cg_inst1.sample();
  c = YELLOW;
  color_cg_inst1.sample();
  c = RED;
  color_cg_inst1.sample();
  c = RED;
  color_cg_inst2.sample();
  c = BLUE;
  color_cg_inst2.sample();

end
endmodule
