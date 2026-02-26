class monitor;
  transaction tr;
  mailbox montosco;
  virtual variable intf;
  
  function new(mailbox montosco, virtual variable intf);
    this.montosco = montosco;
    this.intf=intf;
  endfunction 
  
  task main();
    repeat(10) begin
      @(posedge intf.clk);
      tr=new();
      tr.rst=intf.rst;
      tr.d=intf.d;
      tr.q=intf.q;
      montosco.put(tr);
      //tr.display("Monitor");
      //#3;
    end
  endtask
  
endclass
