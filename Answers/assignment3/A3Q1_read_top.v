module A3Q1_read_top;
	reg clk, input_valid;
	reg[3:0] row_no;
	wire output_valid;
	wire[31:0] out;

	A3Q1_read v(clk, row_no, input_valid, out, output_valid);

	always @(posedge output_valid) begin
		$display("time=%d: Row No: %b Register: %b ", $time,row_no, out);
	end

	initial begin
		forever begin
			clk=0;
			#5;
			clk=1;
			#5;
			clk=0;
		end
	end
	initial begin
		forever begin
			input_valid=0;
        	#3;
        	input_valid=1;
        	row_no=$urandom%15;
        	#10;
        	input_valid=0;
        	#17;
        end
	end

	initial begin
		#300;
		$finish;
	end
endmodule
