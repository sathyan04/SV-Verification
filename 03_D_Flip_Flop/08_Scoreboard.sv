class scoreboard;
  transaction tr;
  mailbox montosco;
  
  function new(mailbox montosco);
    this.montosco = montosco;
  endfunction
  
  task main();
    repeat(10) begin
      montosco.get(tr);
      tr.display("Output");
      
      //#3;
    end
  endtask
  
endclass
