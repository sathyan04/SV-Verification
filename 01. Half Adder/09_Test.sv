`include "environment.sv"
program test (variables inter);
  initial begin
    environment env;
    env=new(inter);
    env.test;
  end
endprogram
