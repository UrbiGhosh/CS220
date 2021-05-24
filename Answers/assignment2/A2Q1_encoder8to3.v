module A2Q1_encoder8to3 (in, encoding);
    input[7:0] in;
    output[2:0] encoding;
    reg[2:0] encoding;
    always @(in) begin
        if (in == 8'b00000001) begin
            encoding = 3'b000;
        end
        else if (in == 8'b00000010) begin
            encoding = 3'b001;
        end
        else if (in == 8'b00000100) begin
            encoding = 3'b010;
        end
        else if (in == 8'b00001000) begin
            encoding = 3'b011;
        end
        else if (in == 8'b00010000) begin
            encoding = 3'b100;
        end
        else if (in == 8'b00100000) begin
            encoding = 3'b101;
        end
        else if (in == 8'b01000000) begin
            encoding = 3'b110;
        end
        else begin
            encoding = 3'b111;
        end
    end
endmodule