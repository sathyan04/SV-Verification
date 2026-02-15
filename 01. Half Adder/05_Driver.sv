class driver;
  virtual variables inter;
  transaction trans;
  mailbox gentodri;
  
  function new(virtual variables inter, mailbox gentodri);
    this.inter=inter;
    this.gentodri=gentodri;
  endfunction
  
  task main();
    repeat(6)
      begin
        gentodri.get(trans);
        inter.a=trans.a;
        inter.b=trans.b;
        trans.display("Driver");
      end
  endtask
  
endclass
