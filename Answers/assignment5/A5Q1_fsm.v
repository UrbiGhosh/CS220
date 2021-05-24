module A5Q1_fsm (clk, in, state);

input clk;
input [1:0] in;
output [3:0] state;
reg [3:0] state;
reg [2:0] microcode [0:12];
reg [3:0] dispatch1 [3:0], dispatch2 [3:0];

initial begin
	state <= #2 0;
	microcode[0] <= 3'b000;
	microcode[1] <= 3'b000;
	microcode[2] <= 3'b000;
	microcode[3] <= 3'b001;
	microcode[4] <= 3'b011;
	microcode[5] <= 3'b011;
	microcode[6] <= 3'b000;
	microcode[7] <= 3'b000;
	microcode[8] <= 3'b000;
	microcode[9] <= 3'b000;
	microcode[10] <= 3'b010;
	microcode[11] <= 3'b100;
	microcode[12] <= 3'b100;

	dispatch1[0] <= 4'b0100;
	dispatch1[1] <= 4'b0101;
	dispatch1[2] <= 4'b0110;
	dispatch1[3] <= 4'b0110;

	dispatch2[0] <= 4'b1011;
	dispatch2[1] <= 4'b1100;
	dispatch2[2] <= 4'b1100;
	dispatch2[3] <= 4'b1100;
end

always @(posedge clk) begin
	if (microcode[state] == 3'b000) begin
		state <= #2 state + 1;
	end
	else if (microcode[state] == 3'b001 ) begin
		state <= #2 dispatch1[in];
	end
	else if (microcode[state] == 3'b010 ) begin
		state <= #2 dispatch2[in];
	end
	else if (microcode[state] == 3'b011 ) begin
		state <= #2 4'b0111;
	end
	else if (microcode[state] == 3'b100 ) begin
		state <= #2 4'b0000;
	end
end

endmodule