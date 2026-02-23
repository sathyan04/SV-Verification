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
  
  virtual variable intf;
  
  function new(virtual variable intf);
    gentodri = new();
    montosco = new();
    gen = new(gentodri);
    dri = new(intf,gentodri);
    mon = new(intf,montosco);
    sco = new(montosco);
  endfunction
  
  task run();
    fork
      gen.main();
      dri.main();
      mon.main();
      sco.main();
    join
  endtask

endclass
