module A5Q1_top;
    reg clk;
    reg [1:0] in;
    wire [3:0] state;
    A5Q1_fsm FSM (clk,in,state);


    always @(posedge clk) begin
        if($time) begin
            $display("Time=%d, Input=%b, Current State=%d",$time, in, state);
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
        in=2;
        #10;
        in=1;
        #10;
        in=0;
        #10;
        in=3;
        #10;
        in=1;
        #10;
        in=2;
        #10;
        in=1;
        #10;
        in=3;
        #10
        in=0;
                 
    end

endmodule