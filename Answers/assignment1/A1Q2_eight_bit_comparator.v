module eight_bit_comparator (x, y, lesser, equal, greater);

   input [7:0] x;
   input [7:0] y;

   output lesser,equal,greater;
   wire lesser,equal,greater;
   wire [7:0] l;
   wire [7:0] e;
   wire [7:0] g;

   compare A0 (x[7], y[7],l[7], e[7], g[7]);
   compare A1 (x[6], y[6], l[6], e[6], g[6]);
   compare A2 (x[5], y[5], l[5], e[5], g[5]);
   compare A3 (x[4], y[4], l[4], e[4], g[4]);
   compare A4 (x[3], y[3], l[3], e[3], g[3]);
   compare A5 (x[2], y[2], l[2], e[2], g[2]);
   compare A6 (x[1], y[1], l[1], e[1], g[1]);
   compare A7 (x[0], y[0], l[0], e[0], g[0]);

   assign equal = e[7]&e[6]&e[5]&e[4]&e[3]&e[2]&e[1]&e[0];
   assign greater = g[7] | (g[6]&e[7]) | (g[5]&e[6]&e[7]) | (g[4]&e[5]&e[6]&e[7]) | (g[3]&e[4]&e[5]&e[6]&e[7]) | (g[2]&e[3]&e[4]&e[5]&e[6]&e[7]) | (g[1]&e[2]&e[3]&e[4]&e[5]&e[6]&e[7]) | (g[0]&e[1]&e[2]&e[3]&e[4]&e[5]&e[6]&e[7]);
   assign lesser = (~equal)&(~greater);

endmodule