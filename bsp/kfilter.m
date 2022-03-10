function [G,k] = kfilter()
clc
clear
M=29;
w=zeros(M,1);
f1=0.1;f2=0.2;f3=0.3;
t=0:0.25:32;
% y=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),10);
% y=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),20);
y=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),30);
N=size(y);
x=conj(w);
A=eye(M);
C=y';
V1=rand(M)*eye(M);
V2=rand(1,N)*eye(N,N);
m=max(size(A));
k0=.01*eye(m);
dd=1;
it=1;
maxit=1000;
  while (dd>1e-8 && it<=maxit);
    G0= (A*k0*C')/(V2+C*k0*C');
    k1= A*k0*A' + V1 -G0*C*k0*A';
    G1= (A*k1*C')/(V2+C*k1*C');
    dd=max(max(abs(G1-G0)));
    it=it+1;
    k0=k1;
  end
  G=G1;k=k0;