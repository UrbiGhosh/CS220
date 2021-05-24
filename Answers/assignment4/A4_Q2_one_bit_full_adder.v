
module A4_Q2_one_bit_full_adder (a, b, cin, opcode , sum, cout);

   input a;
   input b;
   input cin;
   input opcode;

   output sum;
   wire sum;
   output cout;
   wire cout;

   assign sum = a ^ ( b ^ opcode ) ^ cin;
   assign cout = (a & (b ^ opcode) ) | ( (b ^ opcode) & cin) | (cin & a);

endmodule
