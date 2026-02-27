class generator;
  transaction tr;
  mailbox gentodri;
  
  function new(mailbox gentodri);
    this.gentodri = gentodri;
  endfunction
  
  task main();
    repeat(4) begin
      tr = new();
      tr.randomize();
      gentodri.put(tr);
      //tr.display("Generator");
      //#3;
    end
  endtask
  
endclass
