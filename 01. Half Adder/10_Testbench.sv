`include "test.sv"

module testbench();
  variable intf();
  test tst(intf);
  
  ha dut(intf);
  
  initial begin
    $dumpfile("verify.vcd");
    $dumpvars(0);
  end
  
endmodule
