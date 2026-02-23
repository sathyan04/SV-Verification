`include "environment.sv"

program test (variable intf);
  environment env;
  
  initial begin
    env = new(intf);
    env.run();
  end
  
endprogram
