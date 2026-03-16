`include "interface.sv"
module siso(variable.dut intr);
  reg [3:0] shift;
  always @(posedge intr.clk or negedge intr.rst) begin
    if(!(intr.rst))
      shift<=4'b0000;
    else
      shift<={shift[2:0],intr.sin};
  end
  
  assign intr.sout = shift[3];
  
endmodule
