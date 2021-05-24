module compare (a, b,L, E,G); 
input a, b;
output L, E, G;
wire L,E,G;
assign L = (~a)&b;
assign G = (a)&(~b);
assign E = (a&b)|((~a)&(~b));

endmodule