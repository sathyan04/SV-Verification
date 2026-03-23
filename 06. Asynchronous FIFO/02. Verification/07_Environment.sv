`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment #(depth, data_width);
  generator #(depth, data_width) gen;
  driver #(depth, data_width) dri;
  monitor #(depth, data_width) mon;
  scoreboard #(depth, data_width) sco;
  
  mailbox w_gentodri;
  mailbox r_gentodri;
  mailbox w_montosco;
  mailbox r_montosco;
  
  virtual inter.wd wd1;
  virtual inter.rd rd1;
  virtual inter.wm wm1;
  virtual inter.rm rm1;
  
  event w_dr_done;
  event r_dr_done;
  event w_mo_done;
  event r_mo_done;
  event w_sb_done;
  event r_sb_done;
  
  function new(virtual inter.wd wd1, 
               virtual inter.rd rd1, 
               virtual inter.wm wm1, 
               virtual inter.rm rm1
              );
    this.wd1 = wd1;
    this.rd1 = rd1;
    this.wm1 = wm1;
    this.rm1 = rm1;
    
    w_gentodri 	= new();
    r_gentodri 	= new();
    w_montosco 	= new();
    r_montosco 	= new();
    
    gen = new(w_gentodri, 
              r_gentodri, 
              w_sb_done, 
              r_sb_done
             );
    dri = new(w_gentodri, 
              r_gentodri, 
              wd1, 
              rd1, 
              w_dr_done, 
              r_dr_done
             );
    mon = new(w_montosco, 
              r_montosco, 
              wm1, 
              rm1, 
              w_dr_done, 
              r_dr_done, 
              w_mo_done, 
              r_mo_done
             );
    sco = new(w_montosco, 
              r_montosco, 
              w_sb_done, 
              r_sb_done, 
              w_mo_done, 
              r_mo_done
             );
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
