class driver;
  transaction tr;
  mailbox gentodri;
  virtual variable intf;
  
  function new(mailbox gentodri, virtual variable intf);
    this.gentodri = gentodri;
    this.intf = intf;
  endfunction
  
  task main();
    repeat(10) begin
      @(posedge intf.clk);
      gentodri.get(tr);
      intf.rst = tr.rst;
      intf.d = tr.d;
      //tr.display("Driver");
      //#3;
    end
  endtask
  
endclass
