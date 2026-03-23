module memory #(parameter depth=8, data_width=8, ptr_width=3) (
  input wclk, rclk, w_en, r_en, full, empty,
  input [ptr_width:0] b_wptr, b_rptr,
  input [data_width-1:0] data_in,
  output reg [data_width-1:0] data_out
);
  
  reg [data_width-1:0] mem [0:depth-1];
  
  always @(posedge wclk) begin
    if(w_en & !full) begin
      mem[b_wptr[ptr_width-1:0]] <=data_in;
    end
  end
  
  always @(posedge rclk) begin
    if(r_en & !empty) begin
      data_out <= mem[b_rptr[ptr_width-1:0]];
    end
  end
  
endmodule
