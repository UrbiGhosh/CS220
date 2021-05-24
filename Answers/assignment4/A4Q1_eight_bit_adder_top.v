
module A4_Q1_eight_bit_adder_top;

   reg [7:0] A;
   reg [7:0] B;
   reg opcode;

   wire [7:0] Sum;
   wire Carry;
   wire overflow;

  A4_Q1_eight_bit_adder ADDER (A, B, opcode, Sum, Carry,overflow);

   always @ (A or B or opcode or Sum or Carry or overflow ) begin
      $display("Time = %2d, A = %b, B = %b, opcode = %d, Sum = %b, Carry = %d, overflow = %d", $time, A, B, opcode, Sum, Carry, overflow);
   end

   initial begin
      A = 100; B = 100; opcode = 1;
      #1
      $display("\n");
      A = 100; B = -3; opcode = 0;
      #1
      $display("\n");
      A = 120; B = 100; opcode = 1;
      #1
      $display("\n");
      A = 50; B = 100; opcode = 1;
      #1
      $display("\n");
      A = -30; B = 60; opcode = 0;
      #1
      $display("\n");
      A = 20; B = 20; opcode = 0;
      #1
      $display("\n");
      A = 80; B = 90; opcode = 0;
      #1
      $display("\n");
      A = 144; B = 20; opcode = 1;
      #1
      $display("\n");
      A = -20; B = -20; opcode = 0;
      #1
      $display("\n");
      A = 43; B = 44; opcode = 0;
      #1
      $finish;
   end
endmodule
