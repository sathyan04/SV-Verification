`timescale 1ns/1ps
`include "test.sv"
module testbench;
  variable intr();
  siso regi(intr.dut);
  test t(intr.tb);
  
  initial begin
    intr.clk = 0;
    forever #10 intr.clk = ~intr.clk;
  end
  
  initial begin
    $dumpfile("siso.vcd");
    $dumpvars(0);
    intr.rst = 0;
    #20;
    intr.rst = 1;
    #1000 $finish;
  end
  
endmodule
