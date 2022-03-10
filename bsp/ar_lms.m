function [r,a,e] = ar_lms(SNR)
f1 = 0.1;
f2 = 0.2;
f3 = 0.3;
M = 31;                         % degree of model
window=32;
SNR=10;
%#######################################################################
t = 0:.25:window;               % sampling frequency=4Hz for window of 32 point.
d = cos(2*pi*f1*t) + cos(2*pi*f2*t) + cos(2*pi*f3*t);
x = awgn(d,SNR);      % awgn measures the power of x before adding noise.
%#######################################################################
mu=.0125;
N = length(x);
w = zeros(1,M);     	

for n = M:N
   x1 = x(n:-1:n-M+1); 		% Select input for convolution             
   e(n) = d(n) - w * x1';		% Calculate error
   w = w + mu*e(n)*x1 ;          	% Adjust weights
   error(n)=error(n)+(e(n))^2;
end
    semilogy(error,'g'); 
    title('Weight Estimation Error-LMS');  
    xlabel('Iteration Number');  
    ylabel('Weight Error in dB'); 
%#######################################################################
%%%% Normalized LMS Algorithm
%#######################################################################
mu=0.01;
w=zeros(1,k);  % the filter coeffients vector;
error=zeros(1,N);
for n = M:N
   x1 = x(n:-1:n-M+1); 		% Select input for convolution             
   e(n) = d(n) - w * x1';		% Calculate error
   w = w + mu*e(n)*x1/(2+x1*x1') ;          	% Adjust weights     
   error(n)=error(n)+(e(n))^2;
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
  for j=M+1:N
    pred(j) = w * x(j-1:-1:j-M);
  end
  noise = [noise; x(M+1:end) - pred(M+1:end)];
end
sigma = var(noise);


s=1;
f=0:0.001:1;
for k=1:M
    s=s+w(k)*exp(-2i*pi*f*k);
end
SAR=(sigma)\abs(s).^2;
figure
plot(4*f,SAR)
xlim([0,2])

