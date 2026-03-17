interface variable #(parameter length=8, parameter location=4);
  logic clk;
  logic rst;
  logic [length-1:0] in;
  logic [length-1:0] out;
  logic w_en;
  logic r_en;
  logic full;
  logic empty;
  
  clocking drive @(negedge clk);
    default input #0 output #1; 
    //
    input out; 
    input full; 
    input empty;
    //
    output rst; 
    output w_en; 
    output r_en; 
    output in;
  endclocking
  
  clocking monit @(posedge clk);
    default input #0;
    //
    input rst; 
    input w_en; 
    input r_en; 
    input in; 
    input out; 
    input full; 
    input empty;
  endclocking
  
  modport tb_drive ( clocking drive, input clk );
  
  modport tb_monit ( clocking monit, input clk );
  
  modport dut(input clk, rst, w_en, r_en, in, output out, full, empty);
  
endinterface
