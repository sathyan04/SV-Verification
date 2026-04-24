interface inter;
  logic clk;
  logic rst_n;
  logic en;
  logic [3:0] count;
  
  modport dut(input clk, rst_n, en, output count);
  modport tst(input clk, count, output rst_n, en);
  modport moni(input clk, rst_n, en, count);
  
endinterface
