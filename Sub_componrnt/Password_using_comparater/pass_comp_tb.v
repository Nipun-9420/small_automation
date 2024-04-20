module test;
reg [3:0]A;
wire Lock_out;
pass_word DUV(A,Lock_out);

initial begin
  A = 4'b0000 ; #10;
  A = 4'b0001 ; #10;
  A = 4'b0110 ; #10;
  A = 4'b1010 ; #10;
  A = 4'b0000 ; #10;
  A = 4'b1010 ; #10;
end
endmodule