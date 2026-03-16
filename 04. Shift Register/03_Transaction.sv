class transaction;
  randc bit sin;
  bit sout;
  
  function void display(string name);
    $display("In:%b | Out:%b | Time:%0t",sin,sout,$time);
  endfunction
  
endclass
