class scoreboard;
  mailbox montosco;
  
  function new(mailbox montosco);
    this.montosco=montosco;
  endfunction
  
  task main();
    transaction tr;
    repeat(8) begin
      montosco.get(tr);
      tr.display("Scoreboard");
      $display("\n");
      #3;
    end
  endtask
  
endclass
