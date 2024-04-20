module test;
reg [3:0] temp;
wire [3:0] fan_out;
fan_speed_cont DUV(temp,fan_out);

    initial 
      begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    end

    initial begin
        temp = 4'b0111 ; #10;
        temp = 4'b1000 ; #10;
        temp = 4'b1001 ; #10;
        temp = 4'b1010 ; #10;
        temp = 4'b1011 ; #10;
        temp = 4'b1100 ; #10;
        temp = 4'b1101 ; #10;
        #10;
    end
endmodule