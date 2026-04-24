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

  virtual inter.tst tintr;
  virtual inter.moni mintr;

  event dr_done;
  event mo_done;
  event sb_done;
  
  function new(virtual inter.tst tintr, virtual inter.moni mintr);
    
    this.tintr	=	tintr;
    this.mintr	=	mintr;

    gentodri	=	new();
    montosco	=	new();

    gen	=	new(gentodri, sb_done);
    dri	=	new(gentodri, tintr, dr_done);
    mon	=	new(montosco, mintr, dr_done, mo_done);
    sco	=	new(montosco, mo_done, sb_done);
    
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
