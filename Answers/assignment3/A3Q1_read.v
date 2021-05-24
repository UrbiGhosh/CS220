module A3Q1_read(clk, row_no, input_valid, out, output_valid);
	input clk, input_valid;
	input[3:0] row_no;
	output[31:0] out; 
	output output_valid;
	reg[31:0] out;
	reg output_valid = 0;

	reg[3:0] open_row;
	reg[31:0] r [0:15];
	reg row_open = 1'b0;
	reg[1:0] cycle_count = 0;

	always @(posedge clk) begin
		if(cycle_count == 1) begin
			output_valid=1;
			cycle_count = 0;
			out = r[row_no];
			open_row = row_no;
		end
		else if(cycle_count == 2) begin
			cycle_count = 1;
		end
		if(input_valid == 1'b1) begin
			if(row_open == 1'b0) begin
				output_valid=0;
				cycle_count = 1;
				row_open = 1'b1;
			end
			else if(row_no == open_row) begin
				output_valid = 1;
				out = r[row_no];
			end
			else begin
				cycle_count = 2;
				output_valid = 0;
			end
		end
		else begin
			output_valid = 0;
		end
	end
	integer i;
	initial begin
		for (i=0;i<16;i=i+1)
			r[i] = i;
	end
endmodule