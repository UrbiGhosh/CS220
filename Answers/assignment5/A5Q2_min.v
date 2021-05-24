module A5Q2_min(a,b,c,d, out_min);

input [2:0] a,b,c,d;
output [1:0] out_min;
reg [1:0] out_min;

always @( a or b or c or d ) begin
	if (a<b) begin
		if (a<c) begin
			if (a<d) begin
				out_min = 0;
			end
			else begin
				out_min = 3;
			end
		end
		else begin
			if (c<d) begin
				out_min = 2;
			end
			else begin
				out_min = 3;
			end
		end
	end
	else begin
		if (b<c) begin
			if(b<d) begin
				out_min = 1;
			end
			else begin
				out_min = 3;
			end
		end
		else begin
			if (d<c) begin
				out_min = 3;
			end
			else begin
				out_min = 2;
			end
		end
	end
end
endmodule
