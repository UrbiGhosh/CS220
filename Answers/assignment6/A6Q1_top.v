module A6Q1_top;
    reg [4:0] r_add1 [0:8];
    reg [4:0] r_add2 [0:8];
    reg [4:0] w_add [0:8];
    reg clk;
    reg [15:0] data [0:8];
    reg [2:0] inst [0:8];

    wire signed [15:0] read1, read2;
    wire done;
    reg [4:0] i;
   A6Q2_face I(clk, r_add1[i], r_add2[i], w_add[i], data[i], inst[i], read1, read2, done);

   always@(negedge clk) begin
       if(done ==1) begin
       case (inst[i])
            3'b001: $display("time:%d, Address : %d, Value = %d\n", $time, r_add1[i], read1);
            3'b010: $display("time:%d, Address : %d, Value = %d, Address : %d, Value = %d\n", $time, r_add1[i], read1, r_add2[i], read2);
            3'b011: $display("time:%d, Address : %d, Value = %d\n", $time, r_add1[i], read1);
            3'b100: $display("time:%d, Address : %d, Value = %d, Address : %d, Value = %d\n", $time, r_add1[i], read1, r_add2[i], read2);
            3'b101: $display("time:%d, Address : %d, Value = %d\n", $time, w_add[i], read1);
            3'b110: $display("time:%d, Address : %d, Value = %d\n", $time, w_add[i], read1);
            3'b111: $display("time:%d, Address : %d, Value = %d\n", $time, w_add[i], read1);
        endcase
        i <= i + 1;
       end
        if(i == 9) begin
            $finish;
        end
   end

   initial begin
        forever begin
            clk = 0;
            #5;
            clk = 1;
            #5;
            clk = 0;
        end
    end

    initial begin
        i=0;
        inst[0] = 3'b000; w_add[0] = 1; data[0] = 17;
        inst[1] = 3'b011; r_add1[1] = 1; w_add[1] = 2; data[1] = -9;
        inst[2] = 3'b100; r_add1[2] = 1; r_add2[2] = 2; w_add[2] = 3; data[2] = 65;
        inst[3] = 3'b010; r_add1[3] = 2; r_add2[3] = 3;
        inst[4] = 3'b111; r_add1[4] = 3; w_add[4] = 5; data[4] = 3;
        inst[5] = 3'b101; r_add1[5] = 1; r_add2[5] = 2; w_add[5] = 4;
        inst[6] = 3'b111; r_add1[6] = 4; w_add[6] = 4; data[6] = 9;
        inst[7] = 3'b110; r_add1[7] = 5; r_add2[7] = 4; w_add[7] = 6;
        inst[8] = 3'b001; r_add1[8] = 6;
    end

endmodule