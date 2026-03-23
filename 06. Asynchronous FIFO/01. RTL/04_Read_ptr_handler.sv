module read_ptr_handler #(parameter ptr_width=3) (
  input rclk, rrst, r_en,
  input [ptr_width:0] g_wptr_sync,
  output reg [ptr_width:0] b_rptr, g_rptr,
  output reg empty
);
  
  wire [ptr_width:0] b_rptr_next;
  wire [ptr_width:0] g_rptr_next;
  
  wire rempty;
  
  assign b_rptr_next=b_rptr + (r_en & !empty);
  assign g_rptr_next=(b_rptr_next>>1)^(b_rptr_next);
  
  always @(posedge rclk) begin
    if(rrst) begin
      b_rptr<=0;
      g_rptr<=0;
      empty<=1;
    end
    else begin
      b_rptr<=b_rptr_next;
      g_rptr<=g_rptr_next;
      empty<=rempty;
    end
  end
  
  assign rempty = g_rptr_next == g_wptr_sync;
  
endmodule
