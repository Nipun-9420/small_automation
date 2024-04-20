

module home_auto_top_module(Lock_out,PA,light,light_out,TEMP,fan_out,FAN,AC,WIND);
    input [3:0]PA;
  input [3:0] light;
  output [3:0] light_out;
  output Lock_out;
  input [3:0]TEMP;//a
  output FAN,AC,WIND;
  output [3:0] fan_out;
home_auto_module module0(Lock_out,PA,light,light_out,TEMP,fan_out,FAN,AC,WIND);
endmodule


module home_auto_module(Lock_out,PA,light,light_out,TEMP,fan_out,FAN,AC,WIND);
  input [3:0]PA;
  input [3:0] light;
  output [3:0] light_out;
  
  output Lock_out;
  wire w0;
  wire [3:0] lw;
  
  input [3:0]TEMP;//a
  output FAN,AC,WIND;
  wire fw,aw,ww;
  wire wFAN,wAC,wWIND;
  
  output [3:0] fan_out;
  wire fwx;
  wire[3:0] wfan_out;
  
  //*****password
  pass_word pa0(PA,w0);
  buf b0(Lock_out,w0);
  light_controller lc0(light,lw);
  //****light
  and la0(light_out[0],lw[0],w0);
  and la1(light_out[1],lw[1],w0);
  and la2(light_out[2],lw[2],w0);
  and la3(light_out[3],lw[3],w0);
  //****** fan ac window controller
 
  AFW_cont AllC0(TEMP,fw,aw,ww);	
  and cca0(wFAN,w0,fw);
  and cca1(wAC,w0,aw);
  and cca2(wWIND,w0,ww);
  buf fnb(fwx,fw);
  buf b1(FAN,wFAN);
  buf b2(AC,wAC);
  buf b3(WIND,wWIND);
  //*************** fan speed
  fan_speed_cont fc0(TEMP,wfan_out);
  and fa0(fan_out[0],fwx,wfan_out[0],w0);
  and fa1(fan_out[1],fwx,wfan_out[1],w0);
  and fa2(fan_out[2],fwx,wfan_out[2],w0);
  and fa3(fan_out[3],fwx,wfan_out[3],w0);
endmodule

//---------------------------------------------PASS_WORD
module pass_word(A,Lock_out);
input [3:0]A;
output Lock_out;
wire [3:0]pass_v;
wire w0,w1,w2,w3;
set_pass_word pass_w(pass_v);
xnor x0(w0,A[0],pass_v[0]);
xnor x1(w1,A[1],pass_v[1]);
xnor x2(w2,A[2],pass_v[2]);
xnor x3(w3,A[3],pass_v[3]);
and a1(Lock_out,w0,w1,w2,w3);
endmodule

module set_pass_word(pass);
      output[3:0]pass;
  reg [3:0]pass_value =4'b0010;
      assign pass =pass_value;
endmodule
//----------------------------------------------------LIGHT
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
      xor x1(w1,B[1],1'b1);
      xor x2(w2,B[2],1'b1);
      xor x3(w3,B[3],1'b1);
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
  
  module light_controller(light,light_out);
  input [3:0] light;
  output [3:0] light_out;
  wire [3:0]w0;wire [3:0]w1;wire [3:0]w2;
  wire wc;//carry wire
  idle_light IT(w0);
    four_bit_substracter fs0(w0,light,light_out,wc);
  endmodule
//---------------------------------AC_FAN_WINDOW_controller

/*
0000 -->      18 °C
0001 -->      19 °C
0010 -->      20 °C    FAN OFF AC OFF  Window_off
0011 -->      21 °C
0100 -->      22 °C
0101 -->      23 °C
0110 -->      24 °C______________________________
0111 -->      25 °C
1000 -->      26 °C
1001 -->      27 °C    FAN ON AC OFF  Window on
1010 -->      28 °C______________________________
1011 -->      29 °C
1100 -->      30 °C
1101 -->      31 °C    FAN OFF AC_ON  Window_off
1110 -->      32 °C
1111 -->      33 °C

*/
//  this code will take decision wheather to open or close the window,AC,FAN
module AFW_cont(TEMP,FAN,AC,WIND);
input [3:0]TEMP;//a
output  FAN,AC,WIND;
wire [3:0] low_ac;
wire w0,w1,w2,w3,w4,w5,w6,w7,w8;
not n0(w5,TEMP[0]);
not n1(w6,TEMP[1]);
not n2(w7,TEMP[3]);
not n3(w8,TEMP[2]);
and a0(w0, TEMP[3],TEMP[2]);
and a1(w1, TEMP[3],TEMP[1],TEMP[0]);
and a2(w2, w5, TEMP[1],TEMP[2]);
and a3(w3, w6, TEMP[2]);
and a4(w4, w7, w8);
or o0(AC,w0,w1,w2,w3,w4);
not n4 (FAN,AC);
not n5 (WIND,AC);
endmodule
//------------------------------------------fan_speed controller

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
    four_bit_substracter fs1(temp,w0,fan_out,wc);
  endmodule

  module idle_temp(temp);
      output[3:0]temp;
    reg [3:0]temp_value =4'b0110;//--24 °C//6
      assign temp =temp_value;
  endmodule



 
