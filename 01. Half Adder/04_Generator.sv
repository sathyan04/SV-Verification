class generator;
  transaction trans;
  mailbox gentodri;
  
  function new(mailbox gentodri);
    this.gentodri=gentodri;
  endfunction
  
  task main();
    repeat(6)
      begin
        trans=new();
        trans.randomize();
        trans.display("Generator");
        gentodri.put(trans);
        #3;
      end
  endtask

endclass
