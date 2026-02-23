class scoreboard;
  mailbox montosco;
  
  function new(mailbox montosco);
    this.montosco = montosco;
  endfunction
  
  task main();
    transaction tr;
    repeat(4) begin
      montosco.get(tr);
      tr.display("Output:");
      #1;
    end
  endtask
  
  endclass
