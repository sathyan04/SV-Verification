class generator;
  transaction tr;
  mailbox gentodri;
  
  function new(mailbox gentodri);
    this.gentodri = gentodri;
  endfunction
  
  task main();
    repeat (8) begin
      tr=new();
      assert(tr.randomize());
      gentodri.put(tr);
      #1;
    end
  endtask
  
endclass
