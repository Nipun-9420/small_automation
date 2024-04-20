  // it will take data from temperature sencer in analog and sent to adc and then send to substrater
  //whill will complare room temp with ideal temp
  //that diff will be add to normal seed and then it isgivem to fan spped controller
  // Code your design here
  /*
    AC_FAN_WINDOW_controller
  0   0000 -->      18 °C
  1   0001 -->      19 °C
  2   0010 -->      20 °C    FAN OFF AC OFF  Window_off
  3   0011 -->      21 °C
  4   0100 -->      22 °C
  5   0101 -->      23 °C
  6   0110 -->      24 °C______________________________
  7   0111 -->      25 °C
  8   1000 -->      26 °C
  9   1001 -->      27 °C    FAN ON AC OFF  Window on
  10  1010 -->      28 °C______________________________
  11  1011 -->      29 °C
  12  1100 -->      30 °C
  13  1101 -->      31 °C    FAN OFF AC_ON  Window_off
  14  1110 -->      32 °C
  15  1111 -->      33 °C

  */
  module fan_speed_cont(temp,fan_out);
  input [3:0] temp;
  output [3:0] fan_out;
  wire [3:0]w0;wire [3:0]w1;wire [3:0]w2;
  wire wc;//carry wire
  idle_temp IT(w0);
    four_bit_substracter(temp,w0,fan_out,wc);
  endmodule

  module idle_temp(temp);
      output[3:0]temp;
    reg [3:0]temp_value =4'b0110;//--24 °C//6
      assign temp =temp_value;
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