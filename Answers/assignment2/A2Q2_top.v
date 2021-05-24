module A2Q2_top;
    reg[7:0] number;
    wire[2:0] encoding;
    priority_encoder8to3 priority_encoding(number, encoding);

    always @ (number) begin

        $monitor("time = %d: Encoding of %b is %b \n", $time, number, encoding);
    end

    initial begin
        number = 1; 
        #1;
        number = 2; 
        #1;
        number = 40; 
        #1;
        number = 8; 
        #1;
        number = 11; 
        #1;
        number = 32; 
        #1;
        number = 46; 
        #1;
        number = 64;   
        #1;
        number = 150; 
        #1;
        number = 100;
    end

endmodule