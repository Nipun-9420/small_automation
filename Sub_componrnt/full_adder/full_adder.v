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