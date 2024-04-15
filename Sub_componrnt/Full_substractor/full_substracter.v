module five_bit_substracter(A,B,D,Cout);
  input [4:0]A;
  input  [4:0]B;
  output [4:0]D;
  output Cout;
    wire w0,w1,w2,w3,w4,w5;
    wire c0,c1,c2,c3,c4,c5;
  xor x0(w0,B[0],1'b1);
    xor x1(w1,B[1],1);
    xor x2(w2,B[2],1);
    xor x3(w3,B[3],1);
    xor x4(w4,B[4],1);
  full_adder fa0(A[0],w0, 1'b1,D[0],c0);
    full_adder fa1(A[1],w1,c0,D[1],c1);
    full_adder fa2(A[2],w2,c1,D[2],c2);
    full_adder fa3(A[3],w3,c2,D[3],c3);
  full_adder fa4(A[4],w4,c3,D[4],Cout);
    
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