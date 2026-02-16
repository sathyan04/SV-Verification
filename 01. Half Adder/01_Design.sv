module half_adder(
  variables inter
);
  assign {inter.carry,inter.sum}=inter.a+inter.b;
endmodule
