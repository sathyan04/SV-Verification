class transaction;
  randc bit a;
  randc bit b;
  randc bit c;
  bit sum;
  bit carry;
  
  function void display(string name);
    $display("~~~~~%s~~~~~~",name);
    $display("A:%b | B:%b | C:%b || Sum:%b | Carry:%b",a,b,c,sum,carry);
  endfunction
  
endclass
