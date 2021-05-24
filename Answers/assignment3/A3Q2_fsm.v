module A3Q2_fsm(clk,in,out);
    input clk,in;
    output out;
    reg out=0;
    reg[1:0] state = 2'b00;
    always @(posedge clk )
    begin
            if(state == 2'b01) begin
                if(in == 1'b1) begin
                    state = 2'b10;
                    out = 1;
                end
                else begin
                    state = 2'b11;
                    out = 0;
                end
            end
            else if(state == 2'b10) begin
                if(in == 1'b0) begin
                    state = 2'b01;
                    out = 1;
                end
                else begin
                    state = 2'b11;
                    out = 0;
                end
            end
            else if(state == 2'b00) begin
                if(in == 1'b0) begin
                    state = 2'b01;
                    out = 1;
                end
                else begin
                    state = 2'b10;
                    out = 0;
                end
            end
            else begin 
                out = 0;
            end
                 
       end

endmodule