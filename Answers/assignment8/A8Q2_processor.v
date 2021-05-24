`define OUTPUT_REG 4
`define MAX_PC 11
module processor(clk,state, PC);
input clk;
output [2:0] state;
output [7:0] PC;
reg [31:0] memory[0:10];
reg signed [7:0] file[0:31];
reg [7:0] PC;
reg [2:0] state;
reg [31:0] read_inst;
reg [4:0] rs,rt,rd,ra;
reg [7:0] i;
reg [5:0] func, opcode;
reg signed [7:0] read, read1, read2;
reg [7:0] write, target_add, address;
reg invalid;
reg [7:0] data[0:2];
reg result;

always @(posedge clk) begin
    if (state == 0) begin
        read_inst <= memory[PC];
        state <= 1;
    end
    else if (state == 1) begin
        if (read_inst[31:26] == 6'b000000) begin
            func <= read_inst[5:0];
            rs <= read_inst [25:21];
            rt <= read_inst [20:16];
            rd <= read_inst [15:11];
            opcode <= 6'b000000;
        end
        else if (read_inst[31:26] == 6'b000011) begin
            target_add <= read_inst[7:0];
            opcode <= 6'b000011;
        end
        else begin
            opcode <= read_inst[31:26];
            rs <= read_inst[25:21];
            rd = read_inst[20:16];
            i <= read_inst[7:0];
        end
        state <= 2;
    end
    else if (state == 2) begin
        if (opcode == 6'b000000) begin
            read1 <= file[rs];
            read2 <= file[rt];
        end
        else if (opcode == 6'b000011) begin
            state <= 3;
        end
        else begin
            read1 <= file[rs];
            read2 <= file[rd];
        end
        state <= 3;
    end
    else if (state == 3) begin
        case (opcode)
            6'b001001: begin
                write <= read1 + i;
                state <= 4;
                PC <= PC + 1;
                result = 1;
            end
            6'b000100: begin
                if (read1 == read2) begin
                    PC <= PC + i;
                end
                else begin
                    PC <= PC + 1;
                end
                result <= 0;
                state <= 4;
            end
            6'b100011: begin
                address <= i + read1;
                result <= 0;
                state <= 4;
                PC <= PC + 1;
            end
            6'b000101: begin
                if (read1 != read2) begin
                    PC <= PC + i;
                end
                else begin
                    PC <= PC + 1;
                end
                result <= 0;
                state <= 4;
            end 
            6'b000011: begin
                file[ra] <= PC + 1;
                PC <= target_add;
                result <= 0;
                state <= 4;
            end
            6'b000000: begin
                case (func)
                    6'b101010: begin
                        if (read1 < read2) begin
                            write <= 1;
                        end
                        else begin
                            write <= 0;
                        end
                        result <= 1;
                        PC <= PC + 1;
                        state <= 4;
                    end
                    6'b100001: begin
                        write <= read1 + read2;
                        result <= 1;
                        PC <= PC + 1;
                        state <= 4;
                    end
                    6'b001000: begin
                        PC <= read1;
                        state <= 4;
                        result <= 0;
                    end
                    default: begin
                        PC <= PC + 1;
                        invalid <= 1;
                        state <= 4;
                    end
                endcase
            end
            default: begin
                PC <= PC + 1;
                invalid <= 1;
                state <= 4;
            end
        endcase
    end
    else if (state == 4) begin
        if(opcode == 6'b100011) begin
            write <= data[address];
            result <= 1;
        end
        state <= 5;
    end
    else if (state == 5) begin
        if(invalid == 0 && result == 1 && rd!= 0) begin
            file[rd] <= write;
        end
        if (PC < `MAX_PC) begin
            state <= 0;
        end
        else begin
            state <= 6;
        end
    end
    else if (state == 6) begin
        $display ("Output register: %d", file[`OUTPUT_REG]);
        $finish;
    end
end

initial begin //initialize instructions
    memory[0] = {6'b100011, 5'b00000, 5'b00001, 16'b0000000000000000};
	memory[1] = {6'b100011, 5'b00000, 5'b00010, 16'b0000000000000001};
	memory[2] = {6'b100011, 5'b00000, 5'b00011, 16'b0000000000000010};
	memory[3] = {6'b001001, 5'b00000, 5'b00100, 16'b0000000000000000};
	memory[4] = {6'b001001, 5'b00001, 5'b00101, 16'b0000000000000000};
	memory[5] = {6'b000000, 5'b00101, 5'b00010, 5'b00110, 5'b00000, 6'b101010};
	memory[6] = {6'b000100, 5'b00110, 5'b00000, 16'b0000000000000101};
    memory[7] = {6'b000000, 5'b00100, 5'b00101, 5'b00100, 5'b00000, 6'b100001};
    memory[8] = {6'b000000, 5'b00101, 5'b00011, 5'b00101, 5'b00000, 6'b100001};
    memory[9] = {6'b000000, 5'b00101, 5'b00010, 5'b00110, 5'b00000, 6'b101010};
    memory[10] = {6'b000101, 5'b00110, 5'b00000, 16'b1111111111111101};
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
initial begin //Set data memory values here
    data[0]=-20;
    data[1]=10;
    data[2]=2;
end
initial begin //Set initial values here
    PC = 0;
    state=0;
    invalid = 0;
    result = 0;
    ra = 31;
end

endmodule