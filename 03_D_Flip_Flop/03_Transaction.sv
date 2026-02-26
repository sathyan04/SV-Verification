class transaction;
  bit rst;
  bit q;
  randc bit d;
  
  function void display(string name);
    $display("~~~~%s~~~~",name);
    $display("In: %b | Out: %b\n", d, q);
  endfunction
  
endclass
