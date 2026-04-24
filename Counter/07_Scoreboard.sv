class scoreboard;
  transaction tr;
  mailbox montosco;
  event mo_done;
  event sb_done;

  function new(mailbox montosco, event mo_done, event sb_done);
    this.montosco	=	montosco;
    this.mo_done	=	mo_done;
    this.sb_done	=	sb_done;
  endfunction

  task main();
    repeat(10) begin
      @mo_done;
      montosco.get(tr);
      tr.display("Generator");
      ->sb_done;
    end
  endtask
  
endclass
