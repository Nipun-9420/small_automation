//--------------RTL
// iteal room light 10,000 lumens
  /*
    light controller
  0   0000 -->      6000 lumens
  1   0001 -->      6500 lumens
  2   0010 -->      7000 lumens    
  3   0011 -->      7500 lumens
  4   0100 -->      8000 lumens
  5   0101 -->      8500 lumens
  6   0110 -->      9000 lumens______________________________
  7   0111 -->      9500 lumens
  8   1000 -->      10,000 lumens
  9   1001 -->      10,500 lumens    FAN ON AC OFF  Window on
  10  1010 -->      11,000 lumens______________________________
  11  1011 -->      11,500 lumens
  12  1100 -->      12,000 lumens
  13  1101 -->      12,500 lumens    FAN OFF AC_ON  Window_off
  14  1110 -->      13,000 lumens
  15  1111 -->      13,200 lumens

  */
  module light_controller(light,light_out);
  input [3:0] light;
  output [3:0] light_out;
  wire [3:0]w0;wire [3:0]w1;wire [3:0]w2;
  wire wc;//carry wire
  idle_light IT(w0);
    four_bit_substracter(w0,light,light_out,wc);
  endmodule

  module idle_light(light);
      output[3:0]light;
    reg [3:0]light_value =4'b1000;//--24 °C//6
      assign light =light_value;
  endmodule

  module four_bit_substracter(A,B,D,Cout);
    input [3:0]A;
    input  [3:0]B;
    output [3:0]D;
    output Cout;
      wire w0,w1,w2,w3,w4,w5;
      wire c0,c1,c2,c3,c4,c5;
      xor x0(w0,B[0],1'b1);
      xor x1(w1,B[1],1);
      xor x2(w2,B[2],1);
      xor x3(w3,B[3],1);
    full_adder fa0(A[0],w0, 1'b1,D[0],c0);
      full_adder fa1(A[1],w1,c0,D[1],c1);
      full_adder fa2(A[2],w2,c1,D[2],c2);
      full_adder fa3(A[3],w3,c2,D[3],Cout);
      
  endmodule

  module full_adder(A,B,Cin,Sum,Cout);
    input A,B,Cin;
    output Sum,Cout;
    wire w1,w2,w3;
    xor sum(Sum,A,B,Cin);
    and a1(w1,A,B);
    and a2(w2,B,Cin);
    and a3(w3,A,Cin);
    or o1(Cout,w1,w2,w3);
  endmodule