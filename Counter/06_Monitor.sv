class monitor;
  transaction tr;
  mailbox montosco;
  virtual inter.moni intr;
  event dr_done;
  event mo_done;

  function new(mailbox montosco, virtual inter.moni intr, event dr_done, event mo_done);
    this.montosco	=	montosco;
    this.intr		=	intr;
    this.dr_done	=	dr_done;
    this.mo_done	=	mo_done;
  endfunction

  task main();
    repeat(10) begin
      @dr_done;
      tr = new();
      @(posedge intr.clk);
      tr.rst_n	<=	intr.rst_n;
      tr.en		<=	intr.en;
      tr.count	<=	intr.count;
      montosco.put(tr);
      tr.display("Driver");
      ->mo_done;
    end
  endtask

endclass
