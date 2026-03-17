`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment #(length,location);
  generator #(length,location) gen;
  driver #(length,location) dri;
  monitor #(length,location) mon;
  scoreboard #(length,location) sco;
  
  mailbox gentodri;
  mailbox montosco;
  
  virtual variable.tb_drive intr1;
  virtual variable.tb_monit intr2;
  
  function new(virtual variable.tb_drive intr1, virtual variable.tb_monit intr2);
    this.intr1 = intr1;
    this.intr2 = intr2;
    
    gentodri = new();
    montosco = new();
    
    gen = new(gentodri);
    dri = new(gentodri, intr1);
    mon = new(montosco, intr2);
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
