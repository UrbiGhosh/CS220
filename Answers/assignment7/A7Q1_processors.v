module A7Q1_processors(instruction[31:0],clk,R_[5:0],J_[5:0],I_[5:0],three_[5:0],four_[5:0],five_[5:0],six_[5:0]);
wire [3:0] increment=4'b0001;
output [5:0] R_,J_,I_,three_,four_,five_,six_;
reg [5:0] R_=0,J_=0,I_=0,three_=0,four_=0,five_=0,six_=0;

input [31:0] instruction;
input clk;

always @(posedge clk)begin
#2
    if (instruction[31:26]==6'd0) begin
        R_<=R_+increment;
        case(instruction[15:11])
            6'd3: three_<=three_+increment;
            6'd4: four_<=four_+increment;
            6'd5: five_<=five_+increment;
            6'd6: six_<=six_+increment;
        endcase
    end
    else if(instruction[31:26]==6'd2 || instruction[31:26]==6'd3) begin
        J_<=J_+increment;
    end
    else begin
        I_<=I_+increment;
        case(instruction[20:16])
            6'd3: three_<=three_+increment;
            6'd4: four_<=four_+increment;
            6'd5: five_<=five_+increment;
            6'd6: six_<=six_+increment;
        endcase
    end
end 
endmodule