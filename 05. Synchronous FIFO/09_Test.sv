`include "environment.sv"

program test #(length,location) (variable intr);
  environment #(length,location) env;
  initial begin
    env = new(intr.tb_drive, intr.tb_monit);
    env.start();
  end
endprogram
