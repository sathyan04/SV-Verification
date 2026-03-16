`include "interface.sv"
module d_flip_flop(variable intf);
  always_ff @(posedge intf.clk) begin
    if(!intf.rst) begin
      intf.q<=0;
    end
    else begin
      intf.q<=intf.d;
    end
  end
endmodule
