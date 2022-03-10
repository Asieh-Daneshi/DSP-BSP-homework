clear all;
%#######################################################################
f1=0.1;f2=0.2;f3=0.3;
t=0:0.25:32;
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),10);
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),20);
x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),30);
%#######################################################################
mu=0.01;
[r,a,e] = ar_yw_coefficients();
h=a';
d=conv(x,h);
N=length(x);
d=d(1:N);
k=length(h);   % k is the order of the fikter;
w=zeros(1,k);   % the filter coeffients vector;
error=zeros(1,N);
%#######################################################################
for i=1:N-k
    u=x(i:+1:i+k-1);  % intercept the input vector;
% for i=k:N
%     u=x(i:-1:i-k+1);  % intercept the input vector;
    e=d(i)-w*u';
    w=w+mu*u*e;
    error(i)=error(i)+(e)^2;
end;
w_k=[1;-w'];
    figure;semilogy(error,'g');        %Semilogarithmic plots
    xlabel('Iteration Number');
    hold on
%#######################################################################
%%%% Normalized LMS Algorithm
%#######################################################################
mu=0.01;
w=zeros(1,k);  % the filter coeffients vector;
error=zeros(1,N);
for i=1:N-k
    u=x(i:+1:i+k-1);  % intercept the input vector;
% for i=k:N
%     u=x(i:-1:i-k+1);  % intercept the input vector;
    e=d(i)-w*u';
    w=w+mu*e*u/(3+u*u');          %a=3
    error(i)=error(i)+e^2;
end;
    semilogy(error,'M'); 
    title('Weight Estimation Error-LMS');  
    xlabel('Iteration Number');  
    ylabel('Weight Error in dB'); 
%######################################################################
x=x'; 
noise = [];
for i=1:N
  pred = zeros(N,1);
  for j=k+1:N
    pred(j) = w * x(j-1:-1:j-k);
  end
  noise = [noise; x(k+1:end) - pred(k+1:end)];
end
sigma = var(noise);
s=1;
f=0:0.001:1;
for k=1:k
    s=s+w(k)*exp(-2i*pi*f*k);
end
SAR=(sigma)\abs(s).^2;
figure
plot(4*f,SAR)
xlim([0,2])
   