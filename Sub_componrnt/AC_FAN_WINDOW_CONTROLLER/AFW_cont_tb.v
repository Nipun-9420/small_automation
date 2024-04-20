//AC_fan_window_controller_tb
module test;
reg [3:0]TEMP;
wire FAN,AC,WIND;
AFW_cont DUV(TEMP,FAN,AC,WIND);
integer i;
initial begin
    TEMP=0;
    #10;
end

initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end

initial 
begin
    for (i =0 ;i<16 ;i++ ) 
    begin
        $display("TEMP=%d,FAN=%d,AC=%d,WIND=%d",TEMP,FAN,AC,WIND);  
        TEMP<=i;
        #10;    
    end
end

endmodule
