class transaction;
  randc bit a;
  randc bit b;
  bit sum;
  bit carry;
  
  function void display(string name);
    $display("~~~~~~~~~~~~~~%s~~~~~~~~~~~~~~",name);
    $display("| a=%b | b=%b || sum=%b | carry=%b |",a,b,sum,carry);
  endfunction
  
endclass
