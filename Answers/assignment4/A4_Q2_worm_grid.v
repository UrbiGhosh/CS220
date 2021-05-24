
module A4_Q2_worm_grid (clk, steps, direction, x, y);

   input clk;
   input [1:0] steps;
   input [1:0] direction;

   output [4:0] x;
   reg [4:0] x;
   output [4:0] y;
   reg [4:0] y;
   wire carry_out;
   wire carry;
   wire [4:0] sum1;
   wire [4:0] sum2;

   wire [3:0] intermediate_carry1;
   wire [3:0] intermediate_carry2;

   A4_Q2_one_bit_full_adder FA0 (x[0], steps[0], direction[1], direction[1], sum1[0], intermediate_carry1[0]);
   A4_Q2_one_bit_full_adder FA1 (x[1], steps[1], intermediate_carry1[0], direction[1], sum1[1], intermediate_carry1[1]);
   A4_Q2_one_bit_full_adder FA2 (x[2], 1'b0, intermediate_carry1[1], direction[1], sum1[2], intermediate_carry1[2]);
   A4_Q2_one_bit_full_adder FA3 (x[3], 1'b0, intermediate_carry1[2], direction[1], sum1[3], intermediate_carry1[3]);
   A4_Q2_one_bit_full_adder FA4 (x[4], 1'b0, intermediate_carry1[3], direction[1], sum1[4], carry_out);

   A4_Q2_one_bit_full_adder F1 (y[0], steps[0], direction[1], direction[1], sum2[0], intermediate_carry2[0]);
   A4_Q2_one_bit_full_adder F2 (y[1], steps[1], intermediate_carry2[0], direction[1], sum2[1], intermediate_carry2[1]);
   A4_Q2_one_bit_full_adder F3 (y[2], 1'b0, intermediate_carry2[1], direction[1], sum2[2], intermediate_carry2[2]);
   A4_Q2_one_bit_full_adder F4 (y[3], 1'b0, intermediate_carry2[2], direction[1], sum2[3], intermediate_carry2[3]);
   A4_Q2_one_bit_full_adder F5 (y[4], 1'b0, intermediate_carry2[3], direction[1], sum2[4], carry);


   always @(posedge clk) begin
      if (direction== 0) begin
         if(sum1[4] == 1) begin
            x = 5'b01111;
         end
         else begin
            x=sum1;
         end
      end
      if (direction== 1) begin
         if(sum2[4] == 1) begin
            y = 5'b01111;
         end
         else begin
            y=sum2;
         end
      end
      if (direction== 2) begin
         if(sum1[4] == 1) begin
            x = 5'b00000;
         end
         else begin
            x=sum1;
         end
      end
      if (direction== 3) begin
         if(sum2[4] == 1) begin
            y = 5'b00000;
         end
         else begin
            y=sum2;
         end
      end
   end
   initial begin
      x = 0;
      y= 0;
   end
endmodule
