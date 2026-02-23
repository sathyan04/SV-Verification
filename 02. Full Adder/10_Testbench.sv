`include "test.sv"

module test_bench();
  variable intf();
  test t(intf);
  full_adder dut(intf);
  initial begin
    $dumpfile("adder.vcd");
    $dumpvars();
  end
endmodule
