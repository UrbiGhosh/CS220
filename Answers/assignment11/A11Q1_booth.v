module booth( clk, next, A,B, product, p, q, flag);
    input signed [31:0] A;
    input signed [31:0] B;
    input clk;
    input next;

    output flag;
    output [6:0] p;
    output [6:0] q;
    output signed [63:0] product;
    reg flag;
    reg [6:0] p;
    reg [6:0] q;
    reg signed [63:0] product;
    
    
    reg bit_store;
    reg [6:0] index;

    always @(next) begin
        index<=0;
        product<=0;
        bit_store<=0;
        flag<=0;
        p<=0;
        q<=0;
    end

    always @(posedge clk) begin
        if (bit_store==0 && B[index]==1) begin
                product<=product-(A<<index);
                q<=q+1;
        end
        else if (bit_store==1 && B[index]==0) begin
                product<= product+(A<<index);
                p<=p+1;
        end
        if ((index==31)|| (B >>> index ==-1)||(B >>> index==0))begin
            flag<=1;
        end
        bit_store <= B[index];
        index <= index + 1;
    end
    initial begin   
        flag=1;
    end
endmodule

