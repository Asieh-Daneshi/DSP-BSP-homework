function [r,a,e] = ar_yw_coefficients()  % coefficients of the AR model with the Yule-Walker equations
%#######################################################################
f1=0.1;f2=0.2;f3=0.3;
t=0:0.25:64;
x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),10);
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),20);
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),30);
N=size(x);
x=x';% x=num2cell(x);
M=59;                                            %order of the model
%#######################################################################
nsegments = length(x);
gamma = zeros(M,1); % autocorrelation, gamma_1 ... gamma_p
gamma_zero = 0;
mu = 0; % assume zero mean
%#######################################################################
for i=1:M
  for j=1:nsegments
    for k=1:length(x)-i;
      gamma(i) = gamma(i) + (x(k)-mu)*(x(k+i)-mu);         
    end;
  end
end

for i=1:nsegments
  gamma_zero = gamma_zero + (x-mu)'*(x-mu);
end
r=[gamma',gamma_zero];
gamma = gamma/gamma_zero;

R = toeplitz([1; gamma(1:M-1)]');        
w = pinv(R)*gamma;          %w=R'*r   

a=[1;-w]; 
residuals = [];

for i=1:nsegments
  pred = zeros(length(x),1);
  for j=M+1:length(x)
    pred(j) = w' * x(j-1:-1:j-M);
  end
  residuals = [residuals; x(M+1:end) - pred(M+1:end)];
end

e = var(residuals);
r=r';
%#######################################################################
% s=0;
% f=0:0.001:1;
% for k=1:M
%     s=s-w(k)*exp(-2*sqrt(-1)*pi*f*k);
% end
% s=s+1;
% s=abs(s);
% s=s.^2;
% Paf=1./s; 
% Paf=10*log10(Paf); plot(4*f,Paf); 
% title('Yule-Walker');  
% xlabel('Normalized Frequency  (\times\pi rad/sample)');  
% ylabel('Magnitude (dB)'); 
% xlim([0,2])