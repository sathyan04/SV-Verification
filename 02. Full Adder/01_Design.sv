`include "interface.sv"

module full_adder(variable intf);
  assign {intf.carry, intf.sum} = intf.a + intf.b + intf.c ;
endmodule
