function [] = arburg(hg)
%#######################################################################
f1=0.1;f2=0.2;f3=0.3;
t=0:0.25:64;
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),10);
% x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),20);
x=awgn(cos(2*pi*f1*t)+cos(2*pi*f2*t)+cos(2*pi*f3*t),hg);
x=x';% x=num2cell(x);
p=59; 
N  = length(x);
%#######################################################################
% Initialization
ef = x;
eb = x;
a = 1;
% Initial error
E = x'*x./N;
% Preallocate 'k' 
k = zeros(1, p);
%#######################################################################
for m=1:p
   % Calculate the next order reflection (parcor) coefficient
   efp = ef(2:end);
   ebp = eb(1:end-1);
   num = -2.*ebp'*efp;
   den = efp'*efp+ebp'*ebp;
   k(m) = num ./ den;
   % Update the forward and backward prediction errors
   ef = efp + k(m)*ebp;
   eb = ebp + k(m)'*efp; 
   % Update the AR coeff.
   a=[a;0] + k(m)*[0;conj(flipud(a))];
   % Update the prediction error
   E(m+1) = (1 - k(m)'*k(m))*E(m);
end
w=[1;a];
%#######################################################################
subplot(1,3,hg/10);
freqz(1,a)
% s=0;
% f=0:0.001:1;
% for k=1:p
%     s=s-w(k)*exp(-2*sqrt(-1)*pi*f*k);
% end
% s=s+1;
% s=abs(s);
% s=s.^2;
% Paf=1./s; 
% Paf=10*log10(Paf);
% figure;plot(4*f,Paf);
% title('Burg');  
% xlabel('Normalized Frequency  (\times\pi rad/sample)');  
% ylabel('Magnitude (dB)'); 
% xlim([0,2])