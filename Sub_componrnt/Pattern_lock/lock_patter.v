//----------PSTER UNLOCK 110
module lOCK(in,clk,out,rst,Lock,Lock_out);//Lock_out:- desision oputput wheather to lock or not
    input in,clk,rst,Lock;
    output out,Lock_out;
      wire w1,w2;
      wire IIN,l0,l1,l2,l3,l4,l5,l6,l7,l8,l9;
      not n1(w1,in);
      d_ff f1(w2,w5,w1,rst,clk);
      and a1(w3,w2,in);
      d_ff f2(w4,w6,w3,rst,clk);
      and(out,x,w4);
      buf b1(IIN,out);  
//    d_ff(q,qbar,d,rst,clk);   
      d_ff D0(l4,l5,l3,rst,clk);
      d_ff D1(l8,l7,l6,rst,clk);
      not Dn0(l0,Lock);
      and DA0(l1,IIN,l0);
      and DA1(l2,l0,l4,l7);
      or DO0(l3,l1,l2);
      and DA3(l9,l0,l5);
      or DO1(l6,Lock,l9);
  and DA4(Lock_out,l4,l7);
    endmodule
    /*
    module counter(clk,rst,d_out) ;
        input clk,rst;
        output reg[1:0] d_out;
          wire w1;
        reg sig =1;
        t_ff t1(d_out[0],w1,sig,rst,clk);
        t_ff t2(d_out[1],qbar,sig,rst,w1);
      endmodule
    */
      module t_ff(q,qbar,t,rst,clk);
         input t,clk,rst;
          output q, qbar;
        wire w1;
        xor(w1,t,q);
        d_ff DD(q,qbar,w1,rst,clk);
      endmodule
    
      module d_ff(q,qbar,d,rst,clk);
          input d,clk,rst;
          output q, qbar;
          wire w1,w2;
        nd_ff_latch m1	(w1,w2,rst,d,clk);
        d_ff_latch m2  (q,qbar,rst,w1,clk);
    
          endmodule
      module d_ff_latch(q,qbar,rst,d,clk);
          input d,clk,rst;
          output q, qbar;
          wire dbar; //output of not1
          wire nand1_out; // output of nand1
          wire nand2_out; // output of nand2
        wire rstn;
        not(rstn,rst);
          not ( dbar,d); 
          nand (nand1_out,rstn,clk,d);
          nand (nand2_out,rstn,clk,dbar);
            nand (q,qbar,rstn,nand1_out);
            nand (qbar,rstn,q,nand2_out);
          endmodule
    
      module nd_ff_latch(q,qbar,rst,d,nclk);
          input d,nclk,rst;
          output q, qbar;
            wire rstn;
          not(rstn,rst);
          wire dbar; //output of not1
          wire nand1_out; // output of nand1
          wire nand2_out; // output of nand2
          wire clk;
          not (clk,nclk);
          not ( dbar,d); 
          nand (nand1_out,rstn,clk,d);
          nand (nand2_out,rstn,clk,dbar);
            nand (q,qbar,rstn,nand1_out);
            nand (qbar,rstn,q,nand2_out);
          endmodule