class driver #(depth, data_width);
  
  transaction #(depth, data_width) w_tr, r_tr;
  
  virtual inter.wd wd1;
  virtual inter.rd rd1;
  
  mailbox w_gentodri;
  mailbox r_gentodri;
  
  event w_dr_done;
  event r_dr_done;
  
  function new(mailbox w_gentodri, 
               mailbox r_gentodri, 
               virtual inter.wd wd1, 
               virtual inter.rd rd1,
               event w_dr_done, 
               event r_dr_done
              );
    this.w_gentodri	= w_gentodri;
    this.r_gentodri	= r_gentodri;
    this.wd1 		= wd1;
    this.rd1 		= rd1;
    this.w_dr_done 	= w_dr_done;
    this.r_dr_done 	= r_dr_done;
  endfunction
  
  task main();
    fork
      wmain();
      rmain();
    join
  endtask
  
  task wmain();
    for(int i=0; i<depth; i++) begin
      w_gentodri.get(w_tr);
      @(negedge wd1.wclk);
      wd1.w_drive.wrst 		<= w_tr.wrst;
      wd1.w_drive.w_en 		<= w_tr.w_en;
      wd1.w_drive.data_in 	<= w_tr.data_in;
      w_tr.wdisplay("Driver write");
      ->w_dr_done;
    end
  endtask
  
  task rmain();
    for(int i=0; i<depth; i++) begin
      r_gentodri.get(r_tr);
      @(negedge rd1.rclk);
      rd1.r_drive.rrst <= r_tr.rrst;
      rd1.r_drive.r_en <= r_tr.r_en;
      r_tr.rdisplay("Driver read");
      ->r_dr_done;      
    end
  endtask
  
endclass
