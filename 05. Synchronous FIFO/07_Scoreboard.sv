class scoreboard #(length,location);
  transaction #(length,location) tr;
  mailbox montosco;
  
  function new(mailbox montosco);
    this.montosco = montosco;
  endfunction
  
  task main();
    $display("");
    for(int i=0; i<=(location*2); i++) begin
      montosco.get(tr);
      tr.display();	
    end
    $display("");
  endtask
  
endclass
