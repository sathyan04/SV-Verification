`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"

class agent;
  generator gen;
  driver dri;
  monitor mon;
  
  mailbox gentodri;
  mailbox montosco;
  
  virtual variable intf;
  
  function new(virtual variable intf);
    this.intf = intf;
    
    gentodri = new();
    montosco = new();
    
    gen = new(gentodri);
    dri = new(gentodri, intf);
    mon = new(montosco, intf);

  endfunction 
  
  task go();
    fork 
      gen.main();
      dri.main();
      mon.main();
    join
  endtask
  
endclass
