`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"
class environment;
  generator gen;
  driver dri;
  monitor mon;
  scoreboard sco;
  
  mailbox gentodri;
  mailbox montosco;
  
  virtual variable.tb intr;
  
  function new(virtual variable.tb intr);
    
    this.intr = intr;
    
    gentodri = new();
    montosco = new();
    
    gen = new(gentodri);
    dri = new(gentodri,intr);
    mon = new(montosco,intr);
    sco = new(montosco);
    
  endfunction
  
  task start();
    fork
      gen.main();
      dri.main();
      mon.main();
      sco.main();
    join
  endtask
  
endclass
