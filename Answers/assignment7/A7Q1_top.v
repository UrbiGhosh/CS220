module A7Q1_top;
wire [3:0] increment=4'b0001;
wire [5:0] R_,I_, J_,three_, four_,five_,six_;
reg [31:0] instruction, memory[0:7];
reg clk;
reg  [5:0] pc = 0;

A7Q1_processors prs(instruction,clk,R_,J_,I_,three_,four_,five_,six_);
    always @(posedge clk)begin
        instruction=memory[pc];
        pc<=pc+increment;
        if(pc==8)begin
            $display("R =%d J =%d I =%d $3 =%d $4 =%d $5 =%d $6 =%d",R_,J_,I_,three_,four_,five_,six_);
            $finish;
        end
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
        memory[0]=32'b00100000000001000011010001010110;
        memory[1]=32'b00100000000001011111111111111111;
        memory[2]=32'b00000000101001000011000000100000;
        memory[3]=32'b00100000000000110000000000000111;
        memory[4]=32'b00000000011001100011000000000100;
        memory[5]=32'b00000000000000110001100001000010;
        memory[6]=32'b10001100100001011001101010111100; 
        memory[7]=32'b00001000000100100011010001010110;
    end
endmodule