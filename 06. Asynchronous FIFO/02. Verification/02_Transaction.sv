class transaction #(depth, data_width);
  
  rand bit wrst;
  rand bit w_en;
  
  rand bit rrst;
  rand bit r_en;
  
  rand bit [data_width-1:0] data_in;
  bit [data_width-1:0] data_out;
  
  bit full;
  bit empty;
  
  constraint rst_c
  {
    wrst == 1;
    w_en == 0;
    
    rrst == 1;
    r_en == 0;
    
    data_in == 0;
  }
  
  constraint w_c
  {
    wrst == 0;
    w_en == 1;
    
    rrst == 0;
    r_en == 0;
  }
  
  constraint r_c
  {
    wrst == 0;
    w_en == 0;
    
    rrst == 0;
    r_en == 1;
  }
  
  function void wdisplay(string name);
    $display("\n----%s----",name);
    $display("Write	::	Reset	: %b | W_Enable	: %b | Full	: %b	 :: Input Data	: %d || Time	: %0t", wrst, w_en, full, data_in, $time);
  endfunction
  
  function void rdisplay(string name);
    $display("----%s----",name);
    $display("Read	::	Reset	: %b | R_Enable	: %b | Empty	: %b	 :: Output Data	: %d || Time	: %0t\n", rrst, r_en, empty, data_out, $time);
  endfunction
  
endclass
