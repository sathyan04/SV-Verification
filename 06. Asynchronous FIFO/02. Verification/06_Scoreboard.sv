class scoreboard #(depth, data_width);
  
  transaction #(depth, data_width) w_tr, r_tr;
  
  mailbox w_montosco;
  mailbox r_montosco;
  
  event w_sb_done;
  event r_sb_done;
  event w_mo_done;
  event r_mo_done;
  
  function new(mailbox w_montosco, 
               mailbox r_montosco,
               event w_sb_done,
               event r_sb_done,
               event w_mo_done,
               event r_mo_done
              );
    this.w_montosco = w_montosco;
    this.r_montosco = r_montosco;
    this.w_sb_done	= w_sb_done;
    this.r_sb_done	= r_sb_done;
    this.w_mo_done	= w_mo_done;
    this.r_mo_done	= r_mo_done;
  endfunction
  
  task main();
    fork
      wmain();
      rmain();
    join
  endtask
  
  task wmain();
    for(int i=0; i<depth; i++) begin
      @(w_mo_done);
      w_montosco.get(w_tr);
      w_tr.wdisplay("Scoreboard Write");
      ->w_sb_done;
    end
  endtask
  
  task rmain();
    for(int i=0; i<depth; i++) begin
      @(r_mo_done);
      r_montosco.get(r_tr);
      r_tr.rdisplay("Scoreboard Read");
      ->r_sb_done;
    end
  endtask
  
endclass
