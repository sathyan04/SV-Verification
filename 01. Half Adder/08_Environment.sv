`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  transaction trans;
  virtual variables inter;
  generator gener;
  driver drive;
  monitor monit;
  scoreboard score;
  mailbox gentodri;
  mailbox montoscore;
  
  function new(virtual variables inter);
    this.inter=inter;
    gentodri=new();
    montoscore=new();
    gener=new(gentodri);
    drive=new(inter, gentodri);
    monit=new(montoscore);
    score=new(inter, montoscore);
  endfunction
  
  task test();
    fork
      gener.main();
      drive.main();
      monit.main();
      score.main();
    join
  endtask
  
endclass
