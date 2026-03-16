`include "environment.sv"

program test(variable.tb intr);
  environment env;
  initial begin
    env = new(intr);
    env.start();
  end
endprogram
