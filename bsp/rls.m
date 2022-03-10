Lambda = 0.9 ; % Set the forgetting factor  
Delta = 0.004 ; % R initialized to Delta*I  
%#######################################################################
f1=0.1;f2=0.2;f3=0.3;
t=0:0.25:32;
x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),10);% Input 
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),20);
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),30);
%#######################################################################
[r,a,e] = ar_yw_coefficients();
h=a;
%#######################################################################
d=conv(x,h);  N=length(x);
d=d(1:N);
error=zeros(1,N);
%#######################################################################
% Initialize RLS  
M=length(h);
P=Delta*eye(M);  
w=zeros(M,1);  
% RLS Adaptation
for i =1:N-M+1 
u = x(i:+1:i+M-1);
u=u';
pi_=u'*P;  
k=Lambda + pi_*u;  
K=pi_'/k;                 %version 1
% K = P*u/k;                %version 2
e(i)=d(i)-w'*u;  
w=w+K*e(i);  
PPrime=K*pi_;  
P=(P-PPrime)/Lambda;  
w_err(i)=norm(h-w); 
error=error+(e(i))^2;
end
figure;semilogy(error,'M');  
freqz(1,w)