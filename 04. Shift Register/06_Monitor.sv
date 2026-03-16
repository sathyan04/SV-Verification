class monitor;
  transaction tr;
  virtual variable.tb intr;
  mailbox montosco;
  
  function new(mailbox montosco, virtual variable.tb intr);
    this.montosco = montosco;
    this.intr = intr;
  endfunction
  
  task main();
    repeat(10) begin
      @(posedge intr.clk);
      tr = new();
      tr.sin = intr.sin;
      tr.sout = intr.sout;
      montosco.put(tr);
    end
  endtask
  
endclass
