module A4_Q2_worm_grid_top;
   reg clk;
   reg [1:0] steps;
   reg [1:0] direction;
   wire[4:0] x;
   wire[4:0] y;
   A4_Q2_worm_grid v1(clk,steps,direction,x,y);
   reg [4:0] count;

   always @(negedge clk) begin
   
      $display("time cycles: %d steps: %d, direction: %d, -> x: %d , y: %d  ", count, steps, direction, x, y);
   
   end

   always @(posedge clk) begin
      if(count == 10) begin
       $finish;
      end
   end
   initial begin
      count = 0;
   end

   initial begin
      forever begin
         clk=0;
         #5;
         clk=1;
         #5;
         count = count + 1;
      end
   end

   initial begin
      forever begin
         #3;
         steps = 2; direction = 1;
         #10;
         steps = 1; direction = 0;
         #10;
         steps = 3; direction = 1;
         #10;
         steps = 0; direction = 2;
         #10;
         steps = 3; direction = 1;
         #10;
         steps = 2; direction =0;
         #10;
         steps = 1; direction = 3;
         #10;
         steps = 2; direction = 2;
         #10;
         steps = 2; direction =0;
         #10;
         #7;
      end
   end

endmodule
