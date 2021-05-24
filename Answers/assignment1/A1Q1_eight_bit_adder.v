module eight_bit_adder (x, y, carry_in, sum, carry_out);

   input [7:0] x;
   input [7:0] y;
   input carry_in;

   output [7:0] sum;
   wire [7:0] sum;
   output carry_out;
   wire carry_out;

   wire [6:0] intermediate_carry;

   fulladder FA0 (x[0], y[0], carry_in, sum[0], intermediate_carry[0]);
   fulladder FA1 (x[1],y[1],intermediate_carry[0],sum[1],intermediate_carry[1]);
   fulladder FA2 (x[2],y[2],intermediate_carry[1],sum[2],intermediate_carry[2]);
   fulladder FA3 (x[3],y[3],intermediate_carry[2],sum[3],intermediate_carry[3]);
   fulladder FA4 (x[4],y[4],intermediate_carry[3],sum[4],intermediate_carry[4]);
   fulladder FA5 (x[5],y[5],intermediate_carry[4],sum[5],intermediate_carry[5]);
   fulladder FA6 (x[6],y[6],intermediate_carry[5],sum[6],intermediate_carry[6]);
   fulladder FA7 (x[7],y[7],intermediate_carry[6],sum[7],carry_out);


endmodule