class monitor;
  virtual variable intf;
  mailbox montosco;
  
  function new(virtual variable intf, mailbox montosco);
    this.intf = intf;
    this.montosco = montosco;
  endfunction
  
  task main();
    transaction tr;
    repeat(8) begin
      tr=new();
      
      tr.a = intf.a;
      tr.b = intf.b;
      tr.c = intf.c;
      tr.sum = intf.sum;
      tr.carry = intf.carry;
      
      montosco.put(tr);
      #1;
    end
  endtask
  
endclass
