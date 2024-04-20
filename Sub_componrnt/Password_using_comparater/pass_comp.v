//-----------------when 3 bit inout is correct then it will go to 1
//-----------------when 3 bit inout is wrong then it will go to 0
module pass_word(A,Lock_out);
input [3:0]A;
output Lock_out;
wire [3:0]pass_v;
wire w0,w1,w2;
set_pass_word pass_w(pass_v);
xnor x0(w0,A[0],pass_v[0]);
xnor x1(w1,A[1],pass_v[1]);
xnor x2(w2,A[2],pass_v[2]);
and a1(Lock_out,w0,w1,w2);
endmodule

  module set_pass_word(pass);
      output[3:0]pass;
    reg [3:0]pass_value =4'b1010;//--24 °C//6
      assign pass =pass_value;
  endmodule