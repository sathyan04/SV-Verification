`include "test.sv"

module testbench();
  parameter depth = 16;
  parameter data_width = 8;
  parameter ptr_width = $clog2(depth);
  
  inter #(depth, data_width) intr();
  test #(depth, data_width) t(intr);
  async_fifo_top #(depth, data_width, ptr_width) a(intr);
  
  initial begin
    intr.wclk = 1;
    forever #10 intr.wclk = ~intr.wclk;
  end
  
  initial begin
    intr.rclk = 1;
    forever #15 intr.rclk = ~intr.rclk;
  end
  
  initial begin 
    $dumpfile("fifo.vcd");
    $dumpvars(0);
  end
  
endmodule
