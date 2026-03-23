class generator #(depth, data_width);
  
  transaction #(depth, data_width) w_tr, r_tr;
  
  mailbox w_gentodri;
  mailbox r_gentodri;
  
  event w_sb_done;
  event r_sb_done;
  
  /*
  events to tell that generator should wait for scoreboard to finish,
  to generate another transaction
  */
  
  function new(mailbox w_gentodri, 
               mailbox r_gentodri, 
               event w_sb_done, 
               event r_sb_done
              );
    this.w_gentodri	= w_gentodri;
    this.r_gentodri	= r_gentodri;
    this.w_sb_done 	= w_sb_done;
    this.r_sb_done 	= r_sb_done;
  endfunction
  
  task main();
    fork
      w_main();
      r_main();
    join
  endtask
  
  task w_main();
    for(int i=0; i<depth; i++) begin
      w_tr = new();
      if(i==0) begin
        w_tr.rst_c.constraint_mode(1);
        w_tr.w_c.constraint_mode(0);
        w_tr.r_c.constraint_mode(0);
        w_tr.randomize();
        w_gentodri.put(w_tr);
      end
      else begin
        w_tr.rst_c.constraint_mode(0);
        w_tr.w_c.constraint_mode(1);
        w_tr.r_c.constraint_mode(0);
        w_tr.randomize();
        w_gentodri.put(w_tr);
      end
      w_tr.wdisplay("Generator write");
      @(w_sb_done);
    end
  endtask
  
  task r_main();
    for(int i=0; i<depth; i++) begin
      r_tr = new();
      if(i==0) begin
        r_tr.rst_c.constraint_mode(1);
        r_tr.w_c.constraint_mode(0);
        r_tr.r_c.constraint_mode(0);
        r_tr.randomize();
        r_gentodri.put(r_tr);
      end
      else begin
        r_tr.rst_c.constraint_mode(0);
        r_tr.w_c.constraint_mode(0);
        r_tr.r_c.constraint_mode(1);
        r_tr.randomize();
        r_gentodri.put(r_tr);
      end
      r_tr.rdisplay("Generator read");   
      @(r_sb_done);
    end
  endtask
  
endclass
