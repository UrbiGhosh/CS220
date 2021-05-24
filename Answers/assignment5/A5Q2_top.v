module   A5Q2_top;

   reg [2:0] a,b,c,d;
   wire [1:0] out_min;
   A5Q2_min MIN(a,b,c,d, out_min);
   always @( a or b or c or d or out_min ) begin
   
      $monitor( "input: %b %b %b %b \n Minimum: %d \n", a, b, c, d, out_min);
   
   end


   initial begin
      a = 3'b000; b = 3'b001; c = 3'b010; d = 3'b100;
      #5;
      a = 3'b010; b = 3'b101; c = 3'b000; d = 3'b110;
      #5;
      a = 3'b110; b = 3'b111; c = 3'b011; d = 3'b110;
      #5;
      a = 3'b000; b = 3'b011; c = 3'b010; d = 3'b101;
      #5;
      a = 3'b100; b = 3'b001; c = 3'b010; d = 3'b000;
      #5;
      a = 3'b010; b = 3'b111; c = 3'b110; d = 3'b100;
      #5;
      a = 3'b000; b = 3'b101; c = 3'b000; d = 3'b100;
      #5;
      a = 3'b110; b = 3'b001; c = 3'b010; d = 3'b001;
      #5;
      a = 3'b011; b = 3'b001; c = 3'b110; d = 3'b100;
      #5;
      a = 3'b010; b = 3'b010; c = 3'b010; d = 3'b010;
      #5;

      $finish;
   end

endmodule