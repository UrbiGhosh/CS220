module top;
	reg clk;
	wire [2:0] state;

	processor mips(clk,state);

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
