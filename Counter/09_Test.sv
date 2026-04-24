`include "environment.sv"

program test(inter intr);
  environment env;
  initial begin
    env = new(intr.tst, intr.moni);
    env.start();
  end
endprogram
