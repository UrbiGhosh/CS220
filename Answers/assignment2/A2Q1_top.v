module A2Q1_top;
    wire [7:0] intermediate;
    reg [2:0] in;
    wire [2:0] out;

    decoder3to8 decoder (in, intermediate);
    encoder8to3 encoder (intermediate, out);

    always @ (in or intermediate or out) begin
        $monitor("time=%d: %b decoded: %b encoded: %b \n", 
            $time, in, intermediate, out);
    end

    initial begin
        in = 0; 
        #1;
        in = 1; 
        #1;
        in = 2; 
        #1;
        in = 3; 
        #1;
        in = 4; 
        #1;
        in = 5; 
        #1;
        in = 6; 
        #1;
        in = 7; 
        #1;
    end

endmodule