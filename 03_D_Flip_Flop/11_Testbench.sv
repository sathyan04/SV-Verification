`include "test.sv"

module test_bench();
  variable intf();
  test te(intf);
  d_flip_flop dut(intf);
  
  initial begin
    intf.clk = 0;
    forever #5 intf.clk = ~intf.clk;
  end
  
  initial begin
    $dumpfile("testing.vcd");
    $dumpvars();
    intf.rst=0;
    #10;
    intf.rst=1;
    #1000 $finish;
  end
  
endmodule
