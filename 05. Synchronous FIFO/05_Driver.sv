class driver #(length,location);
  transaction #(length,location) tr;
  mailbox gentodri;
  virtual variable.tb_drive intr;
  
  function new(mailbox gentodri, virtual variable.tb_drive intr);
    this.gentodri = gentodri;
    this.intr = intr;
  endfunction
  
  task main();
    for(int i=0; i<(location*2); i++) begin
      @(negedge intr.clk);
      gentodri.get(tr);
      intr.drive.in		<=	tr.in;
      intr.drive.rst	<=	tr.rst;
      intr.drive.w_en	<=	tr.w_en;
      intr.drive.r_en	<=	tr.r_en;
    end
  endtask
  
endclass
