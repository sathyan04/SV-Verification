class transaction #(length,location);
  rand bit [length-1:0] in;
  bit [length-1:0] out;
  bit full;
  bit empty;
  rand bit w_en;
  rand bit r_en;
  rand bit rst;
  
  constraint co 
  { 
    rst == 1; 
    in == 0; 
  };
  function void display();
    $display("Rst:%b | W_En:%b | In:%d | Full:%b || R_En:%b | Out:%d | Empty:%b || Time:%0t", rst, w_en, in, full, r_en, out, empty,$time);
  endfunction
  
endclass
