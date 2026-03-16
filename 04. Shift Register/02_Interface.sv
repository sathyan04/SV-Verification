interface variable;
  
  logic sin;
  logic clk;
  logic rst;
  logic sout;
  
  modport dut(input sin,clk,rst, output sout);
  modport tb(output sin,clk,rst, input sout);

endinterface
