
module A4_Q1_eight_bit_adder (x, y, opcode, sum, carry_out, overflow);

   input [7:0] x;
   input [7:0] y;
   input opcode;

   output [7:0] sum;
   wire [7:0] sum;
   output carry_out,overflow;
   wire carry_out;
   reg overflow;

   wire [6:0] intermediate_carry;

   A4_Q1_one_bit_full_adder FA0 (x[0], y[0], opcode, opcode, sum[0], intermediate_carry[0]);
   A4_Q1_one_bit_full_adder FA1 (x[1], y[1], intermediate_carry[0], opcode, sum[1], intermediate_carry[1]);
   A4_Q1_one_bit_full_adder FA2 (x[2], y[2], intermediate_carry[1], opcode, sum[2], intermediate_carry[2]);
   A4_Q1_one_bit_full_adder FA3 (x[3], y[3], intermediate_carry[2], opcode, sum[3], intermediate_carry[3]);
   A4_Q1_one_bit_full_adder FA4 (x[4], y[4], intermediate_carry[3], opcode, sum[4], intermediate_carry[4]);
   A4_Q1_one_bit_full_adder FA5 (x[5], y[5], intermediate_carry[4], opcode, sum[5], intermediate_carry[5]);
   A4_Q1_one_bit_full_adder FA6 (x[6], y[6], intermediate_carry[5], opcode, sum[6], intermediate_carry[6]);
   A4_Q1_one_bit_full_adder FA7 (x[7], y[7], intermediate_carry[6], opcode, sum[7], carry_out);

   always @(carry_out or intermediate_carry) begin
      if (intermediate_carry[6] == carry_out) begin
         overflow = 0;
      end
      else begin
         overflow = 1;
      end
   end
   
endmodule
