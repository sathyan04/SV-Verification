class monitor #(length,location);
  transaction #(length,location) tr;
  mailbox montosco;
  virtual variable.tb_monit intr;
  
  function new(mailbox montosco, virtual variable.tb_monit intr);
    this.montosco = montosco;
    this.intr = intr;
  endfunction

  task main();
    for(int i=0; i<=(location*2); i++) begin
      @(posedge intr.clk);
      tr = new();
      
      tr.in		=	intr.monit.in;
      tr.out	=	intr.monit.out;
      tr.w_en	=	intr.monit.w_en;
      tr.r_en	=	intr.monit.r_en;
      tr.full	=	intr.monit.full;
      tr.empty	=	intr.monit.empty;
      tr.rst	=	intr.monit.rst;
      
      montosco.put(tr);
    end
  endtask
  
endclass
