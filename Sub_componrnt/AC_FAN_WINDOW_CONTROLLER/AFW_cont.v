// Code your design here
/*
AC_FAN_WINDOW_controller
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
output reg FAN,AC,WIND;
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
