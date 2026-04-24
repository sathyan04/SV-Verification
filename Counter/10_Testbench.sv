`include "test.sv"

module testbench();
  inter intr();
  test t(intr);
  
  counter cou (intr.dut);
  
  initial begin
    intr.clk = 0;
    forever #10 intr.clk = ~intr.clk;
  end
  
  initial begin
    $dumpfile("waveform.vcd");
    $dumpvars(0);
  end
  
endmodule
