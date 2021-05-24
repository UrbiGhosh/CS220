module A2Q3_blink(clk, out);
reg [15:0] counter;
output out;
input clk;
reg out;
always @ (posedge clk) begin
	counter = counter + 1;
	if(counter == 25000) begin
		counter<= 0;
		out<= ~out;
	end
end
initial begin 
	out<=0;
	counter<=0;
end
endmodule