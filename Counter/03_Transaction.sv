class transaction;
  bit en;
  bit rst_n;
  bit [3:0] count;
  
  function void display(string name);
    $display("\t%s Output:",name);
    $display("\tReset: %d | Enable: %d || Counter Output: %d",rst_n, en, count);
  endfunction 
  
endclass
