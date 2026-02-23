class driver;
  virtual variable intf;
  mailbox gentodri;
  
  function new(virtual variable intf, mailbox gentodri);
    this.intf=intf;
    this.gentodri=gentodri;
  endfunction
  
  task main();
    transaction tr;
    repeat(8) begin
      gentodri.get(tr);
      intf.a<=tr.a;
      intf.b<=tr.b;
      intf.c<=tr.c;
      tr.display("Driver");
      #3;
    end
  endtask
  
endclass
