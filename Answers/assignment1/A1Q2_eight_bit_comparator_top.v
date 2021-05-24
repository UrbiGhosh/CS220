module eight_bit_comparator_top;

   reg [7:0] A;
   reg [7:0] B;


   wire l,e,g;

   eight_bit_comparator comparator (A,B,l,e,g);

   always @ (A or B or l  or e or g) begin
      $display("time=%d: %d compare %d = %b %b %b\n ", $time,A,B,l,e,g);
   end

   initial begin
      A = 100; B = 100;
      #1;
      A = 101; B = 100;
      #1;
      A = 20; B = 100;
      #1;
      A = 123; B = 145;
      #1;
      A = 200; B = 122;
      #1;
      A = 111; B = 111;
      #1;
      A = 12; B = 12;
      #1;
      A = 150; B = 12;
      #1;
      A = 213; B = 143;
      #1;
      A = 1; B = 11;
      #1;
      A = 50; B = 50;
      #1;

   end

endmodule