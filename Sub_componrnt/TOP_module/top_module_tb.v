module test;
  reg [3:0]PA;
wire Lock_out;
  
  reg [3:0] light;
  wire [3:0] light_out;
  
reg [3:0]TEMP;
//wire FAN,AC,WIND;
  
  
wire [3:0] fan_out;
  top_module DUV(Lock_out,PA,light,light_out,TEMP,fan_out,FAN,AC,WIND);
initial 
  begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
 end

initial 
  begin
  PA <= 4'b0000 ; #10;
  PA <= 4'b0001 ; #10;
  PA <= 4'b0110 ; #10;
  PA <= 4'b1110 ; #10;  
  PA <= 4'b0010 ; //#10; 
   
        light <= 4'b0000 ;TEMP<=0101; #10;
        light <= 4'b0001 ;TEMP<=0110; #10;
        light <= 4'b0010 ;TEMP<=0111; #10;
        light <= 4'b0011 ;TEMP<=1000; #10;
        light <= 4'b0100 ;TEMP<=1001; #10;
        light <= 4'b0101 ;TEMP<=1010; #10;
        light <= 4'b0110 ;TEMP<=1011; #10;
        light <= 4'b0111 ;TEMP<=1100; #10;
  $finish;
end
endmodule