//----------------TB
module test;
  reg [3:0] light;
  wire [3:0] light_out;
light_controller DUV(light,light_out);

    initial 
      begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    end

    initial begin
        light = 4'b0000 ; #10;
        light = 4'b0001 ; #10;
        light = 4'b0010 ; #10;
        light = 4'b0011 ; #10;
        light = 4'b0100 ; #10;
        light = 4'b0101 ; #10;
        light = 4'b0110 ; #10;
        light = 4'b0111 ; #10;
        #10;
    end
endmodule