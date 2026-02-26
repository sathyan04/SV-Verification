`include "transaction.sv"
`include "agent.sv"
`include "scoreboard.sv"

class environment;
  agent ag;
  scoreboard sco;
  
  virtual variable intf;
  
  function new(virtual variable intf);
    this.intf = intf;
    ag = new(intf);
    sco = new(ag.montosco);
  endfunction
  
  task start();
    fork
      ag.go();
      sco.main();
    join
  endtask
  
endclass
