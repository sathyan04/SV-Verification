class generator #(length,location);
  transaction #(length,location) tr;
  mailbox gentodri;
  
  function new(mailbox gentodri);
    this.gentodri = gentodri;
  endfunction
  
  task main();
    for(int i=0; i<(location*2); i++) begin
      tr = new();
    
      if(i==0) begin
        tr.co.constraint_mode(1);
        tr.randomize();
        tr.w_en = 1;
        tr.r_en = 0;
      end
      
      else if (i<(location+1)) begin
        tr.co.constraint_mode(0);
        tr.randomize() with {rst == 0;};
        tr.w_en = 1;
        tr.r_en = 0;
      end
      
      else if (i<(location*2)) begin
        tr.co.constraint_mode(0);
        tr.randomize() with {rst == 0; in == 0;};
        tr.w_en = 0;
        tr.r_en = 1;
      end
      
      gentodri.put(tr);
    end
  endtask
  
endclass
