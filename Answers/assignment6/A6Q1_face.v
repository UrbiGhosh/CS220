module A6Q2_face(clk, r_add1, r_add2, w_add, data, inst, read1, read2, done);
    input [4:0] r_add1,r_add2,w_add;
    input clk;
    input [15:0] data;
    input [2:0] inst;

    output [15:0] read1, read2;
    output done;
    reg [15:0] read1, read2;
    reg done;

    reg [4:0] counter;
    reg [15:0] write_data;
    reg [15:0] file [0:31];

    always @(posedge clk) begin
        case (inst)
            3'b000: begin
                if(counter == 1) begin
                    file[w_add] = data;
                    counter = 0;
                    done = 1;
                end
                else begin
                    done = 0;
                    counter = counter + 1;
                end
            end
            3'b001: begin
                if(counter == 1) begin
                    read1 = file[r_add1];
                    done = 1;
                    counter = 0;
                end
                else begin
                    done = 0;
                    counter = counter + 1;
                end
            end
            3'b010: begin
                if(counter == 1) begin
                    read1 = file[r_add1];
                    read2 = file[r_add2];
                    done = 1;
                    counter = 0;
                end
                else begin
                    done = 0;
                    counter = counter + 1;
                end
            end
            3'b011: begin
                if(counter == 1) begin
                    read1 = file[r_add1];
                    file[w_add] = data;
                    counter = 0;
                    done = 1;
                end
                else begin
                    done = 0;
                    counter = counter + 1;
                end
            end
            3'b100: begin
                if(counter == 1) begin
                    read1 = file[r_add1];
                    read2 = file[r_add2];
                    file[w_add] = data;
                    done = 1;
                    counter = 0;
                end
                else begin
                    done = 0;
                    counter = counter + 1;
                end
            end
            3'b101: begin
                if(counter < 1) begin
                    read1 = file[r_add1];
                    read2 = file[r_add2];
                    counter = counter + 1;
                    done = 0;
                end
                else if (counter < 17) begin
                    write_data = read1 + read2;
                    counter = counter + 1;
                    done = 0;
                end
                else if (counter < 19) begin
                    file[w_add] = write_data;
                    read1 = write_data;
                    counter = counter + 1;
                    done = 0;
                end
                else begin
                    read1 = write_data;
                    counter = 0;
                    done = 1;
                end
            end
            3'b110: begin
                if(counter < 1) begin
                    read1 = file[r_add1];
                    read2 = file[r_add2];
                    counter = counter + 1;
                    done =0;
                end
                else if (counter < 17) begin
                    write_data = read1 - read2;
                    counter = counter + 1;
                    done =0;
                end
                else if (counter < 19) begin
                    file[w_add] = write_data;
                    read1 = write_data;
                    counter = counter + 1;
                    done =0;
                end
                else begin
                    read1 = write_data;
                    counter = 0;
                    done = 1;
                end
            end
            3'b111: begin
                if(counter < 1) begin
                    read1 = file[r_add1];
                    counter = counter + 1;
                    done =0;
                end
                else if (counter < 17) begin
                    write_data = read1<<data;
                    counter = counter + 1;
                    done =0;
                end
                else if (counter < 19) begin
                    file[w_add] = write_data;
                    read1 = write_data;
                    counter = counter + 1;
                    done = 0;
                end
                else begin
                    read1 = write_data;
                    counter = 0;
                    done = 1;
                end
            end
            default: done = 0;
        endcase
    end


    initial begin
        counter = 0;
        file[0]=0;
        file[1]=0;
        file[2]=0;
        file[3]=0;
        file[4]=0;
        file[5]=0;
        file[6]=0;
        file[7]=0;
        file[8]=0;
        file[9]=0;
        file[10]=0;
        file[11]=0;
        file[12]=0;
        file[13]=0;
        file[14]=0;
        file[15]=0;
        file[16]=0;
        file[17]=0;
        file[18]=0;
        file[19]=0;
        file[20]=0;
        file[21]=0;
        file[22]=0;
        file[23]=0;
        file[24]=0;
        file[25]=0;
        file[26]=0;
        file[27]=0;
        file[28]=0;
        file[29]=0;
        file[30]=0;
        file[31]=0;
    end

endmodule