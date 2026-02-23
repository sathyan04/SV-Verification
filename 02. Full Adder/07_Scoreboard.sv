class scoreboard;
  mailbox montosco;
  
  function new(mailbox montosco);
    this.montosco=montosco;
  endfunction
  
  task main();
    transaction tr;
    repeat(8) begin
      montosco.get(tr);
      tr.display("Adder Output");
      #1;
      if ({tr.carry, tr.sum} == tr.a + tr.b + tr.c)
        $display("~ Checking Pass ~\n");
      else
        $display("~ Checking Fail ~\n");
    end
  endtask
  
endclass
