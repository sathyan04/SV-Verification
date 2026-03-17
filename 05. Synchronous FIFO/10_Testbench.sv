`include "test.sv"

module testbench();
  parameter length = 8;
  parameter location = 8;
  
  variable #(length,location) intr();
  test #(length,location) t(intr);
  fifo #(length,location) f(intr.dut);
  
  initial begin
    intr.clk = 1;
    forever #10 intr.clk = ~intr.clk;
  end
  
  initial begin
    $dumpfile("fifo.vcd");
    $dumpvars(0);
    intr.rst = 1;
    #1;
    intr.rst = 0;
    #1000 $finish;
  end
  
endmodule
