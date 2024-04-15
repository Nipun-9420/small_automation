module test;
    reg A,B,Cin;
    reg Sum,Cout;
    full_adder DUV(A,B,Cin,Sum,Cout);
    integer i;
    initial 
    begin
        {A,B,Cin}<=0;
      #10;
    end

 initial begin
  $dumpfile("dump.vcd");
  $dumpvars(1);
end
  
    initial 
    begin
        for ( i = 0; i<8;i++ ) 
        begin
            {A,B,Cin}<=i;
            $display("A=%0d,B=%0d,Cin=%0d,Sum=%0d,Cout=%0d",A,B,Cin,Sum,Cout);
            #10;
        end    
    end
endmodule