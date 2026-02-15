class monitor;
  virtual variables inter;
  transaction trans;
  mailbox montoscore;
  
  function new(virtual variables inter, mailbox montosco);
    this.inter=inter;
    this.montoscore=montoscore;
  endfunction
  
  task main();
    repeat(6) begin
      trans=new();
      trans.a=inter.a;
      trans.b=inter.b;
      trans.sum=inter.sum;
      trans.carry=inter.carry;
      montoscore.put(trans);
      trans.display("Monitor");
      #2;
    end
  endtask
  
endclass
