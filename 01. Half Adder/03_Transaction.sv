class transaction;
  randc bit a;
  randc bit b;
  bit sum;
  bit carry;
  
  function void display(string name);
    $display("%s",name);
    $display("A=%b| B=%b || Sum=%b | Carry=%b",a,b,sum,carry);
  endfunction
  
endclass
