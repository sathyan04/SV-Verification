`include "interface.sv"

module fifo #(parameter length=8, parameter location=4)(variable.dut intr);
  reg [length-1:0] memory [location-1:0];
  reg [$clog2(location):0] wptr;
  reg [$clog2(location):0] rptr;
  
  always @(posedge intr.clk) begin
    if(intr.rst) begin
      intr.out<=0;
      wptr<=0;
      rptr<=0;
    end
    else begin
      if(intr.w_en && !(intr.full)) begin
        memory[wptr[$clog2(location)-1:0]]<=intr.in;
        wptr<=wptr+1;
      end
      else if (intr.r_en && !(intr.empty)) begin
        intr.out<=memory[rptr[$clog2(location)-1:0]];
        rptr<=rptr+1;
      end
    end
  end
  
  assign intr.full = (wptr[$clog2(location)] != rptr[$clog2(location)]) && (wptr[$clog2(location)-1:0] == rptr[$clog2(location)-1:0]);
  assign intr.empty = (wptr == rptr);
  
endmodule
