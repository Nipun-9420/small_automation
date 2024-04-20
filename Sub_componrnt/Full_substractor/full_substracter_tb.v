module test;
  reg [4:0]A,B;
  reg [5:0]D;
  reg Cout;
  integer i,j;
  five_bit_substracter DUV(A,B,D,Cout);

    initial 
      begin
    $dumpfile("dump.vcd");
    $dumpvars(1);
    //#100000;
    end
 
    initial 
    begin
      for (i =1 ;i<16 ;i++ ) 
        begin
          for (j =1 ;j<16 ;j++ ) 
            begin  
              if(i>=j)
                begin
                $display("A=%d,B=%d,D=%d",A,B,D);
                A = i;
                B = j;
                #10;
                end
            end
        enda
        $finish;
    end
endmodule   