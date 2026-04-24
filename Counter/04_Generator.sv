class generator;
  transaction tr;
  mailbox gentodri;
  event sb_done;
  
  function new(mailbox gentodri, event sb_done);
    this.gentodri	=	gentodri;
    this.sb_done	=	sb_done;
  endfunction
  
  task main();
    for(int i=0; i<10; i++) begin
      tr = new();
      if(i == 0) begin
        tr.rst_n = 0;	//	resetting for the first cycle to value the variables
      end
      else begin
        tr.rst_n = 1; 
        tr.en = 1;
      end
      /* 
      for any other condition, the value of reset will be high 
      (since its an acitve low async reset)
      */
      gentodri.put(tr);
      tr.display("Generator");      
      @sb_done;
    end
  endtask
  
endclass
