`include "environment.sv"

program test #(depth, data_width) (inter intr);
  environment #(depth, data_width) env;
  initial begin
    env = new(intr.wd, intr.rd, intr.wm, intr.rm);
    env.start();
    #500;
    $finish;
  end
endprogram
