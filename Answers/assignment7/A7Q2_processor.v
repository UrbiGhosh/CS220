module processor(clk,state);
input clk;
output [2:0] state;
reg [31:0] memory[0:6];
reg [7:0] file[0:31];
reg [2:0] PC;
reg [2:0] state;
reg [31:0] read_inst;
reg [4:0] rs,rt,rd;
reg [7:0] i;
reg [5:0] func, opcode;
reg [7:0] read1, read2, write;
reg invalid;
reg [2:0] MAX_PC;
reg [5:0] OUTPUT_REG;

always @(posedge clk) begin
    if (state == 0) begin
        read_inst <= memory[PC];
        PC <= PC + 1;
        state <= 1;
    end
    else if (state == 1) begin
        if (read_inst[31:26] == 6'b001001) begin
            rs <= read_inst [25:21];
            rd <= read_inst [20:16];
            i <= read_inst [7:0];
            opcode <= 6'b001001;
        end
        else begin
            func <= read_inst[5:0];
            rs <= read_inst [25:21];
            rt <= read_inst [20:16];
            rd <= read_inst [15:11];
            opcode <= 6'b000000;
        end
        state <= 2;
    end
    else if (state == 2) begin
        if(opcode == 6'b001001) begin
            read1 <= file [rs];
        end
        else begin
            read1 <= file[rs];
            read2 <= file[rt];
        end
        state <= 3;
    end
    else if (state == 3) begin
        if (opcode == 6'b001001) begin
            write <= read1 + i;
            state <= 4;
        end
        else if (opcode == 6'b000000) begin
            if (func == 6'b100001) begin
                write <= read1 + read2;
                state <= 4;
            end
            else if (func == 6'b100011) begin
                write <= read1 - read2;
                state <= 4;
            end
            else begin
                invalid <= 1;
            end
        end
        else begin
            invalid <= 1;
        end
    end
    else if (state == 4) begin
        if (invalid == 0 && rd!= 0) begin
            file[rd] <= write;
            if (PC < MAX_PC) begin
                state <= 0;
            end
            else begin
                state <= 5;
            end
        end
    end
    else if (state == 5) begin
        $display ("Output register: %d", file[OUTPUT_REG]);
        $finish;
    end
end

initial begin
    memory[0] = {6'b001001, 5'b00000, 5'b00001, 16'b0000000000101101};
	memory[1] = {6'b001001, 5'b00000, 5'b00010, 16'b1111111111101100};
	memory[2] = {6'b001001, 5'b00000, 5'b00011, 16'b1111111111000100};
	memory[3] = {6'b001001, 5'b00000, 5'b00100, 16'b0000000000011110};
	memory[4] = {6'b000000, 5'b00001, 5'b00010, 5'b00101, 5'b00000, 6'b100001};
	memory[5] = {6'b000000, 5'b00011, 5'b00100, 5'b00110, 5'b00000, 6'b100001};
	memory[6] = {6'b000000, 5'b00101, 5'b00110, 5'b00101, 5'b00000, 6'b100011};
end

initial begin
    file[0] = 0;
    file[1] = 0;
    file[2] = 0;
    file[3] = 0;
    file[4] = 0;
    file[5] = 0;
    file[6] = 0;
    file[7] = 0;
    file[8] = 0;
    file[9] = 0;
    file[10] = 0;
    file[11] = 0;
    file[12] = 0;
    file[13] = 0;
    file[14] = 0;
    file[15] = 0;
    file[16] = 0;
    file[17] = 0;
    file[18] = 0;
    file[19] = 0;
    file[20] = 0;
    file[21] = 0;
    file[22] = 0;
    file[23] = 0;
    file[24] = 0;
    file[25] = 0;
    file[26] = 0;
    file[27] = 0;
    file[28] = 0;
    file[29] = 0;
    file[30] = 0;
    file[31] = 0;

end

initial begin
    PC=0;
    state=0;
    invalid = 0;
    MAX_PC = 7;
    OUTPUT_REG = 5;
end

endmodule