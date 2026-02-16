class scoreboard;
  transaction trans;
  mailbox montoscore;
  
  function new(mailbox montoscore);
    this.montoscore=montoscore;
  endfunction
  
  task main();
    repeat(6) begin
      montoscore.get(trans);
      trans.display("Scoreboard");
      
      if ( ( (trans.a^trans.b)==trans.sum) && ( (trans.a&trans.b)==trans.carry ) ) 
        $display("Verification Success");
      else
        $display("Verification Failure");
    end
  endtask
  
endclass
