`include "interface.sv"

module ha(variable intf);
  assign {intf.carry, intf.sum} = intf.a + intf.b;
endmodule
