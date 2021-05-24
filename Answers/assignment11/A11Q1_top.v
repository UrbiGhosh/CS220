module top;
    reg clk,next;
    reg [5:0] i ;
    reg signed [31:0] A[0:9], B[0:9];

    wire flag;
    wire [6:0] p,q;
    wire signed [63:0] product;

    booth  F(clk, next, A[i], B[i], product, p, q, flag);
    always @(negedge clk) begin
        if(flag==1 && $time) begin
            $display("Time:%d, Multiplicand = %d, Multiplier = %d, Product = %d, Count of additions = %d , Count of Subtractions = %d", $time, A[i], B[i], product, p, q);
            if(i == 9) begin
                $finish;
            end
            i<=i+1;
            next<= 1;
        end
        next<= 0;
    end

    initial begin
        i=0;
        A[0] = 158; 
        B[0] = 23;
        A[1] = 991; 
        B[1] = -88;
        A[2] = 4157; 
        B[2] = 80;
        A[3] = -90; 
        B[3] = 298;
        A[4] = 1900; 
        B[4] = 70;
        A[5] = -5; 
        B[5] = 80;
        A[6] = 94; 
        B[6] = 99;
        A[7] = -526; 
        B[7] = -1000;
        A[8] = -454; 
        B[8] = -2;
        A[9] = 1; 
        B[9] = 6;
    end
    initial begin
        forever begin
            clk = 0;
            #5
            clk = 1;
            #5
            clk = 0;
        end
    end
endmodule
