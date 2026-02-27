class scoreboard;
  transaction tr;
  mailbox montosco;
  
  function new(mailbox montosco);
    this.montosco = montosco;
  endfunction
  
  task main();
    repeat(4) begin
      montosco.get(tr);
      tr.display("Output from Scoreboard");
      #3;
    end
  endtask
  
endclass
