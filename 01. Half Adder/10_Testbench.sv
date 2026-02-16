`include "interface.sv"
`include "test.sv"
module test_bench();
  variables inter();
  test t(inter);
  half_adder dut(inter);
  
  initial begin
    $dumpfile("adder.vcd");
    $dumpvars();
  end
  
endmodule
