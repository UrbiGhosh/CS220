module A2Q2_priority_encoder3to8 (number,encoding);
    input[7:0] number; 
    output[2:0] encoding;
    reg[2:0] encoding;


    always @(number) begin    
        if (number[0] == 1'b1) begin
            encoding = 3'b000;
        end 
        else if (number[1] == 1'b1) begin
            encoding = 3'b001;
        end
        else if (number[2] == 1'b1) begin
            encoding = 3'b010;
        end
        else if (number[3] == 1'b1) begin
            encoding = 3'b011;
        end
        else if (number[4] == 1'b1) begin
            encoding = 3'b100;
        end
        else if (number[5] == 1'b1) begin
            encoding = 3'b101;
        end
        else if (number[6] == 1'b1) begin
            encoding = 3'b110;
        end
        else begin
            encoding = 3'b111;
        end
    end

endmodule