module A2Q4_rotate(clk, out);
reg [15:0] counter;
output[3:0] out;
input clk;
reg[3:0] out;
always @ (posedge clk) begin
	counter = counter + 1;
	if(counter == 25000) begin
		out[3]<=out[2];
		out[2]<=out[1];
		out[1]<=out[0];
		out[0]<=out[3];
		counter<= 0;
	end
end
initial begin 
	out<=4'b0001;
	counter<=0;
end
endmodule