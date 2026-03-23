`include "interface.sv"
`include "synchronizer.sv"
`include "write_ptr_handler.sv"
`include "read_ptr_handler.sv"
`include "memory.sv"

module async_fifo_top #(parameter depth=8, data_width=8, ptr_width = $clog2(depth)) (inter intr);
  
  wire [ptr_width:0] b_wptr, b_rptr;
  wire [ptr_width:0] g_wptr, g_rptr;
  wire [ptr_width:0] g_wptr_sync, g_rptr_sync;
  
  synchronizer #(ptr_width) sync_wptr(
    .clk(intr.rclk),
    .rst(intr.rrst),
    .gin(g_wptr), 
    .gout(g_wptr_sync)
  );
  
  synchronizer #(ptr_width) sync_rptr(
    .clk(intr.wclk),
    .rst(intr.wrst),
    .gin(g_rptr), 
    .gout(g_rptr_sync)
  );
  
  write_ptr_handler #(ptr_width) w_ptr_h (
    .wclk(intr.wclk), 
    .wrst(intr.wrst), 
    .w_en(intr.w_en), 
    .g_rptr_sync(g_rptr_sync), 
    .b_wptr(b_wptr), 
    .g_wptr(g_wptr), 
    .full(intr.full)
  );
  
  read_ptr_handler #(ptr_width) r_ptr_h (
    .rclk(intr.rclk), 
    .rrst(intr.rrst), 
    .r_en(intr.r_en), 
    .g_wptr_sync(g_wptr_sync), 
    .b_rptr(b_rptr), 
    .g_rptr(g_rptr), 
    .empty(intr.empty)
  );
  
  memory #(depth, data_width, ptr_width) fifo (
    .wclk(intr.wclk), 
    .rclk(intr.rclk), 
    .w_en(intr.w_en), 
    .r_en(intr.r_en), 
    .full(intr.full), 
    .empty(intr.empty), 
    .b_wptr(b_wptr), 
    .b_rptr(b_rptr), 
    .data_in(intr.data_in), 
    .data_out(intr.data_out)
  );
  
endmodule
