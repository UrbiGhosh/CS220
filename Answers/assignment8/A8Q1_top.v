module top;
	reg clk;
	wire [2:0] state;
    wire [7:0] PC;
	processor mips(clk,state, PC);
    //always @(posedge clk) begin
    //    $display ("State: %d, PC: %d", state, PC);
    //end
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
