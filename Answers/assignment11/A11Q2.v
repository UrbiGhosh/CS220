module divider(clk,in,dividend,divisor,l1,l2,flag,quotient,remainder,add_count,sub_count);

input clk;
input in;
input [31:0] dividend,divisor;
input [6:0] l1;
input [6:0] l2;


output [31:0] quotient;
output [8:0] add_count;
output [8:0] sub_count;
output signed [31:0] remainder;
output flag;

reg [31:0] d;
reg [31:0] quotient;
reg [8:0] add_count;
reg [8:0] sub_count;
reg signed [31:0] remainder;
reg flag;
reg [4:0] i;


always @(posedge clk) begin
  if(l1<l2)begin
    quotient<=0;
    remainder<=dividend;
    add_count<=0;
    sub_count<=0;
    flag<=1;
    i<=0;
  end
  else begin

  if (in==1) begin
    remainder <=dividend;
    quotient<=0;
    i<=0;
    add_count<=0;
    sub_count<=0;
    d <= divisor << (l1-l2);
    flag<=0;
  end
  else begin
    if(remainder>=0) begin
        remainder=remainder-d;
        sub_count=sub_count+1;
        quotient = (quotient<<1)|1;
  end
    else begin
        remainder = remainder + d;
        add_count=add_count+1;
        quotient = quotient^1'b1;
        quotient = (quotient<<1)|1;
    end

    d = d>>1;
    i=i+1;

    if(i==(l1-l2+1)) begin
      if(remainder>=0) begin
      flag=1;
      end
      else begin
        remainder=remainder+divisor;
        add_count=add_count+1;
        quotient = quotient^1'b1;
        flag=1;
      end
    end
    else begin
        flag<=0;
    end  

    end
end

end
initial begin
  #1
  flag=1;
end

endmodule
module top;

reg clk;
reg in=1;
reg [31:0] dividend,divisor;
reg [31:0] A [0:10], B [0:10];
reg [6:0] L1[0:10],  L2[0:10];

wire [31:0] quotient;
wire signed [31:0] remainder;
wire flag;
wire [8:0] add_count, sub_count;
reg [6:0] i = 0;
divider D(clk,in,A[i],B[i],L1[i],L2[i],flag,quotient,remainder,add_count,sub_count);


always @(negedge clk) begin
    if(flag==1) begin
        if(i!=0) begin
            $display("Dividend =%d, Divisor =%d, Quotient=%d, Remainder =%d, Number of additions=%d, Number of Subtractions=%d",A[i],B[i],quotient,remainder,add_count,sub_count);
        end
        in<=1;
        i<=i+1;
        if(i==10) begin
            $finish;
        end

    end
    else begin
        in<=0;
    end
end

initial begin
//Ignore the first input, we do not use it, we start displaying from i=1
A[0]=1; 
B[0]=1; 
L1[0]=1; 
L2[0]=1;

A[1]=5; 
B[1]=2; 
L1[1]=3; 
L2[1]=2;

A[2]=6; 
B[2]=3; 
L1[2]=3; 
L2[2]=2;

A[3]=32; 
B[3]=31; 
L1[3]=6;
L2[3]=5;

A[4]=16;
B[4]=9;
L1[4]=5;
L2[4]=4;

A[5]=256;
B[5]=33;
L1[5]=9;
L2[5]=6;

A[6]=128;
B[6]=25;
L1[6]=8;
L2[6]=5;

A[7]=121;
B[7]=7;
L1[7]=8;
L2[7]=3;

A[8]=0;
B[8]=6;
L1[8]=1;
L2[8]=3;

A[9]=41;
B[9]=68;
L1[9]=6;
L2[9]=7;

A[10]=3;
B[10]=3;
L1[10]=2;
L2[10]=2;
end


initial begin
    forever begin
    clk=1;
    #5
    clk=0;
    #5;
    clk=1;
    end 
end

endmodule

