module eight_bit_adder_top;

   reg [7:0] A;
   reg [7:0] B;
   reg Cin;

   wire [7:0] Sum;
   wire Carry;

   eight_bit_adder ADDER (A, B, Cin, Sum, Carry);

   always @ (A or B or Cin  or Sum or Carry) begin
      $display("time=%d: %b + %b + %b = %b, carry= %d\n ", $time,A,B,Cin,Sum,Carry);
   end

   initial begin
      A = 100; B = 100; Cin = 1;
      #1;
      $display("\n");
      A = 200; B = 200; Cin = 0;
      #1;
      $display("\n");
      A = 101; B = 200; Cin = 0;
      #1;
      $display("\n");
      A = 111; B = 222; Cin = 0;
      #1;
      $display("\n");
      A = 34; B = 214; Cin = 1;
      #1;
      $display("\n");
      A = 122; B = 122; Cin = 1;
      #1;
      $display("\n");
      A = 134; B = 2; Cin = 0;
      #1;
      $display("\n");
      A = 100; B = 50; Cin = 1;
      #1;
      $display("\n");
      A = 176; B = 200; Cin = 0;
      #1;
      $display("\n");
      A = 55; B = 156; Cin = 1;
      #1;
   end

endmodule