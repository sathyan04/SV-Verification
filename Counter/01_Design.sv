module counter(
  input clk,
  input rst_n,
  input en,
  output reg [3:0] count
);
  
  always @(posedge clk or negedge rst_n) begin
    if(!rst_n) begin
      count	<= 0;
    end
    else if (en) begin
      count	<= count + 1'b1;
    end
  end
  
  property counting;
    @(posedge clk) disable iff (!rst_n)
    (en |=> (count == $past(count) + 1'b1)) and ((!en) |=> $stable(count));
  endproperty
  
  assert property (counting)
    else $display("Assertion Failed");
        
endmodule
