class driver;
  transaction tr;
  mailbox gentodri;
  virtual inter.tst intr;
  event dr_done;
  
  function new(mailbox gentodri, virtual inter.tst intr, event dr_done);
    this.gentodri	=	gentodri;
    this.intr		=	intr;
    this.dr_done	=	dr_done;
  endfunction
  
  task main();
    repeat(10) begin
      gentodri.get(tr);
      @(negedge intr.clk);
      intr.rst_n	<=	tr.rst_n;
      intr.en		<=	tr.en;
      tr.display("Driver");
      ->dr_done;
    end
  endtask
  
endclass
