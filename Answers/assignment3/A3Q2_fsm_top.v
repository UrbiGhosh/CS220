module A3Q2_fsm_top;
    reg clk;
    reg in;
    wire out;
    A3Q2_fsm A3Q2_fsm1 (clk,in,out);


    always @(negedge clk) begin
        if($time) begin
            $display("Time=%d, Input=%b, Output=%b",$time, in, out);
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
        #100;
        $finish;
    end      

    initial begin
        #3;
        in=0;
        #10;
        in=1;
        #10;
        in=0;
        #10;
        in=1;
        #10;
        in=0;
        #10;
        in=1;
        #10;
        in=1;
        #10;
        in=0;
        #10;
        in=1;
        #10;
        in=0;
        #10
        in=1;
                 
    end

endmodule