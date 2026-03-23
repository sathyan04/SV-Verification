class monitor #(depth, data_width);
  
  transaction #(depth, data_width) w_tr, r_tr;
  
  virtual inter.wm wm1;
  virtual inter.rm rm1;
  
  mailbox w_montosco;
  mailbox r_montosco;
  
  event w_dr_done;
  event r_dr_done;
  event w_mo_done;
  event r_mo_done;
  
  function new(mailbox w_montosco, 
               mailbox r_montosco, 
               virtual inter.wm wm1, 
               virtual inter.rm rm1,
               event w_dr_done, 
               event r_dr_done,
               event w_mo_done,
               event r_mo_done
              );
    this.w_montosco	= w_montosco;
    this.r_montosco	= r_montosco;
    this.wm1 		= wm1;
    this.rm1 		= rm1;
    this.w_dr_done 	= w_dr_done;
    this.r_dr_done 	= r_dr_done;
    this.w_mo_done 	= w_mo_done;
    this.r_mo_done 	= r_mo_done;
  endfunction
  
  task main();
    fork
      wmain();
      rmain();
    join
  endtask
  
  task wmain();
    for(int i=0; i<(depth); i++) begin
      @(w_dr_done);
      @(posedge wm1.wclk);
      w_tr = new();
      w_tr.wrst 		= wm1.w_monit.wrst;
      w_tr.w_en 		= wm1.w_monit.w_en;
      w_tr.data_in		= wm1.w_monit.data_in;
      w_tr.full			= wm1.w_monit.full;
      w_montosco.put(w_tr);
      w_tr.wdisplay("Monitor Write");
      ->w_mo_done;
    end
  endtask
  
  task rmain();
    for(int i=0; i<(depth); i++) begin
      @(r_dr_done);
      @(posedge rm1.rclk);
      r_tr = new();
      r_tr.rrst 		= rm1.r_monit.rrst;
      r_tr.r_en 		= rm1.r_monit.r_en;
      r_tr.data_out 	= rm1.r_monit.data_out;
      r_tr.empty		= rm1.r_monit.empty;
      r_montosco.put(r_tr);
      r_tr.rdisplay("Monitor Read");
      ->r_mo_done;
    end
  endtask
  
endclass
