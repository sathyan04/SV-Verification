class driver;
  transaction tr;
  virtual variable.tb intr;
  mailbox gentodri;
  
  function new(mailbox gentodri, virtual variable.tb intr);
    this.gentodri = gentodri;
    this.intr = intr;
  endfunction
  
  task main();
    repeat(10) begin
      @(negedge intr.clk);
      gentodri.get(tr);
      intr.sin = tr.sin;
    end
  endtask
  
endclass
