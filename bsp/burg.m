function  [res]=burg()      

clc
close all
clear all

f1=0.1;f2=0.2;f3=0.3;
t=0:0.25:32;
x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),10);
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),20);
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),30);
x=x';% x=num2cell(x);
p=31; 

size=length(x);                                
e=zeros(size,p);
b=zeros(size,p);
a=zeros(p,p);
gamma=zeros(1,p);

e(1:size,1)=x;               
b(1:size,1)=x;

a(1,1)=(2*(e(2:size,1))'*b(1:size-1,1))/((e(1:size,1))'*e(1:size,1)+(b(1:size-1,1))'*b(1:size-1,1));
gamma(1,1)=a(1,1);
e(2:size,2)=e(2:size,1)+(gamma(1,1))'*b(1:size-1,1);
b(2:size,2)=b(1:size-1,1)+(gamma(1,1))'*e(2:size,1);

for  i=2:p                      
   a(i,i)=(2*(e(i+1:size,i))'*b(i:size-1,i))/((e(i+1:size,i))'*e(i+1:size,i)+(b(i:size-1,i))'*b(i:size-1,i));
   gamma(1,i)=a(i,i);

   e(i+1:size,i+1)=e(i+1:size,i)+(gamma(1,i))'*b(i:size-1,i);
   b(i+1:size,i+1)=b(i:size-1,i)+(gamma(1,i))'*e(i+1:size,i);
   
   for k=i-1:-1:1
       a(k,i)=a(k,i-1)+gamma(1,i)*(a(i-k,i-1))';
   end
end
res=a;
freqz(1,res)