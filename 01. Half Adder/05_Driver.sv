class driver;
  virtual variable intf;
  mailbox gentodri;
  
  function new (virtual variable intf, mailbox gentodri);
    this.intf = intf;
    this.gentodri = gentodri;
  endfunction
  
  task main();
    transaction tr;
    repeat(4) begin
      gentodri.get(tr);
      intf.a <= tr.a;
      intf.b <= tr.b;
      #1;
    end
  endtask
  
endclass
